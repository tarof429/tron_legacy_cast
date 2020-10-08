#!/bin/sh

echo "Building git revision ${SHA}"

docker build -t tarof429/tron_legacy_cast:latest api_client -t tarof429/tron_legacy_cast:${SHA}

echo "Pushing images to dockerhub"
docker push tarof429/tron_legacy_cast:latest
docker push tarof429/tron_legacy_cast:${SHA}

echo "Cleaning up images"
docker rmi tarof429/tron_legacy_cast:latest tarof429/tron_legacy_cast:${SHA}