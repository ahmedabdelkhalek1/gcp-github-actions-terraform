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
