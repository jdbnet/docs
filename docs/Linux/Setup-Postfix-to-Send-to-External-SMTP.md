Create an Ubuntu VM or LXC Container if using Proxmox

```bash
apt update
apt upgrade -y
apt install postfix sasl2-bin libsasl2-modules -y
```

Edit the config file ```/etc/postfix/main.cf```

Add in the following, making sure to change the values where needed

```
smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination
myhostname = *domain.tld*
#alias_maps = hash:/etc/aliases
#alias_database = hash:/etc/aliases
mydestination = $mydomain, localhost.$mydomain, localhost
relayhost = *SMTP Server*
mynetworks = 127.0.0.0/8 *Local IP Range*
inet_interfaces = *IP of Postfix server*
inet_protocols = ipv4
recipient_delimiter =

relayhost = *SMTP Server*
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps =  hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous 
smtp_use_tls = yes
```

Create the file ```/etc/postfix/sasl_passwd``` and add in the following

```
smtp.server mail@example.com:plain-text-password
```

Now you should change the access rights so that only the root user can view and edit the file...

```bash
chmod 600 /etc/postfix/sasl_passwd
```

You then need to convert the sasl_passwd file to a database format used by Postfix

```bash
postmap /etc/postfix/sasl_passwd
```

Then restart postfix

```bash
systemctl restart postfix
```