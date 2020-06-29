#Module      : LABELS
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source = "git::https://github.com/aashishgoyal246/terraform-labels.git?ref=tags/0.12.0"

  name        = var.name
  application = var.application
  environment = var.environment
  enabled     = var.enabled
  label_order = var.label_order
  tags        = var.tags
}

# Module      : KMS KEY
# Description : This terraform module creates a KMS Customer Master Key (CMK).
resource "aws_kms_key" "default" {
  count                    = var.enabled ? 1 : 0
  description              = var.description
  key_usage                = var.key_usage
  deletion_window_in_days  = var.deletion_window_in_days
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.enable_key_rotation
  customer_master_key_spec = var.customer_master_key_spec
  policy                   = var.policy
  tags                     = module.labels.tags
}

# Module      : KMS ALIAS
# Description : Provides an alias for a KMS customer master key.
resource "aws_kms_alias" "default" {
  count         = var.enabled && var.alias_enabled ? 1 : 0
  name          = coalesce(var.alias, format("alias/%v", module.labels.id))
  target_key_id = join("", aws_kms_key.default.*.id)
}