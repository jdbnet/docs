Start by installing [Docker with Compose](../Install-Docker-with-Compose/)

Create a file called ```docker-compose.yaml```

Paste the following into this file

```yaml
version: "3.6"
services:
  Nginx:
    container_name: "Nginx"
    image: "lscr.io/linuxserver/nginx:latest"
    ports:
      - "80:80/tcp"
      - "443:443/tcp"
    restart: "unless-stopped"
    volumes:
      - "/docker/nginx:/config"
```

Save and exit the file

```bash
docker-compose up -d
```

Drop your webserver files into ```/docker/nginx/www/``` on the host. They will be immediately updated when you refresh the page in your browser