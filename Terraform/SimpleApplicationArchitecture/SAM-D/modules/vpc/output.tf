output "vpc_id" {
    value = aws_vpc.webserver-vpc.id 
}

output "public_subnet_A_id" {
    value = aws_subnet.webserver_public_subnet_A.id
}

output "public_subnet_B_id" {
    value = aws_subnet.webserver_public_subnet_B.id
}