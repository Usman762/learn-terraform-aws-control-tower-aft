module "network" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "uzair@copebit.ch"
    AccountName               = "aft-uzair"
    ManagedOrganizationalUnit = "Engineering"
    SSOUserEmail              = "uzair@copebit.ch"
    SSOUserFirstName          = "Uzair"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Copebit-Task" = "AFT-Learning"
  }

  change_management_parameters = {
    change_requested_by = "Copebit"
    change_reason       = "Testing AFT Task"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "network"
}

module "network_02" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "asghar@copebit.ch"
    AccountName               = "aft-asghar"
    ManagedOrganizationalUnit = "Engineering"
    SSOUserEmail              = "asghar@copebit.ch"
    SSOUserFirstName          = "asghar"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Copebit-Task" = "AFT-Task"
  }

  change_management_parameters = {
    change_requested_by = "Copebit"
    change_reason       = "Testing AFT"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "network"
}
