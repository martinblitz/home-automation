#!/bin/bash

kubectl apply -f nfs-server-alpine-pv-volume.yaml
kubectl apply -f nfs-server-alpine-pv-claim.yaml
kubectl apply -f nfs-server-alpine-backup-pv-volume.yaml
kubectl apply -f nfs-server-alpine-backup-pv-claim.yaml
kubectl apply -f nfs-server-alpine-deployment.yaml
kubectl apply -f nfs-server-alpine-service.yaml

