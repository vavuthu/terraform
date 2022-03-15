// vSphere variables

variable "vsphere_server" {
  type        = string
  description = "This is the vSphere server for the environment."
}

variable "vsphere_user" {
  type        = string
  description = "vSphere server user for the environment."
}

variable "vsphere_password" {
  type        = string
  description = "vSphere server password"
}

variable "vsphere_datacenter" {
  type        = string
  description = "This is the name of the vSphere data center."
}

variable "vsphere_datastore" {
  type        = string
  description = "This is the name of the vSphere data store."
}

variable "vsphere_cluster" {
  type        = string
  description = "This is the name of the vSphere cluster."
}


variable "vm_template" {
  type        = string
  description = "This is the name of the VM template to clone."
}

variable "vm_network" {
  type        = string
  description = "This is the name of the publicly accessible network for VM."
  default     = "VM Network"
}

# the name of the vsphere virtual machine that is created. empty by default.
variable "vsphere_virtual_machine_name" {
  type        = string
  description = "This is the name of the VM."
}
