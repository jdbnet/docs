```bash
apt update
apt install docker.io -y
```

```
docker run -d -p 9000:9000 --name Portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

The Portainer web UI will be accessible at port 9000