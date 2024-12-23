
# Enabling the CRM API
resource "google_project_service" "proj_net_hub_prod_0_crm_service" {
  project                    = "proj-net-hub-prod-0-445614"
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true


}

# Enabling the remaining APIs and services
resource "google_project_service" "roj_net_hub_prod_0_services" {
  count                      = length(var.roj_net_hub_prod_0_services)
  project                    = "proj-net-hub-prod-0-445614"
  service                    = var.roj_net_hub_prod_0_services[count.index]
  disable_dependent_services = true

  depends_on = [
    google_project_service.proj_net_hub_prod_0_crm_service
  ]
}

# Budget alert for the project
resource "google_billing_budget" "proj_net_hub_prod_0_budget" {
  billing_account = var.billing_account
  display_name    = "budget-proj-net-hub-prod-0-445614"

  budget_filter {
    projects = ["projects/${proj_net_hub_prod_0.number}"]
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
      google_monitoring_notification_channel.proj_net_hub_prod_0_notification_channel.id,
    ]
    disable_default_iam_recipients = true
  }

  depends_on = [
    proj_net_hub_prod_0
  ]
}

# Project notification channels (email)
resource "google_monitoring_notification_channel" "proj_net_hub_prod_0_notification_channel" {
  project      = "proj_net_hub_prod_0"
  display_name = "DISPLAY NAME"
  type         = "email"

  labels = {
    email_address = "USER@EXAMPLE.COM" # CHANGE THIS
  }


}
