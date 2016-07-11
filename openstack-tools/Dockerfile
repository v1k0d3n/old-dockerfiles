# Meetup: CCOG-008
# Date: 07/10/16
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Opentack CLI Tools / Docs: http://docs.openstack.org/cli-reference/common/cli_install_openstack_command_line_clients.html
# Details:
# Create a ~/.rc directory
# docker run -d -v /path/to/configdir:/maltrail -v /path/to/logdir:/var/log/maltrail -p 8338:8338 quay.io/v1k0d3n/maltrail
FROM alpine:latest
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# Update, Upgrade and Install Prerequisites
RUN apk add --update --no-cache \
      python py-pip git python-dev libffi libffi-dev \
      openssl openssl-dev build-base iputils bash curl linux-headers \
      && rm -rf /var/cache/apk/*

# Install Openstack CLI Tools
RUN pip install python-openstackclient

# Install stack Helper Script. Details: https://github.com/larsks/openstack-tools
RUN curl -sSL https://raw.githubusercontent.com/larsks/openstack-tools/master/stack -o /sbin/stack
RUN chmod 0755 /sbin/stack

# Set the Workdir 
RUN mkdir /openstack-rc

WORKDIR /openstack-rc
