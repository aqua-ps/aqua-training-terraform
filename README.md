### Terraform run

Setup
```
export AWS_PROFILE=<your_aws_profile>
terraform init
```

Plan and apply
```
terraform plan -var-file envs/training.tfvars
terraform apply -var-file envs/training.tfvars
```

This command will request credentials to be specified at runtime. The passed creds will be used to set the SSH user for the VM and the admin user for Jenkins