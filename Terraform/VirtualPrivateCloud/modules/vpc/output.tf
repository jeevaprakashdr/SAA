output "id" {
    value = aws_vpc.main_vpc.id
}

output "public-subnet-A_id" {
    value = aws_subnet.public-subnet-A.id
}

output "private-subnet-A_id" {
    value = aws_subnet.private-subnet-A.id
}