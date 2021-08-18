#########
# Defaults
##########

provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0.0"
}


resource "aws_codebuild_project" "codebuild_project" {
  name          = var.project_name
  description   = var.project_name
  build_timeout = "120"
  service_role  = var.create_role_and_policy ? aws_iam_role.codebuild_role[0].arn : var.codebuild_role_arn


  artifacts {
    type = var.artifacts_type
  }

  source {
    type            = "GITHUB"
    location        = var.git_repo
    git_clone_depth = var.git_clone_depth
    buildspec       = templatefile("${path.module}/${var.build_spec_file}", {})
    git_submodules_config {
      fetch_submodules = true
    }
  }

  environment {
    image                       = var.build_image
    type                        = "LINUX_CONTAINER"
    compute_type                = var.compute_type
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    dynamic "environment_variable" {
      for_each = var.codebuild_env_vars["LOAD_VARS"] != false ? var.codebuild_env_vars : {}
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }

  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status = "DISABLED"
    }
  }

  tags = merge(var.tags, { "created_by" = "AWS-ia Terraform Module" })
}

# IAM
resource "aws_iam_role" "codebuild_role" {
  count = var.create_role_and_policy ? 1 : 0
  name  = "${var.project_name}_codebuild_deploy_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "codebuild_deploy" {
  role       = aws_iam_role.codebuild_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
