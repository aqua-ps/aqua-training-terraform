# Aqua Training Terraform

This repository contains the terraform project for the EC2 environments used in TAP and DART classes. It is intended that you manage the environments using the `envs` files, via Github Actions: `Apply` and `Destroy` workflows.

## Envs file

All configurations for the terraform are supplied via tfvars files in the `envs` directory. These can provision multiple environments to manage a whole class/cohort at a time.

### Sample envs file

```tfvars
region = "eu-west-2" # Where to deploy the resources

#TAGS for tracking purposes
environment = "Production"
application = "TAP"
owner = "Aqua Professional Services"

#EC2
ec2_name = "aqua-tap-demo"
instance_count = 3 # how many environments do we need for this class/cohort
instance_type = "t3a.xlarge"
#linux_ami = "ami-08be70d36872187b9"

bootstrap_username = "aquatapuser" # What username do we supply to the environment/applications
deploy_gitlab = true # when this is true, a gitlab server will be deployed into kubernetes, exposed via nodeport 32080. When false, a Jenkins environment will be deployed instead.
keypair_pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwKNqkVWnbR/2x6j8/fx91GhGAj/LpJ3E4+apSMFH4sE7FXKABCAg10zPsZZ+Pne9lZGqvuQaj/EJTTH/YxcU41ayB7ct7IAHZdE1Go7RGhBZ0O2sxN2Ks5ViXXhXjvQl/eMW0JFtevp0LO3dAxahML1mRfC/LkOx8AN/2P3BqnTkM4kDoGkNZjYXBGNzFayXFQJ/7d+VHEa6yHm0hghaRhZ4bTexZxAlcesThOCTq/ALsqzfMbLsz8Mpp68WKn+xEAVxJPevtGHVpikApmD1ZU9spNJV77mPTb37KZAiodl1BxltrKhHL/8CSX8Ym++1ziG/DhU9aQKPHfQdBs1QG9hw7muTfsyM/lHOXfWzgqpSGHgqD2vPG4BBrmFe225I29r00/48FtTaGxqzUotax/HdB6bw2PB3VWDukC6yh7wrJk3diA+Uq1O6KPZyRh1dT0EgAPsr2uTYf3LUTLXN1nXKy9AUGfLQDZx5T6P1Z3ghGapuBDPW4N20mRk5rUbk="
```

## Creating the environments

**IMPORTANT**: The project uses a shared state file in S3, making use of terraform workspaces to allow independent management of classes/cohorts. Please if you insist on running outside of the Github Actions (for example, locally) you take extra care to ensure the environment is setup correctly, and triple check your `tf plan` output before applying!

The `Apply` workflow has the capability to run a tf plan and a tf apply. The workflow takes a few arguments.

1. The `branch name` from which we should run. This branch should contain the correct version of the Apply.yaml workflow, and the `envs` file you wish to use configurations from.
2. `TAP Class Name` - This is the name of your envs file, without `tap-` or `.tfvars`. So an env file named `tap-demo-2024.tfvars` class name would be `demo-2024`. The name you give is largely arbitrary, just important that this is unique.
3. Apply changes after plan? - This will auto-apply the changes when the workflow is run when set to `yes`. When set to `no` the job will complete after the `plan`

## Destroying the environments

**IMPORTANT**: The project uses a shared state file in S3, making use of terraform workspaces to allow independent management of classes/cohorts. Please if you insist on running outside of the Github Actions (for example, locally) you take extra care to ensure the environment is setup correctly, and triple check your `tf plan` output before destroying!

The `Destroy` workflow is essentially the same as the `Apply` workflow, but destroying instead of applying, who would've thought?
The parameters are the same, and the values supplied should be the same to destroy the respective environments created in a previous `Apply`. Simple enough. Be careful and be sure to double check everything...

Here's a checklist for you:
 - [ ] Correct branch
 - [ ] Correct tap class name
 - [ ] Reviewed plan
 - [ ] Double checked there's no additional resources in there
 - [ ] Are you definitely sure? Ok now re-run the Destroy workflow with `Apply changes after plan?` set to `yes`
