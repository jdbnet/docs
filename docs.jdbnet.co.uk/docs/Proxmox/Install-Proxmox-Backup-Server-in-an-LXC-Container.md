Setup a Debian 12 LXC with a minimum of 2 cores and 2GB of RAM.

Once it has booted, proceed with the following instructions...

> Update the system

```bash
apt update
apt dist-upgrade -y
```

> Add the repository key

```bash
wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg
```

> Add the repo to the sources

```bash
echo "deb http://download.proxmox.com/debian/pbs bookworm pbs-no-subscription" >> /etc/apt/sources.list
```

> Update the package cache and install Proxmox Backup Server

```bash
apt update
apt install proxmox-backup-server -y
```

You should then be able to access the web UI on port 8007