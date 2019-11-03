kubectl apply -f home-assistant-pv-volume.yaml
kubectl apply -f home-assistant-pv-claim.yaml
helm install --name home-assistant stable/home-assistant -f values.yaml

