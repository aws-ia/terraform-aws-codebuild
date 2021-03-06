###########
# Defaults
##########

provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0.0"
  backend "remote" {}
}

module "codebuild" {
  source                 = "../"
  build_image            = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
  build_spec_file        = var.build_spec_file
  compute_type           = "BUILD_GENERAL1_MEDIUM"
  environment            = var.environment
  git_clone_depth        = "1"
  http_git_clone_url     = "https://github.com/aws-ia/terraform-modules-examples"
  project_name           = var.project_name
  codebuild_env_vars     = var.codebuild_env_vars
  create_role_and_policy = true
  tags                   = merge(var.tags, module.repo_label.tags)
}

##########
# AWS Label 
##########

module "repo_label" {
  source    = "aws-ia/label/aws"
  version   = "0.0.2"
  region    = var.region
  namespace = "aws-ia"
  account   = "t"
  env       = "d"
  name      = "cb"
  delimiter = "-"
  tags      = tomap({ propogate_at_launch = "true", "terraform" = "true" })
}
