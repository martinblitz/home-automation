#!/bin/bash

kubectl delete -f gismocaster-service.yaml
kubectl delete -f gismocaster-deployment.yaml
kubectl delete -f gismocaster-var-pv-claim.yaml
kubectl delete -f gismocaster-etc-pv-claim.yaml
kubectl delete -f gismocaster-var-pv-volume.yaml
kubectl delete -f gismocaster-etc-pv-volume.yaml
