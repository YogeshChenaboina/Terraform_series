#! /bin/bash
sudo yum update -y
sudo yum install git -y
sudo yum install -y httpd
sudo systemctl httpd start  
sudo systemctl enable httpd
echo "<h1>Welcome to devops by using terraform</h1>" > /var/www/html/index.html