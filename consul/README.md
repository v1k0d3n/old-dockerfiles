# Consul: Service Discovery Container
It must be mentioned that this container is provided in a similar fashion to [Kelsey Hightower's](https://twitter.com/kelseyhightower) [consul container](https://github.com/kelseyhightower/docker-consul). It's been updated to the most recent version (at time of writing 0.5.2), but verify this is the case. If you have issues, please open an issue so I can make the correct changes. It's hard to keep up sometimes!

# Running the Consul Container
To run the container, do the following:

### Run with Web-UI Enabled
```
docker run -d \
-p 8300:8300 -p 8301:8301 \
-p 8302:8302 -p 8400:8400 \
-p 8500:8500 -p 8600:8600/udp \
v1k0d3n/consul:latest \
-bootstrap -client \
0.0.0.0 -server \
-ui-dir /opt/consul/web_ui
```

### Further Documentation
Additional documentation can be found at the [Hashicorp](https://hashicorp.com) Consul [GitHub Repository](https://github.com/hashicorp/consul) and [Website Guides](https://www.consul.io/docs/index.html). I highly recommend Hashicorp Products; they're powerful tools, extremely easy to use and they offer a LOT to the open source community!
