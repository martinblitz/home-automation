helm delete --purge node-red
kubectl delete -f node-red-pv-claim.yaml
kubectl delete -f node-red-pv-volume.yaml
