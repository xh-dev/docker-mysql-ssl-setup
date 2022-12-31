#! /bin/bash
echo "shutdown docker compose"
sudo docker compose down 

echo "docker compose up"
sudo docker compose up --build
popd


