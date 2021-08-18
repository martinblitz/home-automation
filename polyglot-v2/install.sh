#!/bin/bash

kubectl apply -f mongo-pv-volume.yaml
kubectl apply -f mongo-pv-claim.yaml
kubectl apply -f polyglot-v2-pv-volume.yaml
kubectl apply -f polyglot-v2-pv-claim.yaml
kubectl apply -f polyglot-v2-deployment.yaml
kubectl apply -f polyglot-v2-service.yaml

