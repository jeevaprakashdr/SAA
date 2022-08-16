# Simple Application - A

## Objective
To build a simple application architecture with the objective of having an EC2 instance with a webserver. Users should be able to send requests to the web server.

In this sample application, the webserver is reachable directly through the EC2 instance public IP address.

The following resources are created as part of the terraform provisioning.
* VPC
* Internet Gateway
* Public subnet in zone A
* EC2 instance within public subnet
    * Configured with public ip address

## Command to run

Create public and private key  with the name webserver_key
    ssh -t rsa 
    
terraform init
terraform plan
terraform  apply -auto-approve

Following command to tear down the resources 
terraform  destory  -auto-approve