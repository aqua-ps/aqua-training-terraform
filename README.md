# How to use

### Test User Script in Vagrant
Test the user script used as the ec2 instance bootstrap in Vagrant


Create Vagrant machine
```
vagrant up
```

SSH into the Vagrant machine
```
vagrant ssh
```

Clean up
```
vagrant halt
vagrant detroy
```

### Bootstrap development

Use the Vagrantfile and add to the config.vm.provision to test additional configuration
```
...
config.vm.provision "shell", inline: <<-SHELL
  curl -sL https://raw.githubusercontent.com/andreazorzetto/aqua-playground-userscript/master/user-script.sh | bash -
  <add new script or shell code here>
SHELL
...
```

Eventually add the tested logic to the original user-script or make a change adding an additional script to the terraform `locals.tf` file:
```
locals {
  user_data = <<EOF
#!/bin/bash

curl -sL https://raw.githubusercontent.com/andreazorzetto/aqua-playground-userscript/master/user-script.sh | bash -

<add new script or shell code here>

EOF
}
```

### Terraform run

Setup
```
export AWS_PROFILE=<your_aws_profile>
terraform init
```

Plan and apply
```
terraform plan -var-file envs/playground.tfvars
terraform apply -var-file envs/playground.tfvars
```