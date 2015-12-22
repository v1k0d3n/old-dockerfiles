# Meetup: CCOG-001
# Date: 12/09/15
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Consul Docs: http://www.consul.io/docs/index.html
FROM quay.io/v1k0d3n/ubuntu-trusty:latest
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# Update, Upgrade and Install Prerequisites
RUN apt-get --quiet update && \
    apt-get --quiet upgrade -y && \
    apt-get update && apt-get install -y \
      unzip \
      && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download Consul/Web-UI
ADD https://dl.bintray.com/mitchellh/consul/0.6.0_linux_amd64.zip /tmp/consul.zip
ADD https://dl.bintray.com/mitchellh/consul/0.6.0_web_ui.zip /tmp/web_ui.zip

# Add Consul Data Directory
RUN mkdir -p /opt/consul/data

# Install the consul agent and web ui.
RUN unzip /tmp/consul.zip -d /opt/consul/bin/
RUN unzip /tmp/web_ui.zip -d /opt/consul/web_ui/
RUN chmod +x /opt/consul/bin/consul

# Expose the service ports:
# Port Info: https://consul.io/docs/agent/options.html#ports
EXPOSE 8300 8301 8302 8400 8500 8600/udp

# Set the entrypoint to be a simple agent.
ENTRYPOINT ["/opt/consul/bin/consul", "agent", "-data-dir", "/opt/consul/data"]
