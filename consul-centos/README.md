[![Docker Repository on Quay](https://quay.io/repository/v1k0d3n/consul/status "Docker Repository on Quay")](https://quay.io/repository/v1k0d3n/consul-centos)

# Consul: Service Discovery Container
Consul provided via a CentOS 7.x based image. It's been updated to the most recent version of Consul (0.6.0) and CentOS (7.2), but verify this is the case. If you have issues, please open an issue so I can make the correct changes. It's hard to keep up sometimes!

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
