# ConfigMap

Now lets Use Pod environment variables key-value pairs from ConfigMap  

First lets create a ConfigMap
```
]#kubectl apply -f configmap.yaml
configmap "my-env" created

]#kubectl get configmap
NAME      DATA      AGE
my-env    3         1m

```

Lets create a sample pod and refer config map
```
]# kubectl apply -f configmap-pod.yaml
pod "configmap-envs" created

]#kubectl get pod
NAME             READY     STATUS    RESTARTS   AGE
configmap-envs   1/1       Running   0          1m
```

Now lets check the config env in the pod
```
]#kubectl exec -it configmap-envs /bin/bash
root@configmap-envs:/usr/local/apache2# env | grep VARIABLE*
VARIABLE1=value1
VARIABLE2=value2
VARIABLE3=value3
```