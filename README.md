### Terraform Run

Setup
```
export AWS_PROFILE=<your_aws_profile>
terraform init
```

Plan and apply
```
terraform plan -var-file envs/<varfile>.tfvars
terraform apply -var-file envs/<varfile>.tfvars
```

The apply command will request the user to input the credentials used to configure the instance during the initial boostrap.