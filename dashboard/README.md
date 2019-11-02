# kubernets-dashboard

This sub-project install the kubernetes dashboard on the cluster

To install the dashboard

   `./install`

To uninstall the dashboard

   `./uninstall`

To get the login token

   `kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep kubernetes-dashboard-admin | awk '{print $1}')`

