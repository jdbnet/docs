By default Proxmox will allocate 50% of your RAM to ZFS caching. Whilst this is supposed to decrease itself if you start a VM that would eat into that 50% it often doesn't. The reason I wanted to do this was because I was using ZFS on NVME SSDs anyway which are already plenty fast enough without the need for much caching. The instructions below will set your limit to 1GB but if you wanted 4GB then you just need to multiply the number by 4.

```bash
nano /etc/modprobe.d/zfs.conf
```

This line below sets the ZFS cache limit to 1GB. Put this line into the file above

```
options zfs zfs_arc_max=1073741824
```

Then just run the following commands to apply the change

```bash
update-initramfs -u -k all
```

```bash
reboot
```

Following the reboot you should notice your RAM usage is siginificantly lower