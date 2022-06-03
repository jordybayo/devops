high availaibility
scalability
disaster recovery


#get available pods
k get pods

#get available pods with more details
k get pods -o wide

#describe a specific pods
k describe <pod name>

# create a deployment
kubectl creeate deployment <name>
kubectl creeate deployment k8s-web-hello --image=youngdevps/k8s-web-hello


#scale nomber of pods in a deployment
k scale deployment <deployment name> --replicas=5

# expose specific service
k expose deployment nginx-deployment --port=8080 --target-port=80

# shorcut for getting services
k get svc

# delete a deplyment or a service
k delete deployment deployment-name
k delete service service-name

# dockerrize container
docker build . -t youngdevps/k8s-web-hello
docker login
docker push youngdevps/image name

# create service with expose to outside of cluster
k expose deployment k8s-web-hello --type=NodePort --port=3000
k get svc

# To run the service in browser
minikube service k8s-web-hello

# create a LoadBalancer service
k expose deployment k8s-web-hello  --type=LoadBalancer --port=3000

# set up a image deployment 
k set image deployment k8s-web-hello youngdevps/k8s-web-hello:v2

# Rolling update of the deployment
k rollout status deploy k8s-web-hello

# delete deployment and services at the same time
k delete all --all

# create deployment from yaml file
kubectl apply -f deployment.yaml

# delete confiuuration file
k delete -f deployment.yaml -f service.yaml

# get into any pods 
k exec <pod name> -- nslookup <service name>

# get an url service to lauch a web server extenal ip
minikube service --url k8s-web-to-nginx

# get into any pods 
k exec <pod name> -- wget -q0- http://<service name>
k exec k8s-web-to-nginx-5c8b5cbc95-6lll9 -- wget -qO- http://nginx
