# Meetup: CCOG-001
# Date: 12/09/15
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Consul Docs: http://www.consul.io/docs/index.html
FROM fedora:latest
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# Update, Upgrade and Install Prerequisites
RUN dnf update -y \
    && dnf install -y unzip tar git ansible python-devel python-netaddr python-openstackclient python-troveclient python-heatclient

# Download Vagrant: Only used for "vagrant up --provider='n' situations(n=openstack or other remote host)"
# Unfortunately, Hashicorp will require us to manually update our container, because there is no "vagrant.zip"
#   for the "latest" Vagrant packages.
RUN dnf install -y https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm && yum clean all

# Add some working directories
RUN mkdir -p /home/development
WORKDIR /home/development

# Download other hashicorp tools
RUN curl -O https://releases.hashicorp.com/terraform/0.6.8/terraform_0.6.8_linux_amd64.zip && \
    curl -O https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip

# Now move them...so we can use them
RUN unzip terraform_0.6.8_linux_amd64.zip -d /usr/bin/ && unzip packer_0.8.6_linux_amd64.zip -d /usr/bin/

# Cleanup
RUN rm -rf packer_0.8.6_linux_amd64.zip terraform_0.6.8_linux_amd64.zip
