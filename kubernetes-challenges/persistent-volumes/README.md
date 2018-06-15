#Persistent Volumes
Persistent volumes let pods create storage that persists beyond the lifetime of a pod.
In Kubernetes, persistent storage is managed through the Kubernetes API resources, PersistentVolume and PersistentVolumeClaim. The storage components in Kubernetes support a variety of backends (e.g. NFS, EBS, etc.)

VolumeTypes
A directory which is mounted inside a Pod is backed by the underlying Volume Type. A Volume Type decides the properties of the directory, like size, content, etc. Some of the Volume Types are:

emptyDir
An empty Volume is created for the Pod as soon as it is scheduled on the Worker Node. The Volume's life is tightly coupled with the Pod. If the Pod dies, the content of emptyDir is deleted forever.

hostPath
With the hostPath Volume Type, we can share a directory from the host to the Pod. If the Pod dies, the content of the Volume is still available on the host.

gcePersistentDisk
With the gcePersistentDisk Volume Type, we can mount a Google Compute Engine (GCE) persistent disk into a Pod.

awsElasticBlockStore
With the awsElasticBlockStore Volume Type, we can mount an AWS EBS Volume into a Pod.

nfs
With nfs, we can mount an NFS share into a Pod.

iscsi
With iscsi, we can mount an iSCSI share into a Pod.

secret
With the secret Volume Type, we can pass sensitive information, such as passwords, to Pods. We will take a look at an example in a later chapter.

persistentVolumeClaim
We can attach a Persistent Volume to a Pod using a persistentVolumeClaim.

gitRepo
A gitRepo volume is an example of what can be done as a volume plugin. It mounts an empty directory and clones a git repository into it for your Pod to use.



Access Modes in PV
------------------
The access modes are:
ReadWriteOnce – the volume can be mounted as read-write by a single node
ReadOnlyMany – the volume can be mounted read-only by many nodes
ReadWriteMany – the volume can be mounted as read-write by many nodes

In the CLI, the access modes are abbreviated to:
RWO - ReadWriteOnce
ROX - ReadOnlyMany
RWX - ReadWriteMany

Lets create the PV by:
```
]#kubectl create -f pv-nfs.yaml
persistentvolume "nfs-pv" created
```

Now lets listout the pvc which got created
```
]#kubectl get pv
NAME      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM     STORAGECLASS   REASON    AGE
nfs-pv    1Gi        RWX            Retain           Available                                      5s
```

After the persistent volume is created, you can create the persistent volume claim, which claims the persistent volume that was just created.
```
]#kubectl create -f pvc-nfs.yaml
persistentvolumeclaim "nfs-pvclaim" created

]#kubectl get pvc
NAME          STATUS    VOLUME    CAPACITY   ACCESS MODES   STORAGECLASS   AGE
nfs-pvclaim   Bound     nfs-pv    1Gi        RWX                           5s
```

Once after creating a pvc we will be able to see claim in the pv listout
```
]#kubectl get pv
NAME      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS    CLAIM                 STORAGECLASS   REASON    AGE
nfs-pv    1Gi        RWX            Retain           Bound     default/nfs-pvclaim                            2m
```

After pv and pvc creation we will create deployment
```
]#kubectl create -f nfs-deployment.yaml
deployment.apps "nginx-deployment" created
```

lets see the status of deployment
```
]#kubectl get deployments
NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   2         2         2            2           5m
```

Now lets list login to running pods and check whether nfs share file got mounted
```
]#kubectl get pods
NAME                                READY     STATUS    RESTARTS   AGE
nginx-deployment-7bd784b76b-qhrqf   1/1       Running   0          24s
nginx-deployment-7bd784b76b-w7hrq   1/1       Running   0          24s

]#kubectl exec -it nginx-deployment-7bd784b76b-w7hrq  /bin/bash
root@nginx-deployment-7bd784b76b-w7hrq:/# cat /usr/share/nginx/html/index.html
NFS Persistant volume Works!!!
```
 
Lets expose the deployment using service and listout
```
]#kubectl create -f services.yaml
kubectl create -f services.yaml

]#kubectl create -f services.yaml
NAME               TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes         ClusterIP   10.96.0.1        <none>        443/TCP        22d
my-nginx-service   NodePort    10.108.191.102   <none>        80:31459/TCP   38s
```

Since i'm using the minikube i was able to access the nginx via my minikube ip and expose port from my local
```
]#minikube ip
192.168.99.100

]#curl 192.168.99.100:31459
NFS Persistant volume Works!!!
```

