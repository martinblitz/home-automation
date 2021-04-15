
# home-automation

## Install Ubuntu 20.10 64bit

Instructions can be found here:

> https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#1-overview

Use Raspberry PI Installer v1.5 to install Ubuntu 20.10 64bit on each raspberry PI 4B.

Boot server, and login to console to determine the DHCP address. (you much change the password when logging in the first time).

	ubuntu@ubuntu:~$ ip a
	1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
	    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
	    inet 127.0.0.1/8 scope host lo
	       valid_lft forever preferred_lft forever
	    inet6 ::1/128 scope host 
	       valid_lft forever preferred_lft forever
	2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
	    link/ether dc:a6:32:e5:64:81 brd ff:ff:ff:ff:ff:ff
	    inet 192.168.1.36/24 brd 192.168.1.255 scope global dynamic eth0
	       valid_lft 86108sec preferred_lft 86108sec
	    inet6 fe80::dea6:32ff:fee5:6481/64 scope link 
	       valid_lft forever preferred_lft forever
	3: wlan0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
	    link/ether dc:a6:32:e5:64:82 brd ff:ff:ff:ff:ff:ff

Setup the networks DHCP server to set the address for the server, and reboot

Update and upgrade the server

	ubuntu@ubuntu:~$ sudo apt update
	Get:1 http://ports.ubuntu.com/ubuntu-ports groovy InRelease [267 kB]
	Get:2 http://ports.ubuntu.com/ubuntu-ports groovy-updates InRelease [115 kB]
	.
	.
	.
	ubuntu@ubuntu:~$ sudo apt upgrade -y
	Reading package lists... Done
	Building dependency tree       
	Reading state information... Done
	Calculating upgrade... Done
	The following NEW packages will be installed:
	  linux-headers-5.8.0-1017-raspi linux-image-5.8.0-1017-raspi linux-modules-5.8.0-1017-raspi linux-raspi-headers-5.8.0-1017
	The following packages will be upgraded:
	  accountsservice alsa-ucm-conf apport apt apt-utils bind9-dnsutils bind9-host bind9-libs busybox-initramfs busybox-static ca-certificates cloud-init curl dirmngr distro-info-data flash-kernel friendly-recovery git git-man gnupg gnupg-l10n gnupg-utils gpg gpg-agent
	  gpg-wks-client gpg-wks-server gpgconf gpgsm gpgv gzip iptables libaccountsservice0 libapt-pkg6.0 libasound2 libasound2-data libcurl3-gnutls libcurl4 libdw1 libelf1 libglib2.0-0 libglib2.0-bin libglib2.0-data libgssapi-krb5-2 libip4tc2 libip6tc2 libk5crypto3 libkrb5-3
	  libkrb5support0 libldap-2.4-2 libldap-common libmaxminddb0 libnetplan0 libnss-systemd libp11-kit0 libpam-systemd libparted2 libplymouth5 libproxy1v5 libpython3.8 libpython3.8-minimal libpython3.8-stdlib libsqlite3-0 libssl1.1 libsystemd0 libudev1 libxtables12
	  libxxhash0 libzstd1 linux-firmware linux-firmware-raspi2 linux-headers-raspi linux-image-raspi linux-raspi lshw lsof netplan.io openssh-client openssh-server openssh-sftp-server openssl parted plymouth plymouth-theme-ubuntu-text pollinate python-apt-common
	  python3-apport python3-apt python3-cryptography python3-distupgrade python3-problem-report python3-software-properties python3-twisted python3-twisted-bin python3-update-manager python3.8 python3.8-minimal screen snapd software-properties-common sosreport sudo systemd
	  systemd-sysv systemd-timesyncd tar tmux tzdata u-boot-rpi u-boot-tools ubuntu-release-upgrader-core udev update-manager-core update-notifier-common wireless-regdb wpasupplicant
	115 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
	Need to get 248 MB of archives.
	After this operation, 320 MB of additional disk space will be used.
	Get:1 http://ports.ubuntu.com/ubuntu-ports groovy-updates/main arm64 gzip arm64 1.10-2ubuntu1.1 [92.7 kB]
	Get:2 http://ports.ubuntu.com/ubuntu-ports groovy-updates/main arm64 tar arm64 1.30+dfsg-7ubuntu0.20.10.1 [229 kB]
	Get:3 http://ports.ubuntu.com/ubuntu-ports groovy-updates/main arm64 udev arm64 246.6-1ubuntu1.2 [1300 kB]
	.
	.
	.

