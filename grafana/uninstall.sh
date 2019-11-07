helm delete --purge grafana
kubectl delete -f grafana-pv-claim.yaml
kubectl delete -f grafana-pv-volume.yaml
