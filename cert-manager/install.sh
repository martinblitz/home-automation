#!/bin/bash

kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation="true"
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.4.0 --create-namespace --set installCRDs=true
echo sleep 60 seconds
sleep 60
kubectl apply -f prod_issuer.yaml 
kubectl apply -f blitzhome-certificate.yaml
kubectl apply -f grafana-external-service.yaml
kubectl apply -f blitzhome-ingress.yaml

