resource "google_compute_instance" "vm_instance" {
  name         = var.vm_config.vm_name
  machine_type = var.vm_config.vm_type
  zone         = var.zone
  tags         = var.vm_config.vm_tags

  boot_disk {
    initialize_params {
      image = var.vm_config.vm_image
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
}
