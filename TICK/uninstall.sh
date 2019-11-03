#!/bin/bash

kubectl delete -f telegraf-service.yaml
kubectl delete -f telegraf-deployment.yaml
kubectl delete -f telegraf-pv-claim.yaml
kubectl delete -f telegraf-pv-volume.yaml
kubectl delete -f kapacitor-service.yaml
kubectl delete -f kapacitor-deployment.yaml
kubectl delete -f chronograf-ingress.yaml
kubectl delete -f chronograf-service.yaml
kubectl delete -f chronograf-deployment.yaml
kubectl delete -f chronograf-pv-claim.yaml
kubectl delete -f chronograf-pv-volume.yaml
kubectl delete -f influxdb-service.yaml
kubectl delete -f influxdb-deployment.yaml
kubectl delete -f influxdb-pv-claim.yaml
kubectl delete -f influxdb-pv-volume.yaml
kubectl delete -f tick-namespace.yaml
