/*
- target_node (the name of your Proxmox instance) |
- name (the name of the virtual server)
- clone (the name of the template in Proxmox)
- cores
- memory
- storage (the right storage pool in Proxmox)
- ipconfig0 (Use the right IP range for your servers - 
the count.index is necessary if you have more then one server configured - 
like the k3s_agents in the example below)
*/


resource "proxmox_vm_qemu" "deb10Template_Test" {
  count             = 1
  name              = "testDeb10Template-${count.index}"
  target_node       = "tester"

  clone             = "Debian10.4-Template"

  os_type           = "cloud-init"
  cores             = 2
  sockets           = "1"
  cpu               = "host"
  memory            = 2024
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"

  disk {
    id              = 0
    size            = 30
    type            = "scsi"
    storage         = "m1ZfsPool"
    storage_type    = "lvm"
    iothread        = true
  }

  lifecycle {
    ignore_changes  = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0         = "ip=10.0.0.48${count.index + 1}/24,gw=10.0.0.1"

}
