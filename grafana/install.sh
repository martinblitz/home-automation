kubectl apply -f grafana-pv-volume.yaml
kubectl apply -f grafana-pv-claim.yaml
arkade install grafana --persistence \
	--set persistence.existingClaim=grafana-pv-claim \
	--set persistence.subPath=grafana \
	--set plugins=grafana-piechart-panel
kubectl apply -f grafana-ingress.yaml
