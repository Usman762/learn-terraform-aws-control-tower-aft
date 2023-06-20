# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "aft" {
  source                      = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

  # vcs_provider                                  = "github"
  # account_request_repo_name                     = "${var.github_username}/learn-terraform-aft-account-request"
  # account_provisioning_customizations_repo_name = "${var.github_username}/learn-terraform-aft-account-provisioning-customizations"
  # global_customizations_repo_name               = "${var.github_username}/learn-terraform-aft-global-customizations"
  # account_customizations_repo_name              = "${var.github_username}/learn-terraform-aft-account-customizations"
  concurrent_account_factory_actions = var.concurrent_account_factory_actions
  maximum_concurrent_customizations  = var.maximum_concurrent_customizations
}

resource "aws_servicecatalog_principal_portfolio_association" "this" {
  depends_on = [
    module.aft
  ] 
  provider = aws.ct_account
  portfolio_id  = "port-gkgdwa7ff2w6g"
  principal_arn = "arn:aws:iam::${var.ct_management_account_id}:role/AWSAFTExecution"
}

resource "null_resource" "push_code" {
  # Trigger the null_resource when the CodeCommit repository is created
  triggers = {
    repository_name = module.aft.account_request_repo_name
    always_run = "${timestamp()}"
  }

  # Run a local-exec provisioner that executes a git command
  provisioner "local-exec" {
    command = <<EOF
      aws sts assume-role --role-arn ${var.assume_role_arn} --role-session-name Testing --profile ${var.aws_profile} --output json > test.json && export AWS_ACCESS_KEY_ID=`jq -r '.Credentials.AccessKeyId' test.json` && export AWS_SECRET_ACCESS_KEY=`jq -r '.Credentials.SecretAccessKey' test.json` && export AWS_SESSION_TOKEN=`jq -r '.Credentials.SessionToken' test.json` && aws sts get-caller-identity  
      git clone https://git-codecommit.${var.ct_home_region}.amazonaws.com/v1/repos/${module.aft.account_request_repo_name} ~/aft-account-request
      git checkout main
      rsync -r -a -p account-request/ ~/aft-account-request
      cd ~/aft-account-request
      git add .
      git commit -m "Commit to a repo"
      git push origin main
    EOF
  }
}