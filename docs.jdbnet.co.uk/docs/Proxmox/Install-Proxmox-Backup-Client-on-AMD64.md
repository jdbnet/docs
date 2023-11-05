This will work for any OS capable of installing ```.deb``` files such as Ubuntu and Debian

### Installation

Start by getting the GPG key

```bash
wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg
```

Then add the APT repository to your system

```bash
echo "deb http://download.proxmox.com/debian/pbs-client buster main" >> /etc/apt/sources.list.d/pbs-client.list
```

Then update your APT cache

```bash
apt update
```

> You may need to install libssl1.1 manually before the next command will work correctly.

[Download libssl1.1](https://apps.jdbnet.co.uk/pbs-amd64/libssl1.1.deb)

Finally install Proxmox Backup Client

```bash
apt install proxmox-backup-client
```

### Backup Script

> You'll then need a script to backup to your PBS server

```bash
#!/bin/bash

export PBS_PASSWORD=''
export PBS_USER_STRING=''
export PBS_SERVER=''
export PBS_DATASTORE=''
export PBS_REPOSITORY="${PBS_USER_STRING}@${PBS_SERVER}:${PBS_DATASTORE}"
export PBS_HOSTNAME="$(hostname -s)"
echo "Running Backup for $PBS_HOSTNAME ..."
proxmox-backup-client backup root.pxar:/
echo "Done."
```

#### Explanation

* ```PBS_PASSWORD``` is the PBS API Key that you generate in PBS to authenticate with the server
* ```PBS_USER_STRING``` is the PBS API User. This is again generated in PBS and looks similar to this ```root@pam!Server```
* ```PBS_SERVER``` is the IP address or DNS name of the PBS server
* ```PBS_DATASTORE``` is your datastore name in PBS
* ```PBS_HOSTNAME``` is your clients hostname. This can be left alone as it just takes the hostname from your system and passes it in
* The ```/``` on the end of ```proxmox-backup-client backup root.pxar:/``` defines the directory to backup. For example if you wanted to backup just /srv then you would change this to ```proxmox-backup-client backup root.pxar:/srv/```