rg_name = "importrg"
location = "EAST US"
vnet01_name = "importvnet"
subnet01_name = "default"
vnet_ip = [ "10.0.0.0/24" ]
nic_name = "vmnic01"
vm_name = "vm01"
ipconfig_name = "ipconfig01"

#terraform apply --var-file="values.tfvars"
#terraform apply -var="env=dev"--> like this we can change values in cli