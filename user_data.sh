#!/bin/bash

# Update package manager
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras install -y nginx1

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on system boot
sudo systemctl enable nginx