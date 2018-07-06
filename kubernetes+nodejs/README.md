#Kubernetes + nodejsapp

docker build -t nodejsapp:v2 .

#Tagging docker image
docker tag nodejsapp:v2 saviovettoor/nodejsapp:v2

#Pushing the Docker Image to docker Registry
docker push saviovettoor/nodejsapp:v2

kubectl apply -f services.yaml
