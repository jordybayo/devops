# add a USER and grant it sudo privileges
adduser student 
usermod -aG wheel student
# Add apt repo for kuberneteAdd apt repo for kubernetes
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
# get existing deployments
kubectl get deployments
# know what i can do with a specific user
kubectl auth can-i create deployments --as user
# will show api grous ressources
kubectl api-resources | less
# will show api version
kubectl api-version 
# can be use to explore api components
kubectl explain
# enable bashc completion in kubectl
kubectl completion bash
kubectl completion bash >> ~/.bashrc #to make it persistent
# will show help for kubectl
kubectl -h | less
# enable bashc completion in kubectl for everybody
sudo -i
cd /etc/bash_completion.d
kubectl completion bash > /etc/bash_completion.d/kubectl
# see diffrent ways to run kubectl on config
kubectl config -h
# see config of the cluster
kubectl config view
# create with kubectl 
kubectl create -f busybox.yaml
# get existing pods 
kubectl get pods
# get valuable information about k8s ressource cluster
kubectl explain pods.spec.containers | less
# setup proxy access for curl
kubectl proxy --port=8001 &
# aceess proxy with curl
curl http://localhost:8001/api/v1/namespaces/default/pods
curl http://localhost:8001/api/v1/namespaces/default/pods/busybox2
# delete pods
kubectl delete pods <pod> --grace-period=0 --force
curl -X DELETE http://localhost:8001/api/v1/namespaces/default/pods/busybox2
# instal etcdctl 
lsb_release -a
sudo apt update
sudo apt install -y etcd-client
# help with etcdctl 
etcdctl -h
ETCDCTL_API=3 etcdctl -h
# get port of etcd
ps aux | grep etcd
# get all available namespaces
kubectl get ns
# get all namespaces that contains things and their contains
kubectl get all --all-namespaces
# create my namespace
kubectl create ns dev
# describe a ns 
kubectl describe ns dev
# json config file of a namespace as yaml
kubectl get ns dev -o yaml
# 
