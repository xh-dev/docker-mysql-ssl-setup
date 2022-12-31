#! /bin/bash

if [ -z "$1" ]; then
    echo "!!! please specify the domain of the of ssl. !!!"
    exit 1
else
    echo "Generating SSL for domain: $1"
fi

pushd "$(pwd)/mysql"

echo "remove docker compose first"
rm docker-compose.yml

echo "regen docker compose first"
sed "s/{{host}}/${domainName}/g" docker-compose.yml_template > docker-compose.yml
popd


