The goal of Fireshare is to provide a very simple and easy way for you to share any videos you have through a unique link. All you have to do is put your videos in a folder and Fireshare will take care of the rest.

### Installation

Start by installing [Docker with Compose](../Install-Docker-with-Compose/)

Create a file called ```docker-compose.yaml```

Paste the following into this file

```yaml
version: "3"
services:
  fireshare:
    container_name: fireshare
    image: shaneisrael/fireshare:latest
    ports:
      - "80:80"
    volumes:
      - /docker/data:/data
      - /docker/videos/processed:/processed
      - /docker/videos/videos:/videos
    environment:
      - ADMIN_USERNAME=user
      - ADMIN_PASSWORD=password
      - SECRET_KEY=replace_this_with_some_random_string
      - MINUTES_BETWEEN_VIDEO_SCANS=5
      - PUID=0
      - PGID=0
```

Save and exit the file

```bash
docker-compose up -d
```