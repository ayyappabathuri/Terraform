variable "rg_name" {
  type = string
  description = "accession value from here"
}
variable "location" {
  type = string
  default = "westus2"
}
variable "vnet01_name" {
  type = string
}
variable "subnet01_name" {
  type = string
}
variable "vnet_ip" {
  type = list(string)
}
variable "nic_name" {
  type = string
}
variable "ipconfig_name" {
  type = string
}
variable "vm_name" {
  type = string
}
