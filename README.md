# Terraform AWS CodeBuild
This module deploys Terraform-managed AWS CodeBuild.

Author: Tony Vattahil (tonynv@amazon.com)

# Install Terraform
To deploy this module you must install Terraform. See [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) for a tutorial. 

# Sign up for Terraform Cloud
Sign up and log into [Terraform Cloud](https://app.terraform.io/signup/account). (There is a free tier available.)

## Configure Terraform Cloud API Access

Generate a Terraform Cloud token.

`terraform login` 

Export the TERRAFORM_CONFIG variable.

`export TERRAFORM_CONFIG="$HOME/.terraform.d/credentials.tfrc.json"`

# Configure your tfvars file

_Example filepath_ = `$HOME/.aws/terraform.tfvars`

_Example tfvars file contents_ 

In the example, replace *** with your AKEY and SKEY.

```
AWS_SECRET_ACCESS_KEY = "*****************"
AWS_ACCESS_KEY_ID = "*****************"
AWS_SESSION_TOKEN = "*****************"
```

Note: STS-based credentials are optional but highly recommended. 

> !!!!CAUTION!!!!: Make sure your credentials are secured outside of version control and follow secrets-management best practices.

# Deploy the module (Linux or Mac)

Clone the aws-ia/terraform-aws-codebuild repository.

`git clone https://github.com/aws-ia/terraform-aws-codebuild`

Change directory to the root directory.

cd terraform-aws-codebuild/

Change to the deploy directory.

`cd setup_workspace`. 


Run to following commands in order:

`terraform init`

`terraform apply`  or `terraform apply  -var-file="$HOME/.aws/terraform.tfvars"`.

Change directory to the deploy directory. (The previous command automatically generates backend.hcl.)

`cd ../deploy`

`terraform apply` or `terraform apply  -var-file="$HOME/.aws/terraform.tfvars"`. 

Terraform apply is run remotely in Terraform Cloud.





