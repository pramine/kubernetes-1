# ENV

The basic pod configuration is usually done by setting different environment variables.<br>
To set the environment variables you can use env or envFrom key in the configuration file.
Docker lets you specify environment variables in the Dockerfile but managing same data in two different environment/machine is difficult.

```
]#kubectl apply -f pod-env.yaml
pod "envs" created
```

```
]#kubectl get pods
NAME                         READY     STATUS    RESTARTS   AGE
envs                         1/1       Running   0          5s
```

Pods are up now  lets check the env in the pod
```
]#kubectl exec -it envs /bin/bash
root@envs:/usr/local/apache2# env | grep SAMPLE*
SAMPLE_HTTP_PORT=8080
SAMPLE_HTTPD_HOST=MyHTTPDServer
SAMPLE_HTTPS_PORT=443
```

 