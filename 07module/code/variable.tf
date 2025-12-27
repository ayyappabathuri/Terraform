variable "rgname" {
    type = string
}
variable "vmname" {
  type = string
}
variable "location" {
  type = string
}
variable "vnetname" {
  type = string
}
variable "ipaddress" {
  type = list(string)
}

variable "addprefix" {
  type = list(string)
}
variable "nicname" {
  type = string
}
variable "pass" {
  type = string
  sensitive = true
}