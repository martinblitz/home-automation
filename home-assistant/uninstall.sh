helm delete --purge home-assistant
kubectl delete -f home-assistant-pv-claim.yaml
kubectl delete -f home-assistant-pv-volume.yaml
