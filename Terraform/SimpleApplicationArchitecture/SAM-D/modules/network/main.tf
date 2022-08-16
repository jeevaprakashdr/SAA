resource "aws_internet_gateway" "igw" {  
    vpc_id = var.vpc_id

    tags = {
      "Name" = "internet gateway"
    }
}

resource "aws_route_table" "webserber_public_route_table" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"

        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      Name = "webserver public route table"
    }
}

resource "aws_route_table_association" "route_table_association_public_subnet_A" {
    subnet_id = var.public_subnet_A_id
    route_table_id = aws_route_table.webserber_public_route_table.id  
}

resource "aws_route_table_association" "route_table_association_public_subnet_B" {
    subnet_id = var.public_subnet_B_id
    route_table_id = aws_route_table.webserber_public_route_table.id  
}

resource "aws_security_group" "webserver_security_group" {
    vpc_id = var.vpc_id

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      "Name" = "webservers securitygroup"
    }
}