### Installation

In your Proxmox server’s shell, run this command to grab Home Assistant and install it

```bash
bash -c "$(wget -qLO - https://raw.githubusercontent.com/tteck/Proxmox/main/vm/haos-vm.sh)"
```

If you choose the advanced setup then you can choose options such as the VM ID, CPU, RAM etc

Once you see successfully installed, you should be able to access Home Assistant at http://<IP-Address>:8123

You can find the IP address of your Home Assistant VM on the Summary page for the VM