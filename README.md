# kubernetes

Kubernetes Master
-----------------
*apiserver- Provides the API for Kubernetes orchestration, interact with the manifest yaml, via Rest operations or kubectl cli.
*scheduler- Schedules containers on hosts, it is the scheduler’s responsibility to allocate pods to available nodes based on the resource requirement.
*Controller Manager- The Controller Manager reconciles the actual state with the desired state. 
There are multiple specialized controllers inside a Controller Manager in order to simplify cluster management. 
For example, the Node Controller checks to see if any currently running nodes are down and takes the corrective measures, 
whereas the Replication Controller ensures that the desired number of pods are actually running in the nodes.
*etcd- All configuration information about cluster states is stored in the etcd in the form of key/value pairs, and this component is implemented by CoreOS.
*Addons: In order for a server DNS record to be added to Kubernetes, we need a Cluster DNS addon. Addons help in extending the functionality related to Kubernetes clusters or nodes. 
There are many other addons available like fluntd for logging, rbac for role based access and so on.

Nodes
-----
*kube-proxy –  Kube-proxy runs in each node for load distribution among the pods and makes services available to the external host. 
It uses iptable rules or round robin to forward requests to the correct containers.
*kubelet – A Kubelet node agent periodically checks the health of the containers in a pod. In addition, it ensures that the volume is mounted as per manifest, 
and it downloads the sensitive information required to run the container.It also links the node to the API server.

