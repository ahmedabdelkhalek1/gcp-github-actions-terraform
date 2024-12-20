variable "project_id" {
  type        = string
}

variable "region" {
  type    = string
}

variable "zone" {
  type = string
  
}

variable "vm_config" {
  description = "the VM configuration variables "
  type = object({
    vm_name = string
    vm_type = string
    vm_image = string
    vm_startup_script = string
  }
  )
}
 variable "vm_tags" {
  type = list(string)
}
   
 