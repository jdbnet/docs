When running services through Haproxy, you'll find by default that every backend connection in log files etc will show up as being your Haproxy IP. To show the client IP in the log, you can add the following.

In your Haproxy config file (usually at ```/etc/haproxy/haproxy.cfg```), in the defaults section you can add the following.

```
option forwardfor
```

Once done, restart your Haproxy instance using ```systemctl restart haproxy``` then test this out.

You should then see the client's IP in your Nginx logs for example if using an Nginx webserver in your backend.
