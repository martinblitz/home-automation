#!/bin/bash

read HA_NAME < HOME_ASSISTANT_NAME
read HA_VERSION < HOME_ASSISTANT_VERSION

echo pushing ${HA_NAME}:${HA_VERSION}

docker push ${HA_NAME}:${HA_VERSION}
docker push ${HA_NAME}:latest

