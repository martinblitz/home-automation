# helm

How to install helm on raspberry pi

Install helm:

   `$ curl -LO https://git.io/get_helm.sh
$ chmod 700 get_helm.sh
$ ./get_helm.sh`

initialize helm:

   `helm init --tiller-image=jessestuart/tiller:latest`
