#!/bin/bash

kubectl delete -f polyglot-v2-service.yaml
kubectl delete -f polyglot-v2-deployment.yaml
kubectl delete -f polyglot-v2-pv-claim.yaml
kubectl delete -f polyglot-v2-pv-volume.yaml
kubectl delete -f mongo-pv-claim.yaml
kubectl delete -f mongo-pv-volume.yaml

