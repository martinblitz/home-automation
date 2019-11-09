kubectl apply -f node-red-pv-volume.yaml
kubectl apply -f node-red-pv-claim.yaml
kubectl apply -f node-red-deployment.yaml
kubectl apply -f node-red-service.yaml

