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

output "codebuild_tags_all" {
  description = "CodeBuild Badge Url"
  value       = aws_codebuild_project.codebuild_project.tags_all
}

output "codebuild_role_arn" {
  description = "CodeBuild Role Arn"
  value       = var.create_role_and_policy ? aws_iam_role.codebuild_role[0].arn : var.codebuild_role_arn
}

