#!/bin/bash

kubectl delete -f kubernetes-dashboard-admin-service-account.yaml
kubectl delete secret kubernetes-dashboard -n kubernetes-dashboard
kubectl delete -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta5/aio/deploy/recommended.yaml
