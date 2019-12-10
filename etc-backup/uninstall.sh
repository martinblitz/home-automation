#!/bin/bash

kubectl delete -f etc-backup-cronjob.yaml
kubectl delete -f etc-backup-pv-claim.yaml
kubectl delete -f etc-backup-pv-volume.yaml
