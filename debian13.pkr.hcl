packer {
  required_plugins {
    qemu = {
      source  = "github.com/hashicorp/qemu"
      version = "~> 1.1.4"
    }
  }
}

source "qemu" "debian13" {
  accelerator       = "kvm"
  boot_wait         = "5s"
  cpus              = 4
  disk_size         = "100G"
  efi_boot          = true
  http_directory    = "http"
  iso_checksum      = "65db3a76de52257ca93ed91afce320bc535785d668b55be1b42bab85e7d4f1f6"
  iso_url           = "https://deb.debian.org/debian/dists/trixie/main/installer-amd64/current/images/netboot/mini.iso"
  memory            = 4096
  ssh_password      = "packer"
  ssh_timeout       = "1h"
  ssh_username      = "packer"
  boot_command = [
    "e<down><down><down><end> ",
    "auto=true priority=critical url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/trixie/preseed.cfg<f10>"
  ]
}

build {
  sources = ["source.qemu.debian13"]
}
