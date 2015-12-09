# Meetup: CLT-K8S-001
# Date: 15/12/09
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Consul Docs: http://www.consul.io/docs/index.html
FROM ubuntu:14.04

# Update and Install Prerequisites
RUN apt-get update && apt-get install -y \
	unzip

# Download Consul/Web-UI
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip /tmp/web_ui.zip

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
