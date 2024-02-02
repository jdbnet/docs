This script will remove the message that pops up on logon that says you have no subscription

This script works on both Proxmox VE and Proxmox Backup Server

### Installation

```bash
echo "DPkg::Post-Invoke { \"dpkg -V proxmox-widget-toolkit | grep -q '/proxmoxlib\.js$'; if [ \$? -eq 1 ]; then { echo 'Removing subscription nag from UI...'; sed -i '/data\.status.*{/{s/\!//;s/active/NoMoreNagging/}' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js; }; fi\"; };" >/etc/apt/apt.conf.d/no-nag-script

apt --reinstall install proxmox-widget-toolkit &>/dev/null
```

> Note: you will need to run this after every major update as proxmox-widget-toolkit will be updated so your changes will be overwritten