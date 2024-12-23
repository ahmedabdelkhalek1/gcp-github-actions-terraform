
# Enabling the CRM API
resource "google_project_service" "proj_infra_bapp1_prod_0_crm_service" {
  project                    = "proj-infr-bapp1-prod-0"
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true


}

# Enabling the remaining APIs and services
resource "google_project_service" "proj_infra_bapp1_prod_0_services" {
  count                      = length(var.proj_infra_bapp1_prod_0_services)
  project                    = "proj-infr-bapp1-prod-0"
  service                    = var.proj_infra_bapp1_prod_0_services[count.index]
  disable_dependent_services = true

  depends_on = [
    google_project_service.proj_infra_bapp1_prod_0_crm_service
  ]
}

# Budget alert for the project
resource "google_billing_budget" "proj_infra_bapp1_prod_0_budget" {
  billing_account = var.billing_account
  display_name    = "budget-proj-infr-bapp1-prod-0"

  budget_filter {
    projects = ["proj_infra_bapp1_prod_0"]
  }


  amount {
    specified_amount {
      currency_code = "USD"
      units         = "50"
    }
  }

  threshold_rules {
    threshold_percent = 0.25
  }
  threshold_rules {
    threshold_percent = 0.50
  }
  threshold_rules {
    threshold_percent = 0.75
  }
  threshold_rules {
    threshold_percent = 1.0
  }
  threshold_rules {
    threshold_percent = 0.9
    spend_basis       = "FORECASTED_SPEND"
  }

  all_updates_rule {
    monitoring_notification_channels = [
      google_monitoring_notification_channel.proj_infra_bapp1_prod_0_notification_channel_1.id,
      google_monitoring_notification_channel.proj_infra_bapp1_prod_0_notification_channel_2.id
    ]
    disable_default_iam_recipients = true
  }


}

# Project notification channels (email)
resource "google_monitoring_notification_channel" "proj_infra_bapp1_prod_0_notification_channel_1" {
  project      = "proj_infra_bapp1_prod_0"
  display_name = "USER@EXAMPLE.COM" # CHANGE THIS
  type         = "email"

  labels = {
    email_address = "USER@EXAMPLE.COM" # CHANGE THIS
  }


}

# Project notification channels (email)
resource "google_monitoring_notification_channel" "proj_infra_bapp1_prod_0_notification_channel_2" {
  project      = "proj_infra_bapp1_prod_0"
  display_name = "DISPLAY NAME"
  type         = "email"

  labels = {
    email_address = "USER@EXAMPLE.COM" # CHANGE THIS
  }


}
