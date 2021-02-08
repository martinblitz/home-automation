#!/bin/bash

read HA_NAME < HOME_ASSISTANT_NAME
read HA_VERSION < HOME_ASSISTANT_VERSION

echo building version ${HA_NAME}:${HA_VERSION}

docker build . --build-arg HA_VERSION=${HA_VERSION} -t ${HA_NAME}:${HA_VERSION}
docker build . --build-arg HA_VERSION=${HA_VERSION} -t ${HA_NAME}:latest
