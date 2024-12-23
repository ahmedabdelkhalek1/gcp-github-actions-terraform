#folder "my GCP ENV"
resource "google_folder" "my_gcp_env_root" {
    display_name = "My GCP Env"
    parent = "projects/475047423340"
  
}
# folder "Network"
resource "google_folder" "network" {
    display_name = "network"
    parent = google.folder.my_gcp_env_root.name
   
  
}
#folder "infrastructure"
resource "google_folder" "infrastructure" {
    display_name = "infrastructure"
    parent = google.folder.my_gcp_env_root.name
   
  
}