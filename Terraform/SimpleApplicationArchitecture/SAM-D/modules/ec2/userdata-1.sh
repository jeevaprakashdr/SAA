#!/bin/bash
sudo su
yum update -y
yum install httpd -y
service httpd start
service httpd status
cd /var/www/html
touch index.html
echo "webserver 1" > index.html