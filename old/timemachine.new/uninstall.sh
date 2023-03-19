#!/bin/bash

kubectl delete -f timemachine-deployment.yaml
kubectl delete -f timemachine-pv-claim.yaml
kubectl delete -f timemachine-pv-volume.yaml
kubectl delete secret timemachine-secrets

