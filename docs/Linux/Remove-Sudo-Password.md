If you find yourself running commands with sudo often, you can remove the password prompt for a certain user.

Please note this is a security risk.

Start by running this command to enter the sudoers file…

```bash
sudo visudo
```

At the bottom of the file paste this in making sure to amend username to your username…

```
username ALL=(ALL) NOPASSWD: ALL
```

Do CTRL + X then Y then Enter to save the changes and exit the file.

Done. You should never be asked for your password when running a command with sudo.