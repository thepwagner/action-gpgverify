#!/bin/sh

# FIXME: debug
env

TAG=${DOCKER_TAG:-latest}

# If invoked on tag push, publish the tag:
if [ "$GITHUB_EVENT_NAME" == "push" ]; then
  if echo $GITHUB_REF | grep -q ^refs/tags; then
    TAG=$(echo $GITHUB_REF | sed -e 's@^refs/tags/@@')
  fi
fi

docker build -t $DOCKER_IMAGE:$GITHUB_SHA .
echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin
docker tag $DOCKER_IMAGE:$GITHUB_SHA $DOCKER_IMAGE:$TAG
docker push $DOCKER_IMAGE:$TAG
