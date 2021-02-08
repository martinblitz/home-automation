#!/bin/bash

kubectl apply -f gismocaster-etc-pv-volume.yaml
kubectl apply -f gismocaster-var-pv-volume.yaml
kubectl apply -f gismocaster-etc-pv-claim.yaml
kubectl apply -f gismocaster-var-pv-claim.yaml
kubectl apply -f gismocaster-deployment.yaml
kubectl apply -f gismocaster-service.yaml
