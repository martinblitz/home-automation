#!/bin/bash

kubectl apply -f home-assistant-config-pv-volume.yaml
kubectl apply -f home-assistant-config-pv-claim.yaml
kubectl apply -f home-assistant-ssl-pv-volume.yaml
kubectl apply -f home-assistant-ssl-pv-claim.yaml
kubectl apply -f home-assistant-deployment.yaml
kubectl apply -f home-assistant-service.yaml
#kubectl apply -f home-assistant-ingress.yaml
