data "aws_caller_identity" "current" {}
data "aws_iam_policy_document" "trust" {
  statement {
    principals {
      identifiers = [data.aws_caller_identity.current.account_id]
      type        = "AWS"
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "one" {
  statement {
    actions   = ["ec2:DescribeInstances"]
    resources = ["*"]
  }
}
data "aws_iam_policy_document" "two" {
  statement {
    actions   = ["ec2:DescribeVpcs"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "test_compute_of_count" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [module.role_with_boundary.iam_role_arn]
  }
}

data "aws_iam_policy_document" "boundary" {
  statement {
    actions   = ["ec2:DescribeInstances"]
    resources = ["*"]
  }
}