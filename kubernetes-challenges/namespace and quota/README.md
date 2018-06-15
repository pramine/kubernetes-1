list-out the pods
]#kubectl get pods --namespace=quota-namespace-example

list-out the namespace
]#kubectl get namespace

List-out the resource ResourceQuota
]#kubectl get resourcequota

To describe the resourcequota
]#kubectl describe resourcequota development-quota

List-out the deployment
]#kubectl get deployment --namespace=quota-namespace-example

Edit a deployment
]#kubectl edit -f deployment.yaml --namespace=quota-namespace-example

To describe the deployment
]#kubectl describe deployment nginx-deployment --namespace=quota-namespace-example
