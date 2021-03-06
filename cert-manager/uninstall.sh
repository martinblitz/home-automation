#!/bin/bash

kubectl delete -f blitzhome-ingress.yaml
kubectl delete -f grafana-external-service.yaml
kubectl delete -f blitzhome-certificate.yaml
kubectl delete -f prod_issuer.yaml
helm uninstall cert-manager --namespace cert-manager
kubectl delete -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation
kubectl delete namespace cert-manager

