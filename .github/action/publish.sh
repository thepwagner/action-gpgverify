#!/bin/sh

TAG=${1:-latest}

docker build -t $DOCKER_IMAGE:$GITHUB_SHA .
echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin
docker tag $DOCKER_IMAGE:$GITHUB_SHA $DOCKER_IMAGE:$TAG
docker push $DOCKER_IMAGE:$TAG

