variable "project_id" {
  type        = string
}

variable "region" {
  type    = string
}

variable "zone" {
  type = string
  
}

variable "subnet_ip_range" {
    type = string
    description = "The IPv4 CIDR range to be used in the VPC that will be created"
}
variable "vpc_auto_create_subnets" {
    type = bool
    description = "Defines the behavior for the VPC whether we want to use it in auto mode (true) or a custom VPC (false)"
}

variable "vpc_mtu" {
    type = number
    description = "The value of the MTU for our new VPC"
}
variable "vm_config" {
  description = "the VM configuration variables "
  type = object({
    vm_name = string
    vm_tags = list(string)
    vm_type = string
    vm_image = string
    boot_disk_size = number
    vm_startup_script = string
  }
  )
}


 