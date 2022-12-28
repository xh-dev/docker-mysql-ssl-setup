FROM ubuntu as sslCreation
RUN apt update -y
RUN apt install openssl -y
COPY ssl /certs
WORKDIR /certs
RUN chmod 777 /certs/run.sh
RUN /certs/run.sh

FROM mysql:5.7.40
COPY --from=sslCreation /certs/certs /certs
COPY --from=sslCreation /certs/my.cnf /etc/my.cnf
RUN chmod 0444 /etc/my.cnf
