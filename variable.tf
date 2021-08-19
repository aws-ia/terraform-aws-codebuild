variable "region" {
  description = "Codebuild region"
  default     = "us-east-1"
}

variable "artifacts_type" {
  description = "Type of artifacts (supports: NO_ARTIFACTS or CODEPIPELINE)"
  default     = "NO_ARTIFACTS"
}

variable "project_name" {
  description = "Codebuild Project Name (Leave empty to autogenerate}"
  default     = "example_project"
}

variable "git_repo" {
  description = "Github repo (FullPath for to pull via git clone) "
  default     = "https://github.com/aws-ia/terraform-modules-examples"
}

variable "git_clone_depth" {
  description = "Repo clone depth"
  default     = "1"
}

variable "build_image" {
  description = "Build container image"
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
}

variable "compute_type" {
  description = "Compute type"
  default     = "BUILD_GENERAL1_MEDIUM"
}

variable "build_spec_file" {
  description = "Build spec file name "
  default     = "buildspecs/terraform_env.yml"

}

variable "tags" {
  description = "Codebuild Tags"
  default     = { "Name" = "aws-ia-codebuild" }
}

variable "create_role_and_policy" {
  description = "Create a new IAM role and policy if true"
  type        = bool
  default     = true
}

variable "codebuild_role_arn" {

  description = "ARN of the existing codebuild role"
  type        = string
  default     = ""
}

### BUILD ENVS

variable "environment" {
  description = "Environment in which the script is run. Eg: develop, main, etc"
  type        = string
  default     = "develop"
}

# BUILD SPEC TEMPLATE VARIABLES
variable "TF_VERSION" {
  type    = string
  default = "1.0.0"
}

### CODE BUILD ENVIORNMENT VARIABLES


variable "codebuild_env_vars" {
  description = "Environment var for CodeBuild"
  type = object({
    LOAD_VARS           = bool
    EXPORT_PROJECT_NAME = string
  })
  default = {
    LOAD_VARS           = true
    EXPORT_PROJECT_NAME = "NAME_OF_PROJECT"
  }
}


