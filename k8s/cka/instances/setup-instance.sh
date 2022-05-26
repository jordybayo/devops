vagrant ssh node
sudo su
sudo yum install git bim bash_completion
git clone https://github.com/jordybayo/devops.git
cd devops/cka-master
sudo ./setup-container.sh
sudo ./setup-kubetools.sh
sudo nano /etc/ssh/sshd_config
sudo systemctl restart sshd