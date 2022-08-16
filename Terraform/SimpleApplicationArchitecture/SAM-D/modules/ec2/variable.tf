variable "subnet_A_id" {
    type = string  
}

variable "subnet_B_id" {
    type = string  
}

variable "security_group_id" {
    type = string  
}

variable "amz_linux" {
    type = string
    default = "ami-0e34bbddc66def5ac"
}