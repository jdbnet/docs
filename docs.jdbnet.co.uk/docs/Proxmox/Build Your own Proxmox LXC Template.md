Start off in the Proxmox web GUI by creating a normal LXC container using one of the existing templates. I chose Debian 12 here.

Start it up and install/customise anything you want. I installed docker on mine since i use this a lot and it saves a step.

Once finished, shutdown the LXC container.

Go to your Proxmox node's shell.

Enter the following command where ```250``` is your container's ID in Proxmox

```bash
pct set 250 --delete net0
```

```bash
vzdump 250 --mode stop --compress gzip --dumpdir /tmp/
```

```bash
cd /tmp
```

Rename the image here

```bash
mv vzdump*.tar.gz my-custom-debian-lxc.tar.gz
```

I have an NFS share that I store my ISOs and templates on so I'm going to move it there

```bash
mv my-custom-debian-lxc.tar.gz /mnt/pve/ISOs/template/cache/
```

If you go to the ISOs volume in the Proxmox GUI and choose CT Templates you should now see your new image

You can then create containers using this image