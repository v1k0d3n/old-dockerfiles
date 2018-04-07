# Meetup: CCOG-001
# Date: 12/09/15
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Consul Docs: http://www.consul.io/docs/index.html
FROM ubuntu:16.04
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

ARG  ARCH="amd64"
ARG  VERSION_CONSUL="0.6.0"

# Update, Upgrade and Install Prerequisites
RUN apt-get --quiet update && \
    apt-get --quiet upgrade -y && \
    apt-get update && apt-get install -y \
      unzip \
      curl \
      && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download Consul/Web-UI
RUN curl -o consul_${VERSION_CONSUL}_linux_${ARCH}.zip https://releases.hashicorp.com/consul/${VERSION_CONSUL}/consul_${VERSION_CONSUL}_linux_${ARCH}.zip ;\
    unzip consul_${VERSION_CONSUL}_linux_${ARCH}.zip -d /usr/local/bin/ ;\
    rm -rf consul_${VERSION_CONSUL}_linux_${ARCH}.zip

# Add Consul Data Directory
RUN mkdir -p /opt/consul/data ;\
    mkdir -p /opt/consul/ui

# Expose the service ports:
# Port Info: https://consul.io/docs/agent/options.html#ports
EXPOSE 8300 8301 8302 8400 8500 8600/udp

# Set the entrypoint to be a simple agent.
ENTRYPOINT ["/usr/local/bin/consul", "agent", "-data-dir", "/opt/consul/data", "-ui-dir=/opt/consul/ui/"]
