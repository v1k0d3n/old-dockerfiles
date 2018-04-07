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

ENV LC_ALL=C \
    CINDER_ENDPOINT_TYPE=internalURL \
    NOVA_ENDPOINT_TYPE=internalURL \
    OS_ENDPOINT_TYPE=internalURL \
    OS_USERNAME=admin \
    OS_PASSWORD=password \
    OS_PROJECT_NAME=admin \
    OS_TENANT_NAME=admin \
    OS_AUTH_URL=http://10.1.1.1:5000/v3 \
    OS_NO_CACHE=1 \
    OS_USER_DOMAIN_NAME=Default \
    OS_PROJECT_DOMAIN_NAME=Default \
    OS_IDENTITY_API_VERSION=3 \
    OS_AUTH_VERSION=3

# Update, Upgrade and Install Prerequisites
RUN apk add --update --no-cache \
    python py-pip git python-dev libffi libffi-dev \
    openssl openssl-dev build-base iputils bash curl linux-headers \
    && rm -rf /var/cache/apk/*

# Install Openstack CLI Tools
RUN pip install python-openstackclient

# Install stack Helper Script. Details: https://github.com/larsks/openstack-tools
RUN curl -sSL https://raw.githubusercontent.com/larsks/openstack-tools/master/stack -o /usr/local/bin/stack
RUN chmod +x /usr/local/bin/stack

# Set the Workdir 
RUN mkdir /openstack-rc
WORKDIR /openstack-rc

# Prep Environment
#ENTRYPOINT ["/openstack-rc/openstack.sh"]
