module "prod" {
  source = "../../code"
  rgname = "prodrg01"
  location = "central india"
  vmname = "vm01"
  nicname = "prod-vmnic01"
  vnetname = "prod-vmvnet01"
  ipaddress = ["10.0.0.0/16"]
  addprefix = [ "10.0.0.0/24" ]
  pass = "P@$$w0rd1234!"
}