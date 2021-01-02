#!/bin/bash

kubectl apply -f mosquitto-pv-volume.yaml
kubectl apply -f mosquitto-pv-claim.yaml
kubectl apply -f mosquitto-deployment.yaml
kubectl apply -f mosquitto-service.yaml
