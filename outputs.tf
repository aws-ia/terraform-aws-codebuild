output "codebuild_arn" {
  description = "CodeBuild Arn"
  value       = aws_codebuild_project.codebuild_project.arn
}

