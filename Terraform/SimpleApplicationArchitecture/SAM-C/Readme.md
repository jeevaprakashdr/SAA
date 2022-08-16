# Simple Application - C

## Objective
To build a simple application architecture with the objective of having an EC2 instance with a webserver. Users should be able to send requests to the web server.

In this sample application when a request sent to the webserver following things happens 
 * The request reaches Route53, our DNS.
 * Route 53 redirect the request to Application load balancer(ALB).
 * ELB sends the request to the webserver.

The terraform script in this section throws the following exception:

    'Error: Error creating ELB: ValidationError: Only one of SubnetIds or AvailabilityZones may be specified
            status code: 400, request id: 3706ceaa-67eb-459b-acef-fa9c6e26e2e1'

According to the error, an ELB requires more than one SubnetId or AvailabilityZone before creating it. But while creating an ELB via the AWS console, there is a warning and we can only create an ELB with one AvailabilityZone.

The following resources are created as part of the terraform provisioning.

* VPC
* Internet Gateway
* Public subnet in zone A
* EC2 instance within public subnet
    * Configured with public ip address
* Route53
    * Public domain host is created.
* ELB - Classic Load Balancer 


## Command to run

Create public and private key  with the name webserver_key
    ssh -t rsa 
    
terraform init
terraform plan
terraform  apply -auto-approve

Following command to tear down the resources 
terraform  destory  -auto-approve