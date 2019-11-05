#!/bin/bash

kubectl delete -f home-assistant-configurator-ingress.yaml
kubectl delete -f home-assistant-ingress.yaml
kubectl delete -f home-assistant-service.yaml
kubectl delete -f home-assistant-deployment.yaml
kubectl delete -f home-assistant-usb-pv-claim.yaml
kubectl delete -f home-assistant-usb-pv-volume.yaml
kubectl delete -f home-assistant-dbus-pv-claim.yaml
kubectl delete -f home-assistant-dbus-pv-volume.yaml
kubectl delete -f home-assistant-config-pv-claim.yaml
kubectl delete -f home-assistant-config-pv-volume.yaml
