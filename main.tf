resource "azurerm_managed_disk" "os-disk" {
  name                 = "${var.vm_hostname}-disk-opt"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "os-disk-attach" {
  managed_disk_id    = azurerm_managed_disk.os-disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.vm.id
  lun                = "10"
  caching            = "ReadWrite"
}

resource "azurerm_network_interface" "vm-nic" {
  name                          = "${var.vm_hostname}-nic"
  resource_group_name           = var.resource_group_name
  location                      = var.location

  ip_configuration {
    name                          = "${var.vm_hostname}-ip"
    subnet_id                     = var.vnet_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip_address
    primary                       = "true"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_hostname
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_key
  }

  network_interface_ids = [
    azurerm_network_interface.vm-nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.vm_os_publisher
    offer     = var.vm_os_offer
    sku       = var.vm_os_sku
    version   = var.vm_os_version
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      source_image_reference
    ]
  }

  tags = var.tags
}
