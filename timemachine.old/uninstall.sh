#!/bin/bash

kubectl delete -f timemachine-rpi-deployment.yaml
kubectl delete -f timemachine-rpi-pv-claim.yaml
kubectl delete -f timemachine-rpi-pv-volume.yaml
kubectl delete secret timemachine-rpi-secrets