Disable swap

	ubuntu@ubuntu:~$ sudo swapoff -a

Change the host name

	ubuntu@ubuntu:~$ sudo hostnamectl set-hostname k8s-node-1
	
Edit /boot/firmware/cmdline.txt and add "cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1" to the beginning

Create ssh keys and exchange between servers

	ubuntu@ubuntu:~$ ssh-keygen 
	Generating public/private rsa key pair.
	Enter file in which to save the key (/home/ubuntu/.ssh/id_rsa): 
	Enter passphrase (empty for no passphrase): 
	Enter same passphrase again: 
	Your identification has been saved in /home/ubuntu/.ssh/id_rsa
	Your public key has been saved in /home/ubuntu/.ssh/id_rsa.pub
	The key fingerprint is:
	SHA256:mL3W2/a2Knaju0HcN5kSxlgOEiC+G1RY+Wrmc0jVSfw ubuntu@k8s-node-1
	The key's randomart image is:
	+---[RSA 3072]----+
	|    .o+ooo. .    |
	|   ..o.  .o*     |
	|    o  . o.o=    |
	|   . . +o.ooE. o |
	|    o ooS o o =  |
	|     o=  +   o . |
	|    .= .o o      |
	|      +.. o++ .  |
	|       o .=Bo=o. |
	+----[SHA256]-----+
	ubuntu@ubuntu:~$ ssh-copy-id ubuntu@k8s-master
	/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ubuntu/.ssh/id_rsa.pub"
	The authenticity of host 'k8s-master (192.168.1.37)' can't be established.
	ECDSA key fingerprint is SHA256:kfJNuQwAvK+Z0Pox6DWAag5wyr9CnzmDHHt0On/ofYk.
	Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
	/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
	/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
	ubuntu@k8s-master's password: 
	
	Number of key(s) added: 1
	
	Now try logging into the machine, with:   "ssh 'ubuntu@k8s-master'"
	and check to make sure that only the key(s) you wanted were added.


Finally reboot

	ubuntu@ubuntu:~$ sudo reboot
	Connection to k8s-node-1 closed by remote host.
	Connection to k8s-node-1 closed.

## Exchange SSH keys

Login to each node and exchange ssh keys with the other nodes.

On the master:

	ubuntu@k8s-master:~$ ssh-copy ubuntu@k8s-node-1

On the node-1:

	ubuntu@k8s-master:~$ ssh-copy ubuntu@k8s-master


## Install MicroK8s on each server

Instructions can be found here:

> https://ubuntu.com/tutorials/how-to-kubernetes-cluster-on-raspberry-pi#1-overview

Issue the command on each node:

	sudo snap install microk8s --classic

On the master, issue the following command:

	ubuntu@k8s-master:~$ sudo snap install microk8s --classic
	NAME         STATUS   ROLES    AGE     VERSION
	k8s-master   Ready    <none>   7m14s   v1.20.2-34+c6851e88267786

Remote taint from master so we can run pod on the node

	kubectl taint nodes --all node-role.kubernetes.io/master-

Enable microk8s features

	microk8s enable dashboard helm3 metallb rbac dns
	microk8s enable ingress

Tell the master you wait to add a node

	ubuntu@k8s-master:~$ sudo microk8s.add-node

From the node you wish to join to this cluster, run the following:

	sudo microk8s join 192.168.1.37:25000/2866392874eef44bd842659e4b97f58e
	
If the node you are adding is not reachable through the default interface you can use one of the following:

	 sudo microk8s join 192.168.1.37:25000/2866392874eef44bd842659e4b97f58e
	 sudo mic	microk8s join 10.1.235.192:25000/2866392874eef44bd842659e4b97f58e=

