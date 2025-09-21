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
  iso_checksum      = "bfc338e671fd5a9f6d4a65cbf728c674c468e87c063f6fb324fc04677dc0d23d"
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
