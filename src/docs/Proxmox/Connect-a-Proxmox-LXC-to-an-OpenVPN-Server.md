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

### OpenVPN Configuration

```bash
apt update; apt install openvpn
```

Create a client configuration on your VPN server and copy it to your client

```bash
mv *.ovpn /etc/openvpn/client.conf
```

Enable the autostart service within systemd and start the service

```bash
systemctl enable --now openvpn@client.service
```

This will now automatically reconnect on reboot