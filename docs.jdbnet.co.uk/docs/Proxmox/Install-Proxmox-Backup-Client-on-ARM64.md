This will work for any OS capable of installing ```.deb``` files such as Ubuntu and Debian

### Installation

> Start by grabbing the following files

```bash
wget https://apps.jdbnet.co.uk/pbs-arm64/libqrencode4_4.1.1-1_arm64.deb
wget https://apps.jdbnet.co.uk/pbs-arm64/libssl1.1_1.1.1n-0+deb11u5_arm64.deb
wget https://apps.jdbnet.co.uk/pbs-arm64/proxmox-backup-client_2.4.2-1_arm64.deb
```

> Then, install them

```bash
dpkg -i libqrencode4_4.1.1-1_arm64.deb
dpkg -i libssl1.1_1.1.1n-0+deb11u5_arm64.deb
dpkg -i proxmox-backup-client_2.4.2-1_arm64.deb
```

### Backup Script

> You'll then need a script to backup to your PBS server

> This script will also work on AMD64 systems

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