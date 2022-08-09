resource "aws_internet_gateway" "main_igw" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    tags = {
      Name = "main-igw"
    }
}

resource "aws_route_table" "main-public-rt" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    route {
        // associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"

        //RT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.main_igw.id}"
    }

    tags = {
      Name = "main-public-rt"
    }
}

resource "aws_route_table_association" "main-public-rt-public-subnet-A" {
    subnet_id = "${aws_subnet.public-subnet-A.id}"
    route_table_id = "${aws_route_table.main-public-rt.id}"
}

resource "aws_security_group" "ssh-allowed" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ssh-allowed"
    }
}

