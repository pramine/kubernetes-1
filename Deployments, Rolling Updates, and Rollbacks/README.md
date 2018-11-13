##Deployment, Rolling Updates, and Rollbacks

Deploying a node-js app where image saviovettoor/nodejsapp
```
]#kubectl create -f nodejs-app-deployment.yaml
```

Listout all deployment in current namespace
```
]#kubectl get deployments
```

Get the deployment in yaml output
```
]#kubectl get deployment nodejs-app-deployment -o yaml
```

To describe the deployment
```
]#kubectl describe deployment nodejsapp-deployment
```

Rolling Updates #saviovettoor/nodejsapp:v2 to saviovettoor/nodejsapp:v3
```
]#kubectl create -f nodejs-app-update.yaml
```

To view rollout status
```
]#kubectl rollout status deployment/nodejsapp-deployment
```

To view rollout history
```
]#kubectl rollout history deployment nodejsapp-deployment

]#kubectl rollout history deployment nodejsapp-deployment --revision=1
```

To rollback
```
]#kubectl rollout undo deployment nodejsapp-deployment --to-revision=1
```

Delete deployment
```
]#kubectl delete deployment nodejs-app-deployment
```