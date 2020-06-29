#Module      : LABELS
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "application" {
  type        = string
  default     = ""
  description = "Application (e.g. `cd` or `clouddrove`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "enabled" {
  type        = bool
  default     = false
  description = "Flag to control the vpc creation."
}

variable "label_order" {
  type        = list
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

# Module      : KMS KEY
# Description : Provides a KMS customer master key.
variable "deletion_window_in_days" {
  type        = number
  default     = 10
  description = "Duration in days after which the key is deleted after destruction of the resource."
}

variable "enable_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled."
}

variable "description" {
  type        = string
  default     = "Parameter Store KMS master key"
  description = "The description of the key as viewed in AWS console."
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the key is enabled."
}

variable "key_usage" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  description = "Specifies the intended use of the key. Defaults to ENCRYPT_DECRYPT, and only symmetric encryption and decryption are supported."
}

variable "alias_enabled" {
  type        = bool
  default     = false
  description = "Whether alias is enabled or not."
}

variable "alias" {
  type        = string
  default     = ""
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash."
}

variable "policy" {
  type        = string
  default     = ""
  description = "A valid policy JSON document. For more information about building AWS IAM policy documents with Terraform."
}

variable "customer_master_key_spec" {
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT."
}