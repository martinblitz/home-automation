#!/bin/bash

kubectl delete -f mosquitto-service.yaml
kubectl delete -f mosquitto-deployment.yaml
kubectl delete -f mosquitto-pv-claim.yaml
kubectl delete -f mosquitto-pv-volume.yaml
