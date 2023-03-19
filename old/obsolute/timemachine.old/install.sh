#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "Usage $0 <username> <password>"
    exit
fi

echo $1 > ./secrets/username
echo $2 > ./secrets/password
kubectl create secret generic  timemachine-rpi-secrets --from-file=./secrets/username --from-file=./secrets/password --from-file=./secrets/vol_name --from-file=./secrets/vol_root
rm ./secrets/username ./secrets/password

kubectl apply -f timemachine-rpi-pv-volume.yaml
kubectl apply -f timemachine-rpi-pv-claim.yaml
kubectl apply -f timemachine-rpi-deployment.yaml
