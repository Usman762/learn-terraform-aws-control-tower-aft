provider "aws" {
  alias  = "ct_account"
  region = var.ct_home_region
}


# provider "aws" {
#   alias  = "aft_account"
#   region = var.ct_home_region
#   assume_role {
#     role_arn = "arn:aws:iam::703831902207:role/trusted_role"
#     session_name = "TerraformSession"
#   }  
# }

data "aws_caller_identity" "current" {}
