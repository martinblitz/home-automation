#!/bin/bash

kubectl apply -f traefik-rbac.yaml
kubectl apply -f traefik-ds.yaml
kubectl apply -f ui.yaml

