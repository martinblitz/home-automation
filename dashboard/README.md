# kubernets-dashboard

This sub-project install the kubernetes dashboard on the cluster

To install the dashboard

   `./install`

To uninstall the dashboard

   `./uninstall`

To get the login token

   `kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep kubernetes-dashboard-admin | awk '{print $1}')`

To access the dashboard, run the command

    `kubectl proxy`

then access the following URL: `http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#!/login`

