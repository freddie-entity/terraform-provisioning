#! /bin/bash

sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1>Hello World from </h1> $(hostname -f)' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<h1>App from </h1>$(hostname -f)<p>Terraform</p>' | sudo tee /var/www/html/app/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
