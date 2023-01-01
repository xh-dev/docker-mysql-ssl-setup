#! /bin/bash

if [ -z "$1" ]; then
    echo "!!! please specify the domain of the of ssl. !!!"
    exit 1
else
    echo "Generating SSL for domain: $1"
fi

domainName=$1

pushd "$(pwd)/mysql"

echo "remove docker compose first"
rm docker-compose.yml

echo "regen docker compose first"
sed "s/{{host}}/${domainName}/g" template-docker-compose.yml > docker-compose.yml
popd


