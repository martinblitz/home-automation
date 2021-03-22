helm uninstall grafana --namespace grafana
kubectl delete -f grafana-pv-claim.yaml
kubectl delete -f grafana-pv-volume.yaml
kubectl delete namespace grafana
