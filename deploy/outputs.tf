output "codebuild_arn" {
  description = "CodeBuild Arn"
  value       = module.codebuild.codebuild_arn
}

output "codebuild_id" {
  description = "CodeBuild Id"
  value       = module.codebuild.codebuild_id
}

output "codebuild_badge_url" {
  description = "CodeBuild Badge Url"
  value       = module.codebuild.codebuild_badge_url
}

output "codebuild_tags_all" {
  description = "CodeBuild Badge Url"
  value       = module.codebuild.codebuild_tags_all
}

output "codebuild_project_name" {
  description = "CodeBuild Project Name"
  value       = module.codebuild.codebuild_project_name
}
