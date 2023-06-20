# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "ct_management_account_id" {}

variable "log_archive_account_id" {}

variable "audit_account_id" {}

variable "aft_management_account_id" {}

variable "github_username" {}

variable "ct_home_region" {}

variable "tf_backend_secondary_region" {}

variable "concurrent_account_factory_actions" {}

variable "maximum_concurrent_customizations" {}
variable "assume_role_arn" {}
variable "aws_profile" {}