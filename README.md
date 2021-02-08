# home-automation


## Install k3sup and kubectl on laptop

https://alexellisuk.medium.com/walk-through-install-kubernetes-to-your-raspberry-pi-in-15-minutes-84a8492dc95a

	curl -sSL https://dl.get-arkade.dev | sudo sh
	arkade get kubectl
	arkade get k3sup
	
## Install Raspberry PI OS


Install latest raspbian on each RPI using "Raspberry Pi Imager":

	https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit
	
Run Raspberry Pi Imager to install the image.

To enable the ssh on the image, remove the SSD card, and reinsert (this mounts the boot partition).  Then on the laptop.

	touch /Volumes/boot/ssh

Copy laptop SSH keys to each RPI:

	ssh-copy-id pi@raspberrypi.local
	
then unmount the SSD, install in the RPI, power-on, then ssh in.

On each RPI:

1. Enable SSH
2. Set hostname
3. change GPU memory to 16M
4. Set startup to console (no GUI)
5. Add the "cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory" to /boot/cmdline.txt
6. reboot
7. generate SSH key: ssh-keygen
8. Copy each RPI's SSH key to the other RPIs

Force use of legacy iptables (not required)

	sudo iptables -F
	sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
	sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

Modify /etc/dhcpcd.conf to static on each RPI (not required)

	interface eth0
	static ip_address=192.168.1.36/24
	static routers=192.168.1.1
	static domain_name_servers=192.168.1.1 8.8.8.8

Disable swap on each RPI:

	sudo dphys-swapfile swapoff
	sudo dphys-swapfile uninstall
	sudo systemctl disable dphys-swapfile.service
	sudo reboot

## Create k3s Cluster

On Laptop reate k8s master node

	k3sup install --ip 192.168.1.37 --user pi --k3s-version v1.18.9+k3s1 --k3s-extra-args "--disable servicelb"

Join each node to master

	k3sup join --ip 192.168.1.36 --user pi --server-ip 192.168.1.37 --k3s-version v1.18.9+k3s1
	
## Kubernetes dashboard

From laptop nstall kubernetes dashboard

	arkade install kubernetes-dashboard

Add admin user to dashboard

	cat <<EOF | kubectl apply -f -
	---
	apiVersion: v1
	kind: ServiceAccount
	metadata:
	  name: admin-user
	  namespace: kubernetes-dashboard
	---
	apiVersion: rbac.authorization.k8s.io/v1
	kind: ClusterRoleBinding
	metadata:
	  name: admin-user
	roleRef:
	  apiGroup: rbac.authorization.k8s.io
	  kind: ClusterRole
	  name: cluster-admin
	subjects:
	- kind: ServiceAccount
	  name: admin-user
	  namespace: kubernetes-dashboard
	---
	EOF

Set timeout to 0.

	https://blinkeye.github.io/post/public/2019-05-30-kubernetes-dashboard/

Edit the deployment

	kubectl -n kubernetes-dashboard edit deployments kubernetes-dashboard

Add "--token-ttl=0" to the "args"

	spec:
	      containers:
	      - args:
	        - --auto-generate-certificates
	        - --token-ttl=0     

Get admin login token

	kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user-token | awk '{print $1}')

Start kubernetes proxy on laptop
	
	kubectl proxy

In browser, go to

	http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login

Login with token gotten above.

From laptop, install metalb

	cd metallb
	./install.sh
	cd ..
	
## Traefik dashboard

traefik was istall when the cluster was created.  Now enable the dashboard

	https://levelup.gitconnected.com/a-guide-to-k3s-ingress-using-traefik-with-nodeport-6eb29add0b4b

Edit the traefik configMap

	kubectl -n kube-system edit cm traefik
	
