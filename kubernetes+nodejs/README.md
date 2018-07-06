# Kubernetes + nodejs

## Building new docker image <br>
docker build -t nodejsapp:v2 . <br>

## List out the docker images <br>
```
]#docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nodejsapp           v1                  30761d6347c2        About an hour ago   70MB
node                alpine              a4558aa39064        9 hours ago         70MB
```

## Tagging docker image <br>
]#docker tag nodejsapp:v2 saviovettoor/nodejsapp:v2 <br>

## Pushing the Docker Image to docker Registry <br>
]#docker push saviovettoor/nodejsapp:v2 <br>

## Creating deployment
```
]# kubectl apply -f k8s/deployment.yaml
deployment.apps "nodejsapp" created

list out the running pods
]#kubectl get pods
NAME                         READY     STATUS              RESTARTS   AGE
nodejsapp-698c77cc86-rmk6l   1/1       Running 	0         45s
nodejsapp-698c77cc86-fk2w4   1/1       Running  0         49s
```

## Creating service to access the app <br>
```
]#kubectl apply -f k8s/service.yaml
service "my-nodejsapp-service" created

list out the service details
]#kubectl get services
NAME                   TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes             ClusterIP   10.96.0.1      <none>        443/TCP          34m
my-nodejsapp-service   NodePort    10.104.246.2   <none>        2000:30003/TCP   6m
```

