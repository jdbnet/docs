Start by installing [Docker with Compose](../Install-Docker-with-Compose/)

Create a file called ```docker-compose.yaml```

Paste the following into this file

```yaml
version: "3.6"
services:
  Grafana:
    container_name: "Grafana"
    environment:
      - "PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      - "GF_PATHS_CONFIG=/etc/grafana/grafana.ini"
      - "GF_PATHS_DATA=/var/lib/grafana"
      - "GF_PATHS_HOME=/usr/share/grafana"
      - "GF_PATHS_LOGS=/var/log/grafana"
      - "GF_PATHS_PLUGINS=/var/lib/grafana/plugins"
      - "GF_PATHS_PROVISIONING=/etc/grafana/provisioning"
    image: "grafana/grafana-oss:latest"
    network_mode: "bridge"
    ports:
      - "80:3000/tcp"
    restart: "unless-stopped"
    user: "472"
    volumes:
      - "/docker/grafana/lib:/var/lib/grafana"
    working_dir: "/usr/share/grafana"
  Prometheus:
    command:
      - "--config.file=/etc/prometheus/prometheus.yml"
      - "--storage.tsdb.path=/prometheus"
      - "--web.console.libraries=/usr/share/prometheus/console_libraries"
      - "--web.console.templates=/usr/share/prometheus/consoles"
    container_name: "Prometheus"
    image: "prom/prometheus:latest"
    network_mode: "bridge"
    ports:
      - "9090:9090/tcp"
    restart: "unless-stopped"
    user: "nobody"
    volumes:
      - "/docker/prometheus:/etc/prometheus"
    working_dir: "/prometheus"
```

Save and exit the file

```bash
docker-compose up -d
```

Put your servers into ```/docker/prometheus/prometheus.yml``` like this ensuring that they are running prometheus-node-exporter and the systemd service is running

```
  - job_name: node
    static_configs:
      - targets: ['192.168.0.1:9100']
```

For additional servers add another target line

```
      - targets: ['192.168.0.2:9100']
```

Once you have finished your changes to the config file, run the following command

```bash
docker-compose up -d --force-recreate
```