module "base_permissions" {
  source = "../iam-policies"
}

module "app_role" {
  source = "../../"

  role_name = "AppRoleTestingModule"
  create_role = true
  role_description = "Application Role Testing"

  assume_role_policy = data.aws_iam_policy_document.trust_policy.json

  policies_to_create = module.base_permissions.policy_map

  tags = {}
}

output "policy_successfully_attached" {
  value = module.app_role.iam_policy_attachment
}

output "role_created" {
  value = module.app_role.iam_role_name[0]
}

data "aws_caller_identity" "this" {}

data "aws_iam_policy_document" "ecs" {
  statement {
    sid       = "BasePolicyPermissionPerRole"
    actions   = ["ecs:*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "ec2" {
  statement {
    sid       = "BasePolicyPermissionPerRole"
    actions   = ["ec2:*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "cloudwatch" {
  statement {
    sid       = "AccessToCloudWatch"
    actions   = ["logs:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect  = "Allow"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.this.account_id}:root"]
      type        = "AWS"
    }
    actions = ["sts:AssumeRole"]
  }
}