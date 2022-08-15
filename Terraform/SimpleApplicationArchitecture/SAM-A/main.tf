provider "aws" {
    region = "eu-west-2"
    profile = "s_a-jeeva-admin"  
}

module "vpc" {
    source = "./modules/vpc"
}

module "network" {
    source = "./modules//network"

    webserver_vpc_id = module.vpc.webserver_vpc_id
    webserver_public_subnet_A_id = module.vpc.webserver_public_subnet_A_id
}

resource "aws_key_pair" "webserver_kp" {
    key_name = "webserver_kp"  
    public_key = file("webserver_key.pub")
}

resource "aws_instance" "webserver" {
    ami = "ami-0e34bbddc66def5ac"
    instance_type = "t2.micro"
    key_name = aws_key_pair.webserver_kp.key_name

    subnet_id = module.vpc.webserver_public_subnet_A_id
    vpc_security_group_ids = [module.network.webserver_security_group_id]
    user_data = file("./userdata.sh")
    
    tags = {
        Name = "webserver"
    }
}