output "iam_role_arn" {
  value = aws_iam_role.iam_role[*].arn
}

output "iam_role_name" {
  value = aws_iam_role.iam_role[*].name
}

output "iam_policies_arn" {
  value = concat(
  aws_iam_policy.iam_policy[*].arn,
  aws_iam_policy.global_iam_policy[*].arn,
  aws_iam_policy.iam_boundary[*].arn,
  )
}

output "iam_policies_names" {
  value = concat(
  aws_iam_policy.iam_policy[*].name,
  aws_iam_policy.global_iam_policy[*].name,
  aws_iam_policy.iam_boundary[*].name,
  )
}

output "iam_policy_attachment" {
  value = aws_iam_role_policy_attachment.iam_role[*].policy_arn
}

output "iam_instance_profile" {
  value = aws_iam_instance_profile.iam_instance_profile[*].name
}

output "iam_instance_profile_arn" {
  value = aws_iam_instance_profile.iam_instance_profile[*].arn
}

output "group_name" {
  value = aws_iam_group.this[*].name
}

output "group_id" {
  value = aws_iam_group.this[*].id
}
#