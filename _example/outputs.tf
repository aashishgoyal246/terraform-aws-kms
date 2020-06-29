# Module      : KMS KEY
# Description : This terraform module creates a KMS Customer Master Key (CMK) and its alias.
output "key_arn" {
  value       = module.kms_key.key_arn
  description = "Key ARN."
}

output "tags" {
  value       = module.kms_key.tags
  description = "A mapping of tags to assign to the KMS."
}