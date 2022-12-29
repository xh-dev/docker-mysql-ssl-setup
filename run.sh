#! /bin/bash

./clear.sh

domainName=$1

pushd "$(pwd)/ssl"
echo "start ssl generation"

echo "regen run.sh"
sed "s/{base_domain}/${domainName}/g" run.sh_template > run.sh
echo "add executable permission to run.sh"
chmod +x run.sh

echo "docker compose to generate ssl"
docker compose up --build
echo "[done] start ssl generation"
popd

pushd "$(pwd)/mysql"
echo "start mysql"

echo "remove ./mysql/certs"
rm -fr certs
echo "cp ../ssl/certs to ./mysql/cert"
mv ../ssl/certs .

echo "remove docker compose first"
rm docker-compose.yml

echo "regen docker compose first"
sed "s/{{host}}/${domainName}/g" docker-compose.yml_template > docker-compose.yml

echo "shutdown docker compose"
sudo docker compose down 

echo "docker compose up"
sudo docker compose up --build
popd


