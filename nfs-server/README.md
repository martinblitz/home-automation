# nfs-server
This sub-project contains a local nfs server for kubernetes apps.

To install the app:

1. Attach USB drive
2. Format driver as ext4 with label "**home-automation**" on selected k8s node, **k8s-node-1**

	`sudo mkfs.ext4 /dev/sda2 -L "home-automation"`

3. Create mount point

   `sudo mkdir /home-automation`

4. Update /etc/fstab to auto-mount the drive

   `/dev/disk/by-label/home-automation  /home-automation   ext4    defaults,noatime 0 2`

5. Run installation script

   `./install`