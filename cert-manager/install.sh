#!/bin/bash

kubectl apply -f lets-encrypt.yaml
kubectl apply -f blitzhome-ingress.yaml
