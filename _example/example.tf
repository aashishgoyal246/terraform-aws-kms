provider "aws" {
  region = "ap-south-1"
}

module "kms_key" {
  source = "../"

  name        = "kms"
  application = "aashish"
  environment = "test"
  label_order = ["environment", "application", "name"]
  
  enabled                 = true
  description             = "KMS key for test."
  deletion_window_in_days = 7
  enable_key_rotation     = true
  alias_enabled           = true
  alias                   = "alias/test"
  policy                  = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  version = "2012-10-17"
  
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
}