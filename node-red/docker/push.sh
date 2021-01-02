#!/bin/bash

read DOCKER_NAME < DOCKER_NAME
read DOCKER_VERSION < DOCKER_VERSION

echo pushing ${DOCKER_NAME}:${DOCKER_VERSION}

docker push ${DOCKER_NAME}:${DOCKER_VERSION}
docker push ${DOCKER_NAME}:latest

