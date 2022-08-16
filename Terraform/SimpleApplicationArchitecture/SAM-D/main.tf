provider "aws" {
    region = var.region
    profile = var.profile-name  
}

module "vpc" {
    source = "./modules/vpc"  
}

module "network" {
    source = "./modules/network"  

    vpc_id = module.vpc.vpc_id
    public_subnet_A_id = module.vpc.public_subnet_A_id
    public_subnet_B_id = module.vpc.public_subnet_B_id
}

module "ec2" {
    source = "./modules/ec2"

    subnet_A_id = module.vpc.public_subnet_A_id
    subnet_B_id = module.vpc.public_subnet_B_id
    security_group_id = module.network.security_group_id
}

module "loadbalancer" {
    source = "./modules//loadbalancer"

    vpc_id = module.vpc.vpc_id
    subnet_A_id = module.vpc.public_subnet_A_id
    subnet_B_id = module.vpc.public_subnet_B_id
    security_group_id = module.network.security_group_id
    webserver_instance_1_id = module.ec2.webserver_instance_1_id
    webserver_instance_2_id = module.ec2.webserver_instance_2_id
}

module "route53" {
    source = "./modules/route53"

    alb_name = module.loadbalancer.alb_name
    alb_zone_id = module.loadbalancer.alb_zone_id
}