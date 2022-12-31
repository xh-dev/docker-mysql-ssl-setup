#! /bin/bash

if [ -z "$1" ]; then
    echo "!!! please specify the domain of the of ssl. !!!"
    exit 1
else
    echo "Generating SSL for domain: $1"
fi

rm -fr ssl/run.sh
domainName=$1

pushd "$(pwd)/ssl" #
echo "start ssl generation"

echo "regen run.sh"
sed "s/{base_domain}/${domainName}/g" run.sh_template > run.sh
echo "add executable permission to run.sh"
chmod +x run.sh

echo "docker compose to generate ssl"
docker compose up --build
echo "[done] start ssl generation"
popd

