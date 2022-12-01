resource "azurerm_network_interface" "backend" {
  name                = "backend-nic1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.backend.id
  }
}

resource "azurerm_network_security_group" "backend" {
  name                = "backend"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "ssh"
    priority                   = 100
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "22"
    destination_address_prefix = azurerm_network_interface.backend.private_ip_address
  }

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "http"
    priority                   = 101
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "80"
    destination_address_prefix = azurerm_network_interface.backend.private_ip_address
  }
}

resource "azurerm_network_interface_security_group_association" "backend" {
  network_interface_id      = azurerm_network_interface.backend.id
  network_security_group_id = azurerm_network_security_group.backend.id
}

data "template_cloudinit_config" "backend" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = <<-EOT
      write_files:
      - path: /opt/ansible_vault_password
        permissions: "0640"
        owner: root
        content: ${var.ansible_vault_password}

      packages:
      - ansible

      runcmd:
      - ANSIBLE_REMOTE_TEMP=/tmp/.ansible ansible-pull --url ${var.ansible_pull_git_repo} --full --vault-password-file /opt/ansible_vault_password ${var.backend_vm_ansible_playbook}
    EOT
  }
}

resource "azurerm_linux_virtual_machine" "backend" {
  name                            = var.backend_vm_name
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = var.backend_vm_size
  admin_username                  = var.backend_vm_admin
  custom_data                     = data.template_cloudinit_config.backend.rendered

  admin_ssh_key {
    username   = var.backend_vm_admin
    public_key = var.vm_admin_ssh_key
  }

  network_interface_ids = [ azurerm_network_interface.backend.id ]

  source_image_reference {
    publisher = var.backend_vm_image.publisher
    offer     = var.backend_vm_image.offer
    sku       = var.backend_vm_image.sku
    version   = var.backend_vm_image.version
  }

  os_disk {
    storage_account_type = "StandardSSD_LRS"
    caching              = "ReadWrite"
  }
}
