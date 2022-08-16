# Simple Application - D

## Objective
To build simple application architecture with objective to have an EC2 instnace with a websever.
Users should be able to send request to the webserver.

In this sample application when a request sent to the webserver following things happens 
 * The request reaches Route53, our DNS.
 * Route 53 redirect the request to Application load balancer(ALB).
 * ALB sends the request to the webserver.


As in SAM-C, where ELB(class) has a mandatory requirement of 2 subnets and same applies to ALB. 
Just to keep it simple I have created the 2nd public subnet with an EC2 instance with a webserver.

The domain name to send requests to the webserver is [test.kelasamadumadava.link](http://test.kelasamadumadava.link).

The following resources are created as part of the terraform provisioning.

* VPC
* Internet Gateway
* Public subnet in zone A and B
* EC2 instance within public subnet A and B
    * Configured with public ip address
* Route53
    * Public domain host is created.
* ALB - Application Load Balancer 
    * ALB listeners and target groups

NOTE: once the terraform script is run the Route53 Hosted Zone Record name servers needs to be manually updated in actial domain nameservers. By forgetting this change requests to the webservers will not be fullfilled.

## Command to run

Create public and private key  with the name webserver_key
    ssh -t rsa 
    
terraform init
terraform plan
terraform  apply -auto-approve

Following command to tear down the resources 
terraform  destory  -auto-approve