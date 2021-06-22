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
  name          = var.git_repo
  description   = var.git_repo
  build_timeout = "120"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = var.artifacts_type
  }

  source {
    type            = "GITHUB"
    location        = var.git_repo
    git_clone_depth = var.git_clone_depth
    buildspec       = var.build_spec
  }

  environment {
    image                       = var.build_image
    type                        = "LINUX_CONTAINER"
    compute_type                = var.compute_type
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "SOME_KEY1"
      value = "SOME_VALUE1"
    }

    environment_variable {
      name  = "SOME_KEY2"
      value = "SOME_VALUE2"
      type  = "PARAMETER_STORE"
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

  tags = var.tags
}

# IAM
resource "aws_iam_role" "codebuild_role" {
  name = "${var.git_repo}_codebuild_deploy_role"

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
  role       = aws_iam_role.codebuild_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
