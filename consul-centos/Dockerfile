# Meetup: CCOG-001
# Date: 12/09/15
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Consul Docs: http://www.consul.io/docs/index.html
FROM centos:latest
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# Update, Upgrade and Install Prerequisites
RUN yum update -y && \
    yum install -y \
      unzip \
      && \
    yum remove \
      bind && \
    yum clean all

# Download Consul/Web-UI
ADD https://releases.hashicorp.com/consul/0.6.0/consul_0.6.0_linux_amd64.zip /tmp/consul.zip
ADD https://releases.hashicorp.com/consul/0.6.0/consul_0.6.0_web_ui.zip /tmp/web_ui.zip

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
