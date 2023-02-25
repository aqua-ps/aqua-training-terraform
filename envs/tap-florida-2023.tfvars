region = "us-east-2"

#TAGS
environment = "Production"
application = "TAP FL 2023"
owner = "Aqua Professional Services"

#VPC
public_subnets = ["subnet-0ce891076eb42a1ed", "subnet-040e63dffcc0bb103", "subnet-092c29f9312bf5e18"]
kubelet_security_group_id = "sg-07e563bf61eb0ecef"
ssh_security_group_id = "sg-0b50599c9d033d036"

#EC2
ec2_name = "aqua-tap-fl-23"
instance_count = 1
instance_type = "t3a.xlarge"
#linux_ami = "ami-08be70d36872187b9"

bootstrap_username = "aquatapuser"
keypair_pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwKNqkVWnbR/2x6j8/fx91GhGAj/LpJ3E4+apSMFH4sE7FXKABCAg10zPsZZ+Pne9lZGqvuQaj/EJTTH/YxcU41ayB7ct7IAHZdE1Go7RGhBZ0O2sxN2Ks5ViXXhXjvQl/eMW0JFtevp0LO3dAxahML1mRfC/LkOx8AN/2P3BqnTkM4kDoGkNZjYXBGNzFayXFQJ/7d+VHEa6yHm0hghaRhZ4bTexZxAlcesThOCTq/ALsqzfMbLsz8Mpp68WKn+xEAVxJPevtGHVpikApmD1ZU9spNJV77mPTb37KZAiodl1BxltrKhHL/8CSX8Ym++1ziG/DhU9aQKPHfQdBs1QG9hw7muTfsyM/lHOXfWzgqpSGHgqD2vPG4BBrmFe225I29r00/48FtTaGxqzUotax/HdB6bw2PB3VWDukC6yh7wrJk3diA+Uq1O6KPZyRh1dT0EgAPsr2uTYf3LUTLXN1nXKy9AUGfLQDZx5T6P1Z3ghGapuBDPW4N20mRk5rUbk="
