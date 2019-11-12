#!/bin/bash

kubectl apply -f letsencrypt-pv-volume.yaml
kubectl apply -f letsencrypt-pv-claim.yaml
kubectl apply -f letsencrypt-deployment.yaml
kubectl apply -f letsencrypt-service.yaml
