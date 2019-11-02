#!/bin/bash

kubectl apply -f traefik-brac.yaml
kubectl apply -f traefik-ds.yaml
kubectl apply -f ui.yaml

