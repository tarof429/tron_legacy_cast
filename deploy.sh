#!/bin/sh

echo "Logging into dockerhub"
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "Building git revision ${SHA}"

docker build -t tarof429/tron_legacy_cast:latest api_client -t tarof429/tron_legacy_cast:${SHA}

echo "Pushing image to dockerhub"
#docker push tarof429/tron_legacy_cast:latest
#docker push  tarof429/tron_legacy_cast:${SHA}