kubectl apply -f poolcontroller-data-pv-volume.yaml
kubectl apply -f poolcontroller-data-pv-claim.yaml
kubectl apply -f poolcontroller-logs-pv-volume.yaml
kubectl apply -f poolcontroller-logs-pv-claim.yaml
kubectl apply -f poolcontroller-deployment.yaml
kubectl apply -f poolcontroller-service.yaml

