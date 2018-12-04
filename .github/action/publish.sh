#!/bin/sh

docker build -t $DOCKER_IMAGE:latest .
echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin
docker push $DOCKER_IMAGE:latest

