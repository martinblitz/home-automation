#!/bin/bash

kubectl apply -f etc-backup-pv-volume.yaml
kubectl apply -f etc-backup-pv-claim.yaml
kubectl apply -f backup-cronjob.yaml
