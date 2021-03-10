provider "aws" {
  region  = "eu-west-1"
  profile = "test-account-1"
}
locals {
  tags = {
    Team = "ModuleTesting"
  }
}

module "standard_role" {
  source             = "../../"
  create_role        = true
  role_name          = "IAMModuleTesting_base_standard_role"
  assume_role_policy = data.aws_iam_policy_document.trust.json
  tags               = local.tags
}

module "role_with_boundary" {
  source             = "../../"
  create_role        = true
  role_name          = "IAMModuleTesting_base_role_with_boundary"
  assume_role_policy = data.aws_iam_policy_document.trust.json
  create_boundary    = true
  boundary_name      = "ModuleTestingBoundaryCreation"
  boundary_policy    = data.aws_iam_policy_document.boundary.json
  tags               = local.tags
}

module "boundary_only" {
  source = "../.."

  create_role     = false
  create_boundary = true
  boundary_name   = "ModuleTestingBoundaryOnlyCreation"
  boundary_policy = data.aws_iam_policy_document.boundary.json
  tags            = local.tags
}

module "role_with_boundary_and_policies" {
  source                    = "../../"
  create_role               = true
  role_name                 = "IAMModuleTesting_base_role_with_boundary_and_inline_policies"
  assume_role_policy        = data.aws_iam_policy_document.trust.json
  create_boundary           = true
  boundary_name             = "ModuleTestingBoundaryAndInlinePolicies"
  boundary_policy           = data.aws_iam_policy_document.boundary.json
  inline_policies_to_create = {
    00001 = data.aws_iam_policy_document.one.json
    00002 = data.aws_iam_policy_document.two.json
    00003 = data.aws_iam_policy_document.test_compute_of_count.json
  }
  tags                      = local.tags
}
