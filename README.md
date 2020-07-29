This folder hold a small process to setup and test VMs deployment under Proxmox VE using terraform.
First of all, a template should be defined under PVE.
For this test, a fresh debian install has been setup to template. Note that Cloud-init images could be used too.




STEPS:
1. Define server template
2. Check debianInstallGO.txt to setup proxmox provider & provisoner under debian
3. Setup following VARs under ".bashrc" or ".profile" depending to your choice:

- export GOROOT=/usr/lib/go
- export GOPATH=$HOME/go
- export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

3. Clone in you favorite directory and adjust VARs
4. Use terraform init, plan & apply

Resources:
https://www.terraform.io/docs/providers/type/community-index.html

https://pve.proxmox.com/wiki/Cloud-Init_Support

https://github.com/Telmate/terraform-provider-proxmox

https://norocketscience.at/provision-proxmox-virtual-machines-with-terraform/


- [ ] Add Proxmox Template Creation Process
- [ ] Show VM management using ansible

