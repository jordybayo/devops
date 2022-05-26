#!/bin/bash
# script that runs 
# https://kubernetes.io/docs/setup/production-environment/container-runtime

# setting MYOS variable
MYOS=$(hostnamectl | awk '/Operating/ { print $3 }')
OSVERSION=$(hostnamectl | awk '/Operating/ { print $4 }')

##### CentOS 7 config
if [ $MYOS = "CentOS" ]
then
	echo setting up CentOS 7 with Docker 
	yum install -y vim yum-utils device-mapper-persistent-data lvm2
	yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

	# notice that only verified versions of Docker may be installed
	# verify the documentation to check if a more recent version is available

	yum install -y docker-ce
	[ ! -d /etc/docker ] && mkdir /etc/docker

	mkdir -p /etc/systemd/system/docker.service.d


	cat > /etc/docker/daemon.json <<- EOF
	{
	  "exec-opts": ["native.cgroupdriver=systemd"],
	  "log-driver": "json-file",
	  "log-opts": {
	    "max-size": "100m"
	  },
	  "storage-driver": "overlay2",
	  "storage-opts": [
	    "overlay2.override_kernel_check=true"
	  ]
	}
	EOF

    cat > /etc/hosts <<- EOF
    {
        192.168.56.1 control.example.com control
        192.168.56.2 worker1.example.com worker1
        192.168.56.3 worker2.example.com worker2
        192.168.56.4 worker3.example.com worker3
    }
	EOF

	systemctl daemon-reload
	systemctl restart docker
	systemctl enable docker

	systemctl disable --now firewalld

	if [[ $HOSTMAME = control.example.com ]]
	then
		echo "setting up master node firewall"
		firewall-cmd --add-port={6443,2379-2380,10250,10251,10252,5473,179,5473}/tcp --permanent
		firewall-cmd --add-port={4789,8285,8472}/udp --permanent
		firewall-cmd --reload
	fi

	if $HOSTMAME | grep worker
	then
		echo "setting up worker node firewall"
		firewall-cmd --add-port={10250,30000-32767,5473,179,5473}/tcp --permanent
		firewall-cmd --add-port={4789,8285,8472}/udp --permanent
		firewall-cmd --reload
	fi
fi

echo printing MYOS $MYOS

if [ $MYOS = "Ubuntu" ]
then
	### setting up container runtime prereq
	cat <<- EOF | sudo tee /etc/modules-load.d/containerd.conf
	overlay
	br_netfilter
	EOF

	sudo modprobe overlay
	sudo modprobe br_netfilter

	# Setup required sysctl params, these persist across reboots.
	cat <<- EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
	net.bridge.bridge-nf-call-iptables  = 1
	net.ipv4.ip_forward                 = 1
	net.bridge.bridge-nf-call-ip6tables = 1
	EOF

	# Apply sysctl params without reboot
	sudo sysctl --system

	# (Install containerd)
	sudo apt-get update && sudo apt-get install -y containerd
	# Configure containerd
	sudo mkdir -p /etc/containerd
	containerd config default | sudo tee /etc/containerd/config.toml
	# Restart containerd
	sudo systemctl restart containerd	
fi

