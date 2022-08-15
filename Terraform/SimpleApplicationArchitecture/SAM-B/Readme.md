# Simple Application - B

## Objective
Build simple application architecture with ab objective to have an EC2 instnace with a websever.
Users should be able to send request to the webserver.

In this sample application the webserver is reachable through a domain name service.


* VPC
* Internet Gateway
* Public subnet in zone A
* EC2 instance within public subnet
    * Configured with public ip address
* Route53
    * Public domain host is created.
