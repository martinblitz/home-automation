# node-red

This sub-project builds and installs a custom node-red custom image.

Because the base docker image, `nodered/node-red:latest`, it include the following add-ons:

* node-red-contrib-homekit-bridged
* node-red-contrib-home-assistant

To build the docker image:

   `docker build -t mcblitz/node-red:latest .`

The push to dockerhub

   `docker push mcblitz/node-red:latest`

To install:

   `./install`

   Note: make sure the server in `node-red-pv-volume.yaml` matches the address of the `nfs-server` service.

To uninstall:

   `./uninstall`

To access:

1. Create DNS entry `node-red` pointing to a kubernetes node.
2. Browse to `http::/node-red`
3. To access the node-red dashboard `http://node-red/ui`

