resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
      Name = "main-vpc"
    }
}

resource "aws_subnet" "public-subnet-A" {
    vpc_id = "${aws_vpc.main_vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch =  "true" // this makes the public subnet
    availability_zone = "eu-west-2a"

    tags = {
      Name = "public-subnet-A"
    }
}

resource "aws_subnet" "private-subnet-A" {
    vpc_id = "${aws_vpc.main_vpc.id}  "
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2a"

    tags = {
      Name = "private-subnet-A"
    }
}