On the nodes, issue the following commnad, using the key from the master:

	ubuntu@ubuntu:~$ sudo microk8s join 192.168.1.37:25000/2866392874eef44bd842659e4b97f58e
	Contacting cluster at 192.168.1.37
	Waiting for this node to finish joining the cluster. ..  

On the master, verify the nodes:

	NAME         STATUS     ROLES    AGE   VERSION
	k8s-master   Ready      <none>   24m   v1.20.2-34+c6851e88267786
	k8s-node-1   NotReady   <none>   15m   v1.20.2-34+c6851e88267786

Get the kubeconfig file and copy to you laptop

On the k8s master

	ubuntu@k8s-master:~$ microk8s config > kubeconfig

On the laptop

	MartinsWorkMBP:traefik martinblitz$ scp ubuntu@k8s-master:kubeconfig $HOME
	kubeconfig                                                                                                                                                                                                                                    	100% 1845     1.6MB/s   00:00    

Export the kubeconfig on you laptop

	MartinsWorkMBP:~ martinblitz$ export KUBECONFIG=$HOME/kubeconfig

Add the export to you ~/.bash_profile file

## Enable k8s dashboard

Instruction can be found here:

> https://microk8s.io/docs/addon-dashboard
> https://virtualizationreview.com/articles/2019/01/30/microk8s-part-2-how-to-monitor-and-manage-kubernetes.aspx

Enable the dashboard

	microk8s.enable dns dashboard ingress

Set timeout to 0.

> https://blinkeye.github.io/post/public/2019-05-30-kubernetes-dashboard/

Edit the deployment

	kubectl -n kube-system edit deployments kubernetes-dashboard
	

Add "--token-ttl=0" to the "args"

	spec:
	      containers:
	      - args:
	        - --auto-generate-certificates
	        - --token-ttl=0     

### Witout RBAC enabled 

Get the token for the dashboard

	token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
	microk8s kubectl -n kube-system describe secret $token

### With RBAC enabled

Documentation is here:

> https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

Create admin user

	cat <<EOF | kubectl apply -f -
	apiVersion: v1
	kind: ServiceAccount
	metadata:
	  name: admin-user
	  namespace: kube-system
	EOF

Create a role

	cat <<EOF | kubectl apply -f -
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
	  namespace: kube-system
	EOF

