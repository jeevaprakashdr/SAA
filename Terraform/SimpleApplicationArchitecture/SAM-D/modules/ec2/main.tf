resource "aws_key_pair" "ec2_key_pair" {
    key_name = "webserver_kp"
    public_key = file("./webserver_key.pub")
}

resource "aws_instance" "webserver_1" {
    ami = var.amz_linux
    instance_type = "t2.micro"
    key_name = aws_key_pair.ec2_key_pair.key_name
    
    //associate_public_ip_address = false
    subnet_id = var.subnet_A_id
    security_groups = [var.security_group_id]

    user_data = file("${path.module}/userdata-1.sh")

    tags = {
      Name = "webserver 1"
    }
}

resource "aws_instance" "webserver_2" {
    ami = var.amz_linux
    instance_type = "t2.micro"
    key_name = aws_key_pair.ec2_key_pair.key_name

    //associate_public_ip_address = false
    subnet_id = var.subnet_B_id
    security_groups = [var.security_group_id]

    user_data = file("${path.module}/userdata-2.sh")

    tags = {
      Name = "webserver 2"
    }
}