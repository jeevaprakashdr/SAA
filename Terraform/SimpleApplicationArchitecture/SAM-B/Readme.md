# Simple Application - B

## Objective
To build a simple application architecture with the objective of having an EC2 instance with a webserver. Users should be able to send requests to the web server.

In this sample application, the webserver is reachable through a domain name service.

The domain name to send requests to the webserver is [test.kelasamadumadava.link](http://test.kelasamadumadava.link).

The following resources are created as part of the terraform provisioning.

* VPC
* Internet Gateway
* Public subnet in zone A
* EC2 instance within public subnet
    * Configured with public ip address
* Route53
    * Public domain host is created.

NOTE: once the terraform script is run the Route53 Hosted Zone Record name servers needs to be manually updated in actial domain nameservers. By forgetting this change requests to the webservers will not be fullfilled.

## Command to run
Create public and private key  with the name webserver_key  
ssh-keygen -t rsa  
    
terraform init  
terraform plan  
terraform  apply -auto-approve  

Following command to tear down the resources  
terraform  destory  -auto-approve