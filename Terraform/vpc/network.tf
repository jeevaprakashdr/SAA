resource "aws_internet_gateway" "main_igw" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    tags = {
      Name = "main-igw"
    }
}

resource "aws_eip" "nat_eip" {
    vpc = true
    depends_on = [ aws_internet_gateway.main_igw ]
}

resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.nat_eip.id
    depends_on = [
        aws_eip.nat_eip
    ]
    subnet_id = "${element(aws_subnet.public-subnet-A.*.id, 0)}"  // What is this?

    tags = {
      Name = "NAT gateway"
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

resource "aws_route_table" "main-private-rt" {
    vpc_id = aws_vpc.main_vpc.id

    route {
        cidr_block = "0.0.0.0/0"

        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }
}

resource "aws_route_table_association" "main-public-rt-public-subnet-A" {
    subnet_id = "${aws_subnet.public-subnet-A.id}"
    route_table_id = "${aws_route_table.main-public-rt.id}"
}

resource "aws_route_table_association" "main-private-rt-private-subnet-A" {
    subnet_id = aws_subnet.private-subnet-A.id
    route_table_id = aws_route_table.main-private-rt.id    
}