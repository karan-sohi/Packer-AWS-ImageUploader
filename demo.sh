#!/bin/bash

# Packer needs to wait until the server is ready. 30 seconds seems safe.
sleep 30

# Update the packages on the server
sudo yum update -y

# Install Mongodb
sudo mv /tmp/mongodb-org-4.4.repo /etc/yum.repos.d/mongodb-org-4.4.repo
sudo yum install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod


# install nodejs
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
sudo yum install -y nodejs

# install git
sudo yum install -y git

# Setup the express app
git clone https://github.com/sam-meech-ward-bcit/basic-express-image-uploader.git
cd basic-express-image-uploader && npm i --only=prod

# Setup the express app service 
mv /tmp/app.env /home/ec2-user/app.env
sudo mv /tmp/ImageApp.service /etc/systemd/system/ImageApp.service
sudo systemctl enable ImageApp.service
sudo systemctl start ImageApp.service

# Install & setup nginx
sudo amazon-linux-extras install nginx1 -y
sudo mv /tmp/nginx.conf /etc/nginx/nginx.conf
sudo systemctl enable nginx
sudo systemctl start nginx
