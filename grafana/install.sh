kubectl create namespace grafana
kubectl apply -f grafana-pv-volume.yaml
kubectl apply -f grafana-pv-claim.yaml
helm install grafana grafana/grafana --namespace grafana -f values.yaml
