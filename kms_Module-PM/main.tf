provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWI7TGBPHBVNDQAN7"
  secret_key = "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"
}

resource aws_kms_key this {
  description             = var.description
  key_usage               = "ENCRYPT_DECRYPT"
  policy                  = var.iam_policy
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.is_enabled
  enable_key_rotation     = var.enable_key_rotation
  tags                    = var.tags
}

resource aws_kms_alias this {
  name          = "alias/${var.alias_name}"
  target_key_id = aws_kms_key.this.id
}