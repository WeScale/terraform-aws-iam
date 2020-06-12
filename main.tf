provider "aws" {
  region = "eu-west-1"

}

data "aws_iam_policy_document" "role" {
  count = "${length(keys(var.principals))}"

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = element(keys(var.principals), count.index)
      identifiers =[var.principals[element(keys(var.principals), count.index)]]
    }
  }
}
module "assume_role_policy" {
  source             = "../terraform-aws-policies_collect-wsc/"
  policies_documents = data.aws_iam_policy_document.role.*.json
}
module "policies" {
  source             = "../terraform-aws-policies_collect-wsc/"
  policies_documents = var.policies
}

resource "aws_iam_role" "default" {
  name                  = var.name_iam_role
  assume_role_policy    = module.assume_role_policy.policies_result_document
  force_detach_policies = var.force_detach_policies
  max_session_duration  = var.max_session_duration
  tags                  = var.tags
}
resource "aws_iam_policy" "default" {
  count       = var.enabled == "true" && length(var.policies)> 0 ? 1 : 0
  name        = var.name_iam_policy
  description = var.policy_description
  policy      = module.policies.policies_result_document
}
resource "aws_iam_role_policy_attachment" "default" {
  count      = var.enabled == "true" && length(var.policies) > 0 ? 1 : 0
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default[count.index].arn
}
resource "aws_iam_role_policy_attachment" "defined" {
  count      = var.enabled == "true" && length(var.defined_policies) > 0 ? 1 : 0
  role       = aws_iam_role.default.name
  policy_arn = var.defined_policies[count.index]
}