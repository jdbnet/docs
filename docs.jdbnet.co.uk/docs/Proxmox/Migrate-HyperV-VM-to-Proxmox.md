- Copy HyperV VHDX files to Proxmox host. ```/root``` will do
- Create your VM in Proxmox with no disks to start with
- Next have qemu-img check the VHDX file for any corruption by running this command...

```bash
qemu-img check -r all '/root/vmname-data.vhdx'
```

- Finally, import the disk using this command...

```bash
qm disk import 109 /root/vmname-data.vhdx local-zfs --format raw
```

- ```109``` is the VM ID
- ```/root/vmname-data.vhdx``` is the file path of your vhdx file
- ```local-zfs``` is the name of the storage pool you want to put the disk image on
- ```--format raw``` specifies the disk image file type you want. If using ZFS to store your disk image use ```raw```. If using EXT4 then use ```qcow2```