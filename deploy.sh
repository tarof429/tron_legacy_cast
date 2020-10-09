#!/bin/sh

echo "Building git revision ${SHA}"

docker build -t tarof429/api-client:latest -t tarof429/api-client:${SHA} api_client

echo "Pushing images to dockerhub"
docker push tarof429/api-client:latest
docker push tarof429/api-client:${SHA}

echo "Cleaning up images"
docker rmi tarof429/api-client:latest tarof429/api-client:${SHA}

echo "Running ansible scripts"
cd ansible
ansible-playbook -e "SHA=${SHA} MYSQL_ROOT_PASSWORD_READ=${MYSQL_ROOT_PASSWORD_READ} MYSQL_PASSWORD_READ=${MYSQL_PASSWORD_READ}" deploy_to_k8s.yml