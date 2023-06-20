module "sandbox" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "usman@copebit.ch"
    AccountName               = "sandbox-aft"
    ManagedOrganizationalUnit = "Demo"
    SSOUserEmail              = "usman@copebit.ch"
    SSOUserFirstName          = "Sandbox"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "HashiCorp Learn"
    change_reason       = "Learn AWS Control Tower Account Factory for Terraform"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "sandbox"
}

module "second_account" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "usmanzahid@copebit.ch"
    AccountName               = "second-aft"
    ManagedOrganizationalUnit = "Demo"
    SSOUserEmail              = "usmanzahid@copebit.ch"
    SSOUserFirstName          = "Second"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Learn Tutorial" = "AFT-2nd"
  }

  change_management_parameters = {
    change_requested_by = "Usman Zahid"
    change_reason       = "Provisiong second Account"
  }

  custom_fields = {
    group = "prod"
  }

  account_customizations_name = "sandbox-aft-account"
}

module "third_account" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "usmanzahid-dev@copebit.ch"
    AccountName               = "third-aft"
    ManagedOrganizationalUnit = "Demo"
    SSOUserEmail              = "usmanzahid-dev@copebit.ch"
    SSOUserFirstName          = "Third"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Learn Tutorial" = "AFT-2nd"
  }

  change_management_parameters = {
    change_requested_by = "Usman Zahid"
    change_reason       = "Provisiong Third Account"
  }

  custom_fields = {
    group = "prod"
  }

  account_customizations_name = "sandbox-aft-third-account"
}
