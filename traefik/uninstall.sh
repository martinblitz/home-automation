#!/bin/bash

kubectl delete -f ui.yaml
kubectl delete -f traefik-ds.yaml
kubectl delete -f traefik-brac.yaml

