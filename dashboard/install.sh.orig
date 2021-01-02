#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta5/aio/deploy/recommended.yaml
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=blitzhome-dyndns.net"
kubectl -n kubernetes-dashboard create secret tls kubernetes-dashboard --key=tls.key --cert=tls.crt
rm tls.key tls.crt
kubectl apply -f kubernetes-dashboard-admin-service-account.yaml
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep kubernetes-dashboard-admin | awk '{print $1}')

