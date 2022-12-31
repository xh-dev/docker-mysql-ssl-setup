#! /bin/bash
pushd "$(pwd)/mysql"

echo "shutdown docker compose"
docker compose down 

echo "docker compose up"
docker compose up --build
popd
