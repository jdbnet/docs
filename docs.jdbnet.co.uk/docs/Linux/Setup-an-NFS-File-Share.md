### Install NFS Package

```bash
sudo apt install nfs-kernel-server nfs-common -y
```

### Configure NFS

Edit this file…

```bash
sudo nano /etc/exports
```

Add the following to the end of the file…

```
/mnt/HDD 10.10.10.0/24(rw,sync,no_subtree_check,crossmnt,no_root_squash)
```

Make sure to change the mountpoint and accessible IP range

Restart the NFS Service…

```bash
sudo service nfs-kernel-server restart
```

### Explanation

* ```/mnt/HDD``` is the folder/directory you want to share
* ```10.10.10.0/24``` is the IP range you want this share to be accessible from. Note, you can also share individual IP addresses in the format ```10.10.10.5```
* ```rw``` means the share will have read and write privileges. If you want read only privileges then you would use ```ro```
* ```sync``` means that all changes to the share are immediately flushed to disk
* ```no_subtree_check``` means that you will also gain access to any subfolders within ```/mnt/HDD```

### Mount

To mount this on a Linux system, add this to the file /etc/fstab ensuring that you have the package nfs-common installed

```
ip-of-nfs-server:/mnt/HDD /mountpoint/ nfs rw 0 0
```