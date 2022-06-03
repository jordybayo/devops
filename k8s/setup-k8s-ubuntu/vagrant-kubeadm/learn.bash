# add a USER and grant it sudo privileges
adduser student 
usermod -aG wheel student
# get existing pods 
kubectl get pods
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


