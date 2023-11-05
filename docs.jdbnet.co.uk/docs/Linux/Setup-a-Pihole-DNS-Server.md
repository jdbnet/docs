### What is Pi-hole?

Pi-hole is a Linux network-level advertisement and Internet tracker blocking application which acts as a DNS sinkhole and optionally a DHCP server, intended for use on a private network.

### Installation

```bash
apt update; apt install curl -y
```

```bash
curl -sSL https://install.pi-hole.net | bash
```

### Change the Web UI Password

```bash
pihole -a -p
```