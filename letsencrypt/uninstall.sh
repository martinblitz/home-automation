#!/bin/bash

kubectl delete -f letsencrypt-service.yaml
kubectl delete -f letsencrypt-deployment.yaml
kubectl delete -f letsencrypt-pv-claim.yaml
kubectl delete -f letsencrypt-pv-volume.yaml
