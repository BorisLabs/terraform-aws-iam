output "policy_map" {
  value = local.iam_policy_map
}

locals {
  iam_policy_map = {
    test-1 = data.aws_iam_policy_document.test-1.json
    test-2 = data.aws_iam_policy_document.test-2.json
  }
}

data "aws_iam_policy_document" "test-1" {
  statement {
    actions = ["ec2:*"]
    effect = "Allow"
    resources = ["*"]
    sid = "TestingPolicy1"
  }
}

data "aws_iam_policy_document" "test-2" {
  statement {
    actions = ["s3:*"]
    effect = "Allow"
    resources = ["*"]
    sid = "TestingPolicy2"
  }
}