#!/bin/bash

kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation="true"
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true
echo sleep 60 seconds
sleep 60
kubectl apply -f prod_issuer.yaml 
kubectl apply -f blitzhome-certificate.yaml
kubectl apply -f grafana-external-service.yaml
kubectl apply -f blitzhome-ingress.yaml

