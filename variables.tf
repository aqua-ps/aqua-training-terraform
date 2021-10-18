variable "region" {
  default = "eu-south-1"
}

variable "vpc_name" {
  default = "test-vpc"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "environment" {
  default = "test"
}

variable "application" {
  default = "test"
}

variable "additional_security_groups" {
  default = null
}

variable "ingress_cidr_blocks_web" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "linux_ami" {
  default = null
}

variable "ingress_cidr_blocks_ssh" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "instance_count" {
  default = 1
}

variable "ec2_name" {
  default = "example"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ebs_volume_type" {
  default = "gp2"
}

variable "ebs_volume_size" {
  default = null
}

variable "root_volume_size" {
  default = null
}

variable "keypair_pubkey" {}