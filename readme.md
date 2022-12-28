# Installation

1. Generate script for creating certificates
    ```shell
    # go project 
    # replace ???? with the domain of you target db and generation run.sh scripts
    sed 's/{base_domain}/????/g' ssl/run.sh_template > ssl/run.sh
    ```
2. Execute script for creating the certificates
    ```shell
    cd ssl
    ./run.sh  # 8 certificates related script is generated
    ```
3. Fix the permission issue (**Optional**)
    ```shell
    # Incase see below warning in the log file
    # 
    # Warning: World-writable config file '/etc/my.cnf' is ignored
    #

    chmod 0444 my.cnf # restrict the permission setting
    ```
4. Execute the docker compose files
    ```shell
    cd .. # go to project root
    docker compose up 
    ```
5. Check if success connect the database with mysql workbench or amdin web portal
![](docs/test-mysql-workbench.PNG)
![](docs/adminer.PNG)