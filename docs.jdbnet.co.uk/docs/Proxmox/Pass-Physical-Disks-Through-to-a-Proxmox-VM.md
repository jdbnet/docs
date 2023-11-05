You may wish to pass through physical disks into a TrueNAS VM for example to then setup your ZFS filesystem in the VM. Here is how you do this.

Start by creating your VM with either no disks or in my case I wanted a small virtual disk to boot from so I created that.

Make sure your drives that you want to pass through aren't being used by the host.

Lets assume your VM that you just created has an ID of ```100``` but you can change this in the commands below to suit.

Start by finding the device IDs of your disk(s) with this command...

```bash
ls -l /dev/disk/by-id/
```

This will show all disks in the system. If you are passing through hard drives, then you should look for entries starting with ```ata```

On my system, this is one of the disks I want to pass through...

```bash
root@Proxmox:~# ls -l /dev/disk/by-id/
total 0
lrwxrwxrwx 1 root root  9 Sep 17 09:45 ata-ST4000LM024 -> ../../sdb
```

```ata-ST4000LM024``` is your device ID for that hard disk. Copy this for now.

To attach it to your VM, use this command making sure to change the VM ID where necessary and the hard drive ID...

> Note if you are already using scsi0 for your boot disk then you can just increment this by 1. The same applies if you are using multiple disks. For each disk you want to pass through increment this number by 1.

```bash
qm set 100 -scsi0 /dev/disk/by-id/ata-ST4000LM024
```

In the Proxmox GUI, if you now view the hardware tab for your VM you should see the disk added.

That's all you need to do. Start your VM, and start using your passed through disk(s).