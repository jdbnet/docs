```bash
apt update
apt dist-upgrade
proxmox-backup-manager versions
```

Check the output of the last command shows 2.4-2

```bash
sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list
sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list.d/pve-no-subscription.list
```

The commands above switch you to the new Debian Bookworm repos required for the upgrade

```
apt update
apt dist-upgrade
```

Once the above is done and clear of errors, restart your Proxmox server

You should now be in PBS 3