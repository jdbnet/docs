Apache Guacamole is a free and open-source cross-platform Remote Desktop Gateway maintained by the Apache Software Foundation. It allows a user to take control of a remote computer or virtual machine via a web browser. The server runs on most Linux distributions and the client runs on any modern web browser.

Download file directly from here:

```bash
wget https://raw.githubusercontent.com/MysticRyuujin/guac-install/master/guac-install.sh
```

Make it executable:

```bash
chmod +x guac-install.sh
```

Run it as root:

```bash
sudo ./guac-install.sh
```

Once installation is done you can access Guacamole by browsing to:

http://<Server-IP>:8080/guacamole/

The default credentials are guacadmin as both username and password.