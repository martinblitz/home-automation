#!/bin/bash

kubectl delete -f nfs-server-alpine-service.yaml
kubectl delete -f nfs-server-alpine-deployment.yaml
kubectl delete -f nfs-server-alpine-pv-claim.yaml
kubectl delete -f nfs-server-alpine-pv-volume.yaml

