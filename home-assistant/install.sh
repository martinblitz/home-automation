#!/bin/bash

kubectl apply -f home-assistant-config-pv-volume.yaml
kubectl apply -f home-assistant-config-pv-claim.yaml
kubectl apply -f home-assistant-dbus-pv-volume.yaml
kubectl apply -f home-assistant-dbus-pv-claim.yaml
kubectl apply -f home-assistant-usb-pv-volume.yaml
kubectl apply -f home-assistant-usb-pv-claim.yaml
kubectl apply -f home-assistant-deployment.yaml
kubectl apply -f home-assistant-service.yaml
kubectl apply -f home-assistant-ingress.yaml
kubectl apply -f home-assistant-configurator-ingress.yaml
