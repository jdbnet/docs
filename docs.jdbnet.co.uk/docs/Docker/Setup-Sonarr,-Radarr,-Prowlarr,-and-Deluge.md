Start by installing [Docker with Compose](../Install-Docker-with-Compose/)

Mount your NAS at ```/srv``` to store your media

Create a file called ```docker-compose.yaml```

Paste the following into this file

```yaml
version: "3.6"
services:
  Deluge:
    container_name: "Deluge"
    environment:
      - "PUID=0"
      - "PGID=0"
      - "TZ=Europe/London"
    image: "lscr.io/linuxserver/deluge:latest"
    network_mode: "bridge"
    ports:
      - "6881:6881/tcp"
      - "6881:6881/udp"
      - "8112:8112/tcp"
    restart: "unless-stopped"
    volumes:
      - "/tmp/downloads:/downloads"
      - "/docker/deluge:/config"
  Radarr:
    container_name: "Radarr"
    environment:
      - "PUID=0"
      - "PGID=0"
      - "TZ=Europe/London"
    image: "linuxserver/radarr:latest"
    ports:
      - "7878:7878/tcp"
    restart: "unless-stopped"
    volumes:
      - "/docker/radarr:/config"
      - "/tmp/downloads:/downloads"
      - "/srv/Movies:/movies"
  Sonarr:
    container_name: "Sonarr"
    environment:
      - "PUID=0"
      - "PGID=0"
      - "TZ=Europe/London"
    image: "lscr.io/linuxserver/sonarr:latest"
    network_mode: "bridge"
    ports:
      - "8989:8989/tcp"
    restart: "unless-stopped"
    volumes:
      - "/tmp/downloads:/downloads"
      - "/srv/TV Shows:/tvshows"
      - "/docker/sonarr:/config"
  Prowlarr:
    container_name: "Prowlarr"
    environment:
      - "PUID=0"
      - "PGID=0"
      - "TZ=Europe/London"
    image: "lscr.io/linuxserver/prowlarr:nightly"
    network_mode: "bridge"
    ports:
      - "9696:9696/tcp"
    restart: "unless-stopped"
    volumes:
      - "/srv/:/media"
      - "/docker/prowlarr:/config"
  Updater:
    container_name: "Updater"
    image: "containrrr/watchtower:latest"
    network_mode: "bridge"
    restart: "unless-stopped"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
```

Save and exit the file

```bash
docker-compose up -d
```

### Web UI Ports

|**Application**|**Port**|**Description**|
|---|---|---|
|Sonarr|8989|Sonarr is a TV collection manager|
|Radarr|7878|Radarr is a movie collection manager|
|Deluge|8112|Deluge is a BitTorrent client|
|Prowlarr|9696|Prowlarr is an indexer manager/proxy that manages torrent trackers and usenet indexers|