kubectl delete -f poolcontroller-service.yaml
kubectl delete -f poolcontroller-deployment.yaml
kubectl delete -f poolcontroller-data-pv-claim.yaml
kubectl delete -f poolcontroller-data-pv-volume.yaml
kubectl delete -f poolcontroller-logs-pv-claim.yaml
kubectl delete -f poolcontroller-logs-pv-volume.yaml

