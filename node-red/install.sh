kubectl apply -f node-red-pv-volume.yaml
kubectl apply -f node-red-pv-claim.yaml
helm install stable/node-red --name node-red -f values.yaml