Add line 31 and 32 "[api] / dashboard = true" and sabe

	# Please edit the object below. Lines beginning with a '#' will be ignored,
	# and an empty file will abort the edit. If an error occurs while saving this file will be
	# reopened with the relevant failures.
	#
	apiVersion: v1
	data:
	  traefik.toml: |
	    # traefik.toml
	    logLevel = "info"
	    defaultEntryPoints = ["http","https"]
	    [entryPoints]
	      [entryPoints.http]
	      address = ":80"
	      compress = true
	      [entryPoints.https]
	      address = ":443"
	      compress = true
	        [entryPoints.https.tls]
	          [[entryPoints.https.tls.certificates]]
	          CertFile = "/ssl/tls.crt"
	          KeyFile = "/ssl/tls.key"
	      [entryPoints.prometheus]
	      address = ":9100"
	    [ping]
	    entryPoint = "http"
	    [kubernetes]
	      [kubernetes.ingressEndpoint]
	      publishedService = "kube-system/traefik"
	    [traefikLog]
	      format = "json"
	    [api]
	      dashboard = true
	    [metrics]
	      [metrics.prometheus]
	        entryPoint = "prometheus"
	kind: ConfigMap
	metadata:
	  annotations:
	    meta.helm.sh/release-name: traefik
	    meta.helm.sh/release-namespace: kube-system
	  creationTimestamp: "2021-01-03T22:29:54Z"
	  labels:
	    app: traefik
	    app.kubernetes.io/managed-by: Helm
	    chart: traefik-1.81.0
	    heritage: Helm
	    release: traefik
	  name: traefik
	  namespace: kube-system
	  resourceVersion: "497"
	  selfLink: /api/v1/namespaces/kube-system/configmaps/traefik
	  uid: e0f4a9c6-4bee-47b5-b7cb-304643b38757

Restart traefik

	kubectl -n kube-system scale deploy traefik --replicas 0
	kubectl -n kube-system scale deploy traefik --replicas 1
	
Top access traefik dashboard:

On laptop:

	kubectl -n kube-system port-forward deployment/traefik 8080

In browser

	http://localhost:8080/dashboard/

## NFS Server

On k8s-node-1, mount NFS export drives.  Create mount-points

	sudo mkdir /backup
	sudo mkdir /home-automation
	sudo mkdir /timemachine

Edit /etc/fstab and add the drives and mount-points

	/dev/disk/by-label/timemachine  /timemachine    ext4    sync,noexec,nodev,noatime,nodiratime 0 0
	/dev/disk/by-label/backup	/backup		ext4	defaults,noatime 0 2
	/dev/disk/by-label/home-automation  /home-automation   ext4    defaults,noatime 0 2

Mount the drives

	sudo mount /backup
	sudo mount /home-automation
	sudo mount /timemachine

On. laptop, label node "k8s-node-1" to force nfs server to run on that node.

	kubectl label node k8s-node-1 home-automation=mounted

Install NFS server

	cd nfs-server
	./install.sh
	cd ..

## Mosquitto

Install mosquitto

	cd mosquitto
	./install.sh
	cd ..

## TICK

Install TICK (telegraf, influxdb, chronograf, kapacitor)

	cd TICK
	./install.sh
	cd ..
	
Add a DNS entry to the router pointing "chronograf" to the traefik address.  For example 192.168.1.248

chronograf can now be accessed as

	http://chronograf:8888

## Home-assistant

Install home-assistant

	cd home-assistant
	./install.sh
	cd ..

## Node-red

Install node-red

	cd node-red
	./install.sh
	cd ..
	
Add a DNS entry to the rounter pointing to the node-red address: 192.168.1.249

node-red can be accessed as

	http://node-red

## Grafana

Install grafana

	cd grafana
	./install.sh
	cd ..

Add a DNS entry to the router pointing "grafana" to the traefik address.  For example 192.168.1.248

grafana can now be accessed as

	http://grafana

## Timemachine

Install timemachine server

	cd timemachine
	kubectl label node k8s-node-1 timemachine=mounted
	./install.sh <USERNAME> <PASSWORD>
	cd ..

## backup

Install etc-backup

	cd backup
	./install.sh
	cd ..


## ETC backup

Install etc-backup

	cd etc-backup
	./install.sh
	cd ..








