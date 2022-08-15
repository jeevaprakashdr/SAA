#!/bin/bash
sudo su
yum update -y
yum install httpd -y
service httpd start
service httpd status