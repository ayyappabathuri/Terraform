module "dev" {
  source = "../../code"
  rgname = "devrg01"
  location = "central india"
  vmname = "winvm01"
  nicname = "dev-vmnic01"
  vnetname = "dev-vmvnet01"
  ipaddress = ["10.0.0.0/16"]
  addprefix = [ "10.0.0.0/24" ]
  pass = "P@$$w0rd1234!"
}