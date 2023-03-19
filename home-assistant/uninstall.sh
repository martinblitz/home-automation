#!/bin/bash

kubectl delete -f home-assistant-service.yaml
kubectl delete -f home-assistant-deployment.yaml
kubectl delete -f home-assistant-ssl-pv-claim.yaml
kubectl delete -f home-assistant-ssl-pv-volume.yaml
kubectl delete -f home-assistant-config-pv-claim.yaml
kubectl delete -f home-assistant-config-pv-volume.yaml
