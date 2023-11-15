### Installation

```bash
apt install rsync
```

### Configuration

```bash
nano /etc/rsyncd.conf
```

Example Config

```
[Test]
    path = /srv/Test/
    comment = Rsync Test
    read only = false
```

### Enable and Start the Service

```bash
systemctl enable --now rsync
```

### Check the Service

```bash
systemctl status rsync
```

You should see a line showing the daemon running on TCP 873

### Configuration Explaination

- ```[Test]``` is the name of the share. For example when rsyncing to or from this you would use ```rsync 10.0.0.5::Test/```
- ```path``` is the path to where you want the other system to rsync to and from
- ```comment``` is just quite simply a comment
- If ```read only``` is set to true then you can only pull files from the path specified above. When set to false you can read and write to and from it