variable "region" {
  default = "eu-west-2"
}

variable "environment" {
  default = "test"
}

variable "application" {
  default = "test"
}

variable "owner" {
  default = "Aqua Professional Services"
}

variable "additional_security_groups" {
  default = null
}

variable "linux_ami" {
  default = null
}

variable "kubelet_security_group_id" {
  default = "sg-00fc99daae98502e8"
  type    = string
}

variable "ssh_security_group_id" {
  default = "sg-02f2cf41dba0ef299"
  type    = string
}

variable "public_subnets" {
  default = ["subnet-00bd6a6c5cb8ed266", "subnet-0b74cd998da2425da", "subnet-0000098d704e1eefe"]
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
  default = 30
}

variable "keypair_pubkey" {}

variable "bootstrap_username" {
  description = "Username used to bootstrap vm ssh and Jenkins user"
  default     = "aquasec"
}

variable "bootstrap_password" {
  description = "Password used to bootstrap vm ssh and Jenkins user"
}

variable "bootstrap_version" {
  description = "Version of the bootstrap script to use as tagged in the Github repo"
  default     = "master"
}

variable "associate_public_ip_address" {
  default = true
}