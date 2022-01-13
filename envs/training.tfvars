region = "us-east-2"

//** VPC ***********************//

vpc_name = "test-training-vpc-az"
vpc_cidr = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]


//** TAGS ***********************//
environment = "test"
application = "training"

//** SG ***********************//
ingress_cidr_blocks_web = ["0.0.0.0/0"]
ingress_cidr_blocks_ssh = ["0.0.0.0/0"]

//** EC2 ***********************//
ec2_name = "aqua-training"
instance_count = 1
instance_type = "t3a.xlarge"
#linux_ami = "ami-044696ab785e77725"

root_volume_size = 30

keypair_pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3SRY3w+HBXmLa2/CXkTFTG2STZLnneFt3k1cYS5nvVENXXgS6QHbQhTBnHT8BUJfnNpf9BINfHfqT3/BAZJ94FTP3fsA4G/Bcc/2jkw+CH0FiJslwoYpMNpmPrkL3EoCTZcyyp6Y/kFZrtFo6mXXVl8AyyWZ443Gy+eM9oRh0e4v+msQICrERl7rjmtyhGxZ9jPO5M974lVbrAHwX55xdaTOlb8JOdJ4yMXzEVYQb8UUbz4T/qhT3NO3WB9GiBHDHnoFUNAR3hWtZxTdvvv2P5MBAn016hFbbZ58QPwrPQ/1hq+jrh8ZDb5HeBYVgIlVJ/yHzz/HDrUmVLijsCWaTrcQDpmVxoqqlY9srpxdoMTBhJHqltrv7EdkQ5KEPQuQb8FvPUDgkj4dKtg0W2jRG/Fo/BTaE/bh+ACIlIRtSCN1xJCfSKZuTK8+3lM/yNV5S37pPaQFoBzwKPEgCFSuLh8g9DXU+dg0Pb+jh75nMH42ctMo+n0n1H9Bonorn1y8= andreazorzetto@Andreas-MacBook-Pro.local"
bootstrap_version = "0.3.0"
bootstrap_username = "aquasec"
