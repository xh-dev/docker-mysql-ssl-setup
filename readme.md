This is only a sample project to startup mysql with ssl enable through the docker compose.
Since I need a mysql:5.7.40 version of mysql, so that version is quite old. Please modify the docker-compose.yml for the latest version of mysql(Not tested, but susppose works well too).


# Scripts
## gen-ssl.sh
This shell script file create ssl certificates(main script from (link)[https://docs.cpanel.net/knowledge-base/security/how-to-configure-mysql-ssl-connections/]) for the mysql server.
By executing the script, all the ssl certificates (ca key, ca cert, server key, server cert, client key, client cert) will output under directory "ssl/certs". 

The script require one parameter input for the targeting domain name.
let say passing the domain name as "example.com" (executing script as "./gen-ssl.sh example.com")

|cert|issue to| issue by|
|--- |--- |---|
|ca-cert.pem|root.example.com| N/A(self signing)|
|server-cert.pem|mysql.example.com| root.example.com|
|client-cert.pem|client.example.com| root.example.com|

To customize the certificates, please modify "ssl/run.sh".

## copy-certs.sh
This shell script simply copy the generated certs from "ssl/certs" to "mysql/certs"

## init-config-mysql-pma.sh
This shell script generate the "docker-compose.yml" file. 
Since ssl-mode for pma (PhpMyAdmin) need to point to the correct domain name that the certificates is issuing to. The script require one parameter inpu for the targeting domain name as the "gen-ssl.sh". 

The pma wil create connection to mysql.{hostname} in docker network and verify ca during setup connection.

## start-mysql-pma-services.sh
This shell script start update the docker service (provided that the docker-compose.yml is generated through init-config-mysql-pma.sh). The purpose of having this script is only to ensure the directories required is ready before the service start and also keep the console log for debug usage.  

The user can directly start up the docker-compose.yml as a background service in the {root}/mysql folder (by command line "docker compose up -d").

# Operation
1. Clone the project to local
    ```shell
    git clone https://github.com/xh-dev/docker-mysql-ssl-setup
    cd docker-mysql-ssl-setup # project root
    chmod +x *.sh
    ```
2. Execute the script
    ```shell
    ./gen-ssl.sh {domain name}
    ./copy-certs.sh
    ./init-config-mysql-pma.sh {domain name}
    ./start-mysql-pma-services.sh
    ```
6. Check if success connect the database with mysql workbench or amdin web portal
![](docs/test-mysql-workbench.PNG)
will add phpmyadmin screen later on.

# Helps commands

Show version of mysql
```sql
SHOW VARIABLES LIKE 'version';
```

```sql
SELECT * FROM performance_schema.session_status 
WHERE VARIABLE_NAME IN ('Ssl_version','Ssl_cipher');
```
