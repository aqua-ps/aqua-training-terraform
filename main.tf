resource "random_integer" "subnet" {
  min = 0
  max = 2
}

resource "aws_key_pair" "keypair" {
  public_key = var.keypair_pubkey
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.21.0"

  instance_count = var.instance_count

  name                        = var.ec2_name
  ami                         = var.linux_ami != null ? var.linux_ami : data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = tolist(var.public_subnets)[random_integer.subnet.result]
  vpc_security_group_ids      = var.additional_security_groups != null ? [var.kubelet_security_group_id, var.ssh_security_group_id, var.additional_security_groups] : [var.kubelet_security_group_id, var.ssh_security_group_id]
  associate_public_ip_address = var.associate_public_ip_address

  key_name = aws_key_pair.keypair.key_name

  user_data_base64 = base64encode(local.user_data)

  enable_volume_tags = true
  tags = {
    Environment = var.environment
    Application = var.application
    Owner       = var.owner
  }

  root_block_device = [{
    volume_type = "gp3"
    volume_size = var.root_volume_size
  }]
}