# DNS module variables
variable "dns_zone" {
  default = "shatohin.space"
}

# Cloud Init variables
variable "ansible_vault_password" {
  sensitive = true
}

variable "ansible_pull_git_repo" {
  default = "https://github.com/dshatohin/weatherapp.git"
}

variable "vm_admin_ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6PGHMAVSU2vDAkAcFX6+H8YhacXIXjn6EdHKQf+iNEDBwA5oj2Tor0ae1uzIfToOOrO+jSJg5Oj9G70N/uJi0LkH9yuIpsA6KG5d5k+Vgr+GHBKCUGO7oyWyGbG23Z4vaV0FSutDWZBZj3EwrocXEU/4/9Ccb4onvk0ynnYGBCp1+rSp0UHw4iGavgQfTyi4l42NeDbF9as3IKyKu+0elZV1t5/o+YxpFsXvAMLrrZ4EpjynEdEMBBXNkahHN0TITy5vIfL/wPPwD7Hm3pziXYELOg7XMCCmLsMGAWwz2RCVhuX9dw9qUGw2VKAAakxP5T+Eju/kEULdSE5XCt0sL+uScR2lVRiP0+1hAmJCb9N0cS2niTOi8XYsjh6Y+KzfTVshTIpbjqgaEZmNbck09n7Jw99h31EM7o4ry6coAxn0zfix/nfGHXIQg97AEaJVW/WD29yIrwBoKoqbpFJ2r8TMbIaRuUGIlPlg57me22MEEQSUmR3fdDjUylQGUUnuZ2nmNthXUMyr27Hr0WROn17R5PpBHQ45eO7CwVL6wzI5CN0zlnUa7oHeVZKqkK8rvqto89ssWLP0BvDPzXFsuFkkcz/c1aJPCXYwNACFvTcEPZJn9FLz/er/RXWwnqMjDVqm2ZBnOB+dXcGd0PQBHeRZC3uYxPsx/Keay4OsBwQ=="
}

# Frontend VM variables
variable "frontend_vm_name" {
  default = "frontend-vm"
}

variable "frontend_vm_size" {
  default = "Standard_B1s"
}

variable "frontend_vm_admin" {
  default = "mainadmin"
}

variable "frontend_vm_ansible_playbook" {
  default = "ansible/frontend.yml"
}

variable "frontend_vm_image" {
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

# Backend VM variables
variable "backend_vm_name" {
  default = "backend-vm"
}

variable "backend_vm_size" {
  default = "Standard_B1s"
}

variable "backend_vm_admin" {
  default = "mainadmin"
}

variable "backend_vm_ansible_playbook" {
  default = "ansible/backend.yml"
}

variable "backend_vm_image" {
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

# Network variables
variable "network_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  default = ["10.0.2.0/24"]
}
