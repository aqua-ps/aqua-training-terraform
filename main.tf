provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr

  azs                  = data.aws_availability_zones.available.names
  public_subnets       = var.public_subnets
  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "security_group_web" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "web_access"
  description = "Security group for web access"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks_web
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "http-8080-tcp", "https-8443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 30000
      to_port     = 32767
      protocol    = "tcp"
      description = "kube api server nodeports access"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules        = ["all-all"]
}

module "security_group_ssh" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "ssh_access"
  description = "Security group for ssh access"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks_ssh
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]
}

resource "aws_key_pair" "keypair" {
  public_key = var.keypair_pubkey
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.21.0"

  instance_count = var.instance_count

  name          = var.ec2_name
  ami           = var.linux_ami != null ? var.linux_ami : data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = tolist(module.vpc.public_subnets)[0]
  vpc_security_group_ids      = var.additional_security_groups != null ? [module.security_group_web.security_group_id, module.security_group_ssh.security_group_id, var.additional_security_groups] : [module.security_group_web.security_group_id, module.security_group_ssh.security_group_id]
  associate_public_ip_address = true

  key_name = aws_key_pair.keypair.key_name

  user_data_base64 = base64encode(local.user_data)

  enable_volume_tags = true
  tags = {
    Env = var.environment
    App = var.application
  }

  root_block_device = [{
    volume_type = "gp3"
    volume_size = var.root_volume_size
  }]
}