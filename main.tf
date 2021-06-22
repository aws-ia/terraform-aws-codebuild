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
    git_submodules_config { fetch_submodules = true }
    buildspec = var.build_spec
  }

  environment {
    image                       = var.build_image
    type                        = "LINUX_CONTAINER"
    compute_type                = var.compute_type
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "ENVIRONMENT"
      value = var.environment
    }
    environment_variable {
      name  = "SKIPVALIDATIONFAILURE"
      value = var.skip_validation_failure
    }
    environment_variable {
      name  = "ENABLE_TFVALIDATE"
      value = var.enable_tf_validate
    }
    environment_variable {
      name  = "ENABLE_TFFORMAT"
      value = var.enable_tf_format
    }
    environment_variable {
      name  = "ENABLE_TFCHECKOV"
      value = var.enable_tf_checkov
    }
    environment_variable {
      name  = "ENABLE_TFSEC"
      value = var.enable_tf_tfsec
    }
    environment_variable {
      name  = "TF_VERSION"
      value = var.tf_version
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
