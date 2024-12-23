project_id = "friendly-brand-441407-b4"
region     = "us-east1"
zone       = "us-east1-b"
subnet_ip_range = "10.0.1.0/24"
vpc_auto_create_subnets = false
vpc_mtu = 1460

vm_config = {
    vm_name = "flask-app-2"
    vm_type = "f1-micro"
    boot_disk_size = 10
    vm_image = "debian-cloud/debian-11"
    vm_startup_script = "sudo apt-get install -yq build-essential python3-pip rsync;pip install flask"
    vm_tags = ["ssh",
            "http-server",
            "flask"]
            }

billing_account = "019B2C-16B023-897455"

proj_net_hub_prod_0_services = [
  "compute.googleapis.com",
  "servicenetworking.googleapis.com"
]

proj_infra_bapp1_prod_0_services = [
  "compute.googleapis.com",
  "sql-component.googleapis.com",
  "sqladmin.googleapis.com",
  "servicenetworking.googleapis.com",
  "iap.googleapis.com",
  "secretmanager.googleapis.com"
]

proj_infra_iam_test_0_services = [
  "compute.googleapis.com",
  "sql-component.googleapis.com",
  "sqladmin.googleapis.com",
  "servicenetworking.googleapis.com"
]
