#!/bin/bash

curl -LO https://git.io/get_helm.sh ; chmod 700 get_helm.sh ; ./get_helm.sh
helm init --service-account tiller --tiller-image=jessestuart/tiller:latest --upgrade
kubectl apply -f helm-rbac.yaml

