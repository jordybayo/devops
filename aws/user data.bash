#!/bin/sh
sudo -i
sudo yum update -y
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<h1> Hello World jordy ${hostname}. money is coming</h1>" >> /var/www/html/index.htmlp