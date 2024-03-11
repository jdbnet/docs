### LXC Config

Create your LXC Container using the Debian Template in Proxmox

Once created, don't start it just yet

Go into your Proxmox servers shell

Edit the LXC config file at /etc/pve/lxc/VMID.conf

Add in the following…

```
lxc.cgroup2.devices.allow: c 10:200 rwm
lxc.mount.entry: /dev/net dev/net none bind,create=dir
```

Change Permissions with this command…

```bash
chown 100000:100000 /dev/net/tun
```

Start your LXC container

Run the rest of the commands on this page inside the LXC container

### OpenVPN Server Installation

```bash
wget https://docs.jdbnet.co.uk/scripts/openvpn-install.sh
chmod +x openvpn-install.sh
sudo ./openvpn-install.sh
```

Port forward the IP address of your LXC container and whichever port you chose for the VPN (default: 1194)