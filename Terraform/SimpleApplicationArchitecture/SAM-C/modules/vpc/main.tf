resource "aws_vpc" "webserver_vpc" {
    cidr_block = "10.0.0.0/16"      
    enable_dns_support = "true"
    enable_dns_hostnames =  "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
      Name = "webserver-vpc"
    }
}

resource "aws_subnet" "webserver_public_subnet_A" {
    vpc_id = aws_vpc.webserver_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-2a"

    tags = {
      Name = "webserver_public_subnet_A"
    }
}