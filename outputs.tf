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

output "codebuild_project_name" {
  description = "CodeBuild Project Name"
  value       = aws_codebuild_project.codebuild_project.name
}

output "git_repo_name" {
  description = "GitRepo Name"
  value       = local.git_repo
}

output "codebuild_tags_all" {
  description = "CodeBuild Badge Url"
  value       = aws_codebuild_project.codebuild_project.tags_all
}


