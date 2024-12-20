project_id = "friendly-brand-441407-b4"
region     = "us-east1"
zone       = "us-east1-b"
vm_config = {
    vm_name = "flask-app-1"
    vm_type = "f1-micro"
    vm_image = "debian-cloud/debian-11"
    vm_startup_script = "sudo apt-get install -yq build-essential python3-pip rsync;pip install flask"

}

vm_tags = ["ssh",
           "http-server",
           "flask"]