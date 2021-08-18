output "codebuild_arn" {
  description = "CodeBuild Arn"
  value       = aws_codebuild_project.codebuild_project.arn
}

output "codebuild_id" {
  description = "CodeBuild Id"
  value       = aws_codebuild_project.codebuild_project.id
}

output "codebuild_badge_url" {
  description = "CodeBuild Badge Url"
  value       = aws_codebuild_project.codebuild_project.badge_url
}

