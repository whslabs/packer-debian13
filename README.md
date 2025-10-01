```sh
packer init -upgrade debian13.pkr.hcl
packer build debian13.pkr.hcl
```
```sh
sudo cp output-debian13/packer-debian13 /var/lib/libvirt/images/debian13-test.qcow2
virt-install \
    --boot loader=/usr/share/edk2/ovmf/OVMF_CODE.fd \
    --connect qemu:///system \
    --disk /var/lib/libvirt/images/debian13-test.qcow2 \
    --graphics clipboard.copypaste=no\
    --import \
    --memory 2048 \
    --name debian13-test \
    --network bridge:virbr0 \
    --os-variant debian13 \
    --vcpus 2 \
  ;
```
```sh
sudo apt-get install -y ibus-mozc
```
https://github.com/google/mozc/blob/master/docs/configurations.md
