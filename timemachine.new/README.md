# timemachine
This sub-project contains an hfs+ server with an extern ingress to for OSX backup via Time Machine.

To install this app:

1. Install hfs+ packages

   `sudo apt-get install hfsplus hfsutils hfsprogs -y`

2. Attach USB drive for hfs+ on selected k8s+ node, **k8s-node-1**
3. You may have to repartition so the beginning and end of the partition are on 4K boundaries using fdisk.
4. Format the drive with hfs+

   `sudo mkfs.hfsplus /dev/sdb2 -L "timemachine"`

5. Create mount point

   `sudo mkdir /home/timemachine`

6. Update /etc/fstab to auto-mount the drive

   `/dev/disk/by-label/timemachine	/timemachine	hfsplus	force,rw 0 2`

7. Label node to run the app on

   `kubectl label node k8s-node-1 timemachine=mounted`

8. Install the app

   `.install.sh <USERNAME> <PASSWORD>`

   