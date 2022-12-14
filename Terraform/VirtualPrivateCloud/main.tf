resource "aws_key_pair" "ec2_kp" {
    key_name = "ec2_kp"  
    public_key = file("ec2_kp.pub")
}

module "vpc" {
    source = "./modules/vpc"
}

module "network" {
    source = "./modules/network"

    vpc-id = module.vpc.id
    vpc_public_subnet_A_id = module.vpc.public-subnet-A_id
    vpc_private_subnet_A_id = module.vpc.private-subnet-A_id
}

resource "aws_instance" "public_ec2_A" {
    ami = "ami-0fb391cce7a602d1f"
    instance_type = "t2.micro"
    key_name = aws_key_pair.ec2_kp.key_name
    
    subnet_id = module.vpc.public-subnet-A_id
    vpc_security_group_ids = [ module.network.aws_sg_id ]

    tags = {
      Name = "Public EC2 instance"
    }
}

resource "aws_instance" "private_ec2_A" {
    ami = "ami-0fb391cce7a602d1f"
    instance_type = "t2.micro"
    
    subnet_id = module.vpc.private-subnet-A_id

    tags = {
      "Name" = "Private EC2 instance"
    }
}

resource "aws_eip" "public_ec2_A_eip" {
    vpc = true
    instance = aws_instance.public_ec2_A.id
}

output "public_ec2_A_ip" {
    value = aws_eip.public_ec2_A_eip.public_ip
}