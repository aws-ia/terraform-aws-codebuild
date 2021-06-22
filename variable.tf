variable "region" {
  description = "Codebuild region"
  default     = "us-east-1"
}

variable "artifacts_type" {
  description = "Type of artifacts (supports: NO_ARTIFACTS or CODEPIPELINE)"
  default     = "NO_ARTIFACTS"
}

variable "project_name" {
  description = "Project Name (Only alpha chars and dashes allowed)"
  default     = "terraform-examples"
}

variable "git_repo" {
  description = "Github repo "
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

variable "build_spec" {
  description = "Build spec filename"
  default     = "build_spec.yml"
}

variable "tags" {
  description = "Codebuild Tags"
  default     = {}
}

variable "create_role_and_policy" {
  description = "Create a new IAM role and policy if true"
  type        = bool
  default     = true
}
