Update the existing system first

```bash
apt update
apt dist-upgrade
```

Swap Bullseye (11) for Bookworm (12) in the repositories

```bash
sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list
```

Start the upgrade

```bash
apt update
apt dist-upgrade
```

If all went ok, restart the system

You should then be in Debian 12 Bookworm