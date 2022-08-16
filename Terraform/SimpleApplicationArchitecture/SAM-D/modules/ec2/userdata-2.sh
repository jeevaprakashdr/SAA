#!/bin/bash
sudo su
yum update -y
yum install httpd -y
service httpd start
service httpd status
cd /var/www/html
touch index.html
echo "webserver 2" > index.html