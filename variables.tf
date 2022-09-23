variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default     = ""
}

variable "location" {
  description = "(Optional) The location in which the resources will be created."
  type        = string
  default     = ""
}

variable "vnet_subnet_id" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
  type        = string
}

variable "ssh_key" {
  description = "the public key to be used for ssh access to the VM. Only used with non-Windows vms and can be left as-is even if using Windows vms. If specifying a path to a certification on a Windows machine to provision a linux vm use the / in the path versus backslash. e.g. c:/home/id_rsa.pub."
  type        = string
  default     = ""
}

variable "admin_username" {
  description = "The admin username of the VM that will be deployed."
  type        = string
  default     = "azureuser"
}

variable "storage_account_type" {
  description = "Defines the type of storage account to be created. Valid options are Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS."
  type        = string
  default     = "Standard_LRS"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vm_hostname" {
  description = "local name of the Virtual Machine."
  type        = string
  default     = "myvm"
}

variable "vm_os_publisher" {
  description = "The name of the publisher of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  type        = string
  default     = ""
}

variable "vm_os_offer" {
  description = "The name of the offer of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  type        = string
  default     = ""
}

variable "vm_os_sku" {
  description = "The sku of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  type        = string
  default     = ""
}

variable "vm_os_version" {
  description = "The version of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  type        = string
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}

variable "disk_size_gb" {
  description = "Storage data disk size size."
  type        = number
  default     = 30
}

variable "private_ip_address" {
  description = "The private Address of the Vm"
  type        = string
  default     = ""
}
