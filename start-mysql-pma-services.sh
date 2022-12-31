#! /bin/bash
pushd "$(pwd)/mysql"

mkdir -p mysqlResources/data
mkdir -p mysqlResources/log

echo "shutdown docker compose"
docker compose down 

echo "docker compose up"
docker compose up --build
popd
