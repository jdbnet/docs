### Install Samba Package

```bash
sudo apt install samba -y
```

### Configure a Public Samba Share (Option 1)

If you use this option, anybody on your LAN can read and write to the share

Edit this file…

```bash
sudo nano /etc/samba/smb.conf
```

```
[Share]
 path = /mnt/HDD
 read only = no
 public = yes
 force user = root
```

### Configure a Samba Share with Authentication (Option 2)

If you use this option, you will need to create users using the section below

Edit this file…

```bash
sudo nano /etc/samba/smb.conf
```

```
[Share]
 path = /mnt/HDD
 valid users = jamie
 read only = no
```

### Create Users

To create users for the Samba share, follow these instructions. Replace ```user``` with the username you want to use

```bash
sudo smbpasswd -a *user*
```

Restart the Samba Service

```bash
sudo service smbd restart
```