Start by installing [Docker with Compose](../Install-Docker-with-Compose/)

Create a file called ```docker-compose.yaml```

Paste the following into this file

```yaml
version: "3.6"
services:
  Bitwarden:
    container_name: "Bitwarden"
    environment:
      - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      - "LC_ALL=C.UTF-8"
      - "DEBIAN_FRONTEND=noninteractive"
      - "UDEV=off"
      - "ROCKET_PROFILE=release"
      - "ROCKET_ADDRESS=0.0.0.0"
      - "ROCKET_PORT=80"
    image: "vaultwarden/server:latest"
    network_mode: "bridge"
    ports:
      - "80:80/tcp"
    restart: "unless-stopped"
    volumes:
      - "/docker/bitwarden:/data"
```

Save and exit the file

```bash
docker-compose up -d
```

Bitwarden will now be accessible by entering the IP of the server on http.

Please note, Bitwarden requires an SSL certificate on HTTPS. You could use LetsEncrypt or Cloudflare etc.