output "webserver_vpc_id" {
    value = aws_vpc.webserver_vpc.id  
}

output "webserver_public_subnet_A_id" {
    value = aws_subnet.webserver_public_subnet_A.id
}