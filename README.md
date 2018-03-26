# kubernetes

## Master Components
Master components provide the cluster’s control plane. Master components make global decisions about the cluster (for example, scheduling), and detecting and responding to cluster events (starting up a new pod when a replication controller’s ‘replicas’ field is unsatisfied).

- ** kube-apiserver **
Component on the master that exposes the Kubernetes API. It is the front-end for the Kubernetes control plane.

- ** etcd **
In fact, etcd is the primary datastore of Kubernetes; storing and replicating all Kubernetes cluster state. As a critical component of a Kubernetes cluster having a reliable automated approach to its configuration and management is imperative.
The etcd Operator simulates human operator behaviors in three steps: Observe, Analyze, and Act.
First, it observes the current cluster state by using the Kubernetes API. Second, it finds the differences between the desired state and current state. Last, it fixes the difference through one or both of the etcd cluster management API or the Kubernetes API.
The etcd Operator provides the following features:
	Create/Destroy: Instead of specifying tedious configuration settings for each etcd member, users only need to specify the size of the cluster minimally.
	Resize: Users need only to modify the size in spec, and the etcd Operator will take care of deploying, destroying, and/or re-configuring cluster members, e.g. from 3 to 5, or from 5 to 3.
	Backup: The etcd Operator performs backups automatically and transparently. Users need only to specify the backup policy, for example, to backup every 30 minutes and keep the last 3 backups.
	Upgrade: Upgrading etcd without downtime is a critical but difficult task. Doing it with the etcd Operator not only simplifies operations, but also avoids common upgrade pitfalls and errors.


