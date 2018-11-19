## Run Pod On Scpecific Node

To run a pod on specific label node first we  need to label that node:
```
kubectl label node <node-name> instance=mylabel
```

To view the label
```
kubectl describe node <node-name>
```

To run pod in the specific node we are going to use tag nodeselector in yaml
```
kubectl apply -f myapp-label.yaml
```

REF:
kubectl get pods --selector owner=savio
```
kubectl get pods -l env=dev
```

List all pods that are either labelled with env=dev or with env=prod:
```
]#kubectl get pods -l 'env in (dev, prod)'
```