kubectl apply -f grafana-pv-volume.yaml
kubectl apply -f grafana-pv-claim.yaml
helm install --name grafana stable/grafana -f values.yaml
