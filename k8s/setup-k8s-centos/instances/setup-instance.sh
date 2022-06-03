#!/bin/bash

vagrant ssh node
sudo su
sudo yum install git bim bash_completion
git clone https://github.com/jordybayo/devops.git
cd devops/cka-master
sudo ./setup-container.sh
sudo ./setup-kubetools.sh
sudo vim /etc/ssh/sshd_config
sudo systemctl restart sshd

# container runtime not running -  node
rm /etc/containerd/config.toml
systemctl restart containerd
kubeadm init

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


## After installation of kube
## Alternatively, if you are the root user, you can run:
export KUBECONFIG=/etc/kubernetes/admin.conf
## You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 10.0.2.15:6443 --token 3ddx7r.ov8kzgvnvtk37zzu --discovery-token-ca-cert-hash sha256:17d28718c71b4db4f89a08371eb0eb5922f1dbf62fab6a3554d110fb693a8cf0 

kubeadm join 192.168.56.1:6443 --token 3ddx7r.ov8kzgvnvtk37zzu --discovery-token-ca-cert-hash sha256:17d28718c71b4db4f89a08371eb0eb5922f1dbf62fab6a3554d110fb693a8cf0 
##


# add a USER and grant it sudo privileges
adduser username wheel
usermod -aG wheel username

# isntall weave net , network and network pilices pluggin
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# get all k8s element
kubectl get pods --all-namespaces

