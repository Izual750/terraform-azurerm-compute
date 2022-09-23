output "vm_id" {
  description = "VM ID:"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "nic_id" {
  description = "VM NIC ID"
  value       = azurerm_network_interface.vm-nic.id
}
