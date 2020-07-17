output "iam_id" {
  value       = aws_iam_role.default.id
  description = "IAM role  ID "
}
output "iam_arn" {
  value = aws_iam_role.default.arn
}
output "iam_defined_attachements" {
  value = aws_iam_role_policy_attachment.defined.*
}
output "iam_customize_attachements" {
  value = aws_iam_role_policy_attachment.default.*
}