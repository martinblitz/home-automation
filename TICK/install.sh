#!/bin/bash

kubectl apply -f tick-namespace.yaml
kubectl apply -f influxdb-pv-volume.yaml
kubectl apply -f influxdb-pv-claim.yaml
kubectl apply -f influxdb-deployment.yaml
kubectl apply -f influxdb-service.yaml
kubectl apply -f chronograf-pv-volume.yaml
kubectl apply -f chronograf-pv-claim.yaml
kubectl apply -f chronograf-deployment.yaml
kubectl apply -f chronograf-service.yaml
kubectl apply -f chronograf-ingress.yaml
kubectl apply -f kapacitor-deployment.yaml
kubectl apply -f kapacitor-service.yaml
kubectl apply -f telegraf-pv-volume.yaml
kubectl apply -f telegraf-pv-claim.yaml
kubectl apply -f telegraf-deployment.yaml
kubectl apply -f telegraf-service.yaml
