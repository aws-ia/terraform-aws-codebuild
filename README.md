# Terraform AWS CodeBuild
This module deploys Terraform-managed AWS CodeBuild.

Author: Tony Vattahil (tonynv@amazon.com)

## Prerequisites
1. Install Terraform. See [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) for a tutorial. 
2. Sign up and log into [Terraform Cloud](https://app.terraform.io/signup/account). There is a free tier available.

## Configure Terraform Cloud API access

1. Generate a Terraform Cloud token.<br>
   `terraform login`

2. Export the `TERRAFORM_CONFIG` variable.<br>
   `export TERRAFORM_CONFIG="$HOME/.terraform.d/credentials.tfrc.json"`

## Configure your .tfvars file
   
**Example file path**<br>
   `$HOME/.aws/terraform.tfvars`
      
**Example .tfvars file contents**

   In the following example, replace asterisks with your AKEY and SKEY.
   ```
   AWS_SECRET_ACCESS_KEY = "*****************"
   AWS_ACCESS_KEY_ID = "*****************"
   AWS_SESSION_TOKEN = "*****************"
   ```
 **Note:** STS-based credentials are optional but highly recommended. 

 **WARNING:** Make sure your credentials are secured outside of version control and follow secrets-management best practices.

## Deploy the module (Linux or MacOS)

1. Clone the **aws-ia/terraform-aws-codebuild** repository.<br>
   `git clone https://github.com/aws-ia/terraform-aws-codebuild`

2. Change to the module root directory.<br>
   `cd terraform-aws-codebuild`

3. Set up your Terraform cloud workspace.<br>
   `cd setup_workspace` 

4. Run the following commands in order:<br>
   `terraform init`<br>
   `terraform apply`  or `terraform apply  -var-file="$HOME/.aws/terraform.tfvars"`.
   
   **Note:** Terraform apply runs remotely in Terraform Cloud.

5. Change to the deploy directory.<br>
   `cd ../deploy`

6. Open **dev.auto.tfvars** and edit the default values to match your environment.




