# timemachine

To install this app:

1. Attach USB drive on selected k8s+ node, **k8s-node-1**

2. Format the drive with hfs+

   `sudo mkfs.ext4 /dev/sdb2 -L "timemachine"`

3. Create mount point

   `sudo mkdir /home/timemachine`

4. Update /etc/fstab to auto-mount the drive

   `/dev/disk/by-label/timemachine  /timemachine    ext4    sync,noexec,nodev,noatime,nodiratime 0 0`

5. Label node to run the app on

   `kubectl label node k8s-node-1 timemachine=mounted`

6. Install the app

   `./install.sh <USERNAME> <PASSWORD>`

   
