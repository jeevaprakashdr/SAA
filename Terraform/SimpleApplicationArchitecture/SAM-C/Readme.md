# Simple Application - C

## Objective
Build simple application architecture with ab objective to have an EC2 instnace with a websever.
Users should be able to send request to the webserver.

In this sample application when a request sent to the the webserver following things happens 
 * The request reaches Route53, our DNS.
 * Route 53 redirect the request to Classic load balancer(ELB).
 * ELB sends the request to the webserver.

The terraform script in this section throws following exception

    'Error: Error creating ELB: ValidationError: Only one of SubnetIds or AvailabilityZones may be specified
            status code: 400, request id: 3706ceaa-67eb-459b-acef-fa9c6e26e2e1'

According to the error, an ELB required to have more than one SubnetIds or AvailabilityZones before creating it.
But while creating an ELB via AWS console it is a warning and we can create ELB with only one AvailabilityZone. 

* VPC
* Internet Gateway
* Public subnet in zone A
* EC2 instance within public subnet
    * Configured with public ip address
* Route53
    * Public domain host is created.
* ELB - Classic Load Balancer 