Get bearer token

	kubectl -n kube-system get secret $(kubectl -n kube-system get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

### Start proxy and login

On you laptop, start the proxy

	MartinsWorkMBP:~ martinblitz$ kubectl proxy
	Starting to serve on 127.0.0.1:8001

Access the dashboard on you laptop

> http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login


## Port forward to nginx-ingress

Add a load-balancer server for the nginx-ingress.

	kubectl apply -f nginx-ingress/nginx-ingress-service.yaml

Add port forwarding for port 80 and 443 from the router to the nginx-ingress address, 192.168.1.254

## cert-manager

on the laptop, install the cert-manager and create certs for:

* blitzhome.hopto.org
* blitzhome.ddns.net
* home-assistant.blitzhome.ddns.net
* node-red.blitzhome.ddns.net
* grafana.blitzhome.ddns.net
* dashboard.blitzhome.ddns.net

	cd cert-manager
	./install.sh
	cd ..

## NFS Server

On k8s-node-1, install nfs-common

	ubuntu@k8s-node-1:~/source/home-automation/TICK$ sudo apt install nfs-common
	Reading package lists... Done
	Building dependency tree       
	Reading state information... Done
	The following additional packages will be installed:
	  keyutils libnfsidmap2 rpcbind
	Suggested packages:
	  watchdog
	The following NEW packages will be installed:
	  keyutils libnfsidmap2 nfs-common rpcbind
	0 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
	Need to get 313 kB of archives.
	After this operation, 1163 kB of additional disk space will be used.
	Do you want to continue? [Y/n] y
	Get:1 http://ports.ubuntu.com/ubuntu-ports groovy/main arm64 rpcbind arm64 1.2.5-9 [43.1 kB]
	Get:2 http://ports.ubuntu.com/ubuntu-ports groovy/main arm64 keyutils arm64 1.6.1-2ubuntu1 [44.3 kB]
	Get:3 http://ports.ubuntu.com/ubuntu-ports groovy/main arm64 libnfsidmap2 arm64 0.25-5.1ubuntu1 [27.1 kB]
	Get:4 http://ports.ubuntu.com/ubuntu-ports groovy/main arm64 nfs-common arm64 1:1.3.4-2.5ubuntu6 [199 kB]
	Fetched 313 kB in 1s (468 kB/s)   
	Selecting previously unselected package rpcbind.
	(Reading database ... 102231 files and directories currently installed.)
	Preparing to unpack .../rpcbind_1.2.5-9_arm64.deb ...
	Unpacking rpcbind (1.2.5-9) ...
	Selecting previously unselected package keyutils.
	Preparing to unpack .../keyutils_1.6.1-2ubuntu1_arm64.deb ...
	Unpacking keyutils (1.6.1-2ubuntu1) ...
	Selecting previously unselected package libnfsidmap2:arm64.
	Preparing to unpack .../libnfsidmap2_0.25-5.1ubuntu1_arm64.deb ...
	Unpacking libnfsidmap2:arm64 (0.25-5.1ubuntu1) ...
	Selecting previously unselected package nfs-common.
	Preparing to unpack .../nfs-common_1%3a1.3.4-2.5ubuntu6_arm64.deb ...
	Unpacking nfs-common (1:1.3.4-2.5ubuntu6) ...
	Setting up rpcbind (1.2.5-9) ...
	Created symlink /etc/systemd/system/multi-user.target.wants/rpcbind.service → /lib/systemd/system/rpcbind.service.
	Created symlink /etc/systemd/system/sockets.target.wants/rpcbind.socket → /lib/systemd/system/rpcbind.socket.
	Setting up keyutils (1.6.1-2ubuntu1) ...
	Setting up libnfsidmap2:arm64 (0.25-5.1ubuntu1) ...
	Setting up nfs-common (1:1.3.4-2.5ubuntu6) ...
	
	Creating config file /etc/idmapd.conf with new version
	Adding system user `statd' (UID 114) ...
	Adding new user `statd' (UID 114) with group `nogroup' ...
	Not creating home directory `/var/lib/nfs'.
	Created symlink /etc/systemd/system/multi-user.target.wants/nfs-client.target → /lib/systemd/system/nfs-client.target.
	Created symlink /etc/systemd/system/remote-fs.target.wants/nfs-client.target → /lib/systemd/system/nfs-client.target.
	nfs-utils.service is a disabled or a static unit, not starting it.
	Processing triggers for systemd (246.6-1ubuntu1.2) ...
	Processing triggers for man-db (2.9.3-2) ...
	Processing triggers for libc-bin (2.32-0ubuntu3) ...

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

## TICK

Install TICK (telegraf, influxdb, chronograf, kapacitor)

	cd TICK
	./install.sh
	cd ..
	
Add a DNS entry to the router pointing "chronograf" to the traefik address.  For example 192.168.1.248

chronograf can now be accessed as

	http://chronograf:8888

## Node-red

Install node-red

	cd node-red
	./install.sh
	cd ..
	
Add a DNS entry to the rounter pointing to the node-red address: 192.168.1.249

node-red can be accessed as

	http://node-red

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
	
## Grafana

On the master server, enable helm

	ubuntu@k8s-master:~$ microk8s enable helm
	Enabling Helm
	Fetching helm version v2.16.7.
	  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
	                                 Dload  Upload   Total   Spent    Left  Speed
	100 21.8M  100 21.8M    0     0  7634k      0  0:00:02  0:00:02 --:--:-- 7635k
	Helm is enabled


On laptop, add stable respositories

	MartinsWorkMBP:grafana martinblitz$ helm repo add grafana https://grafana.github.io/helm-charts
	"grafana" has been added to your repositories


Install grafana

	cd grafana
	./install.sh
	cd ..

Add a DNS entry to the router pointing "grafana" to the traefik address.  For example 192.168.1.248

grafana can now be accessed as

	http://grafana
