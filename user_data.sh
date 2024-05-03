#!/bin/bash

# Install Nginx
sudo yum install nginx -y

# Start Nginx service
sudo systemctl start nginx.service

# Enable Nginx to start on system boot
sudo systemctl enable nginx.service

