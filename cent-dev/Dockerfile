# Meetup: CCOG-001
# Date: 12/09/15
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Consul Docs: http://www.consul.io/docs/index.html
FROM   centos:7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

ARG   ARCH="amd64"
ARG   VERSION_TERRAFORM="0.6.8"
ARG   VERSION_PACKER="0.8.6"
ARG   VERSION_VAGRANT="1.8.1"

# Update, Upgrade and Install Prerequisites
RUN   yum update -y ;\
      yum install -y \
      unzip \
      tar \
      git \
      ansible \
      python-devel \
      python-netaddr \
      python-openstackclient \
      python-troveclient \
      python-heatclient ;\
      yum clean all ;\
      rm -rf /var/cache/yum

# Download Vagrant: Only used for "vagrant up --provider='n' situations(n=openstack or other remote host)"
# Unfortunately, Hashicorp will require us to manually update our container, because there is no "vagrant.zip"
#   for the "latest" Vagrant packages.
RUN   yum install -y https://releases.hashicorp.com/vagrant/${VERSION_VAGRANT}/vagrant_${VERSION_VAGRANT}_x86_64.rpm ;\
      yum clean all ;\
      rm -rf /var/cache/yum

# Add some working directories
RUN   mkdir -p /home/development
WORKDIR /home/development

# Download other hashicorp tools
RUN curl -O https://releases.hashicorp.com/terraform/${VERSION_TERRAFORM}/terraform_${VERSION_TERRAFORM}_linux_${ARCH}.zip ;\
    curl -O https://releases.hashicorp.com/packer/${VERSION_PACKER}/packer_${VERSION_PACKER}_linux_${ARCH}.zip

# Now move them...so we can use them
RUN   unzip terraform_${VERSION_TERRAFORM}_linux_${ARCH}.zip -d /usr/bin/ ;\
      unzip packer_${VERSION_PACKER}_linux_${ARCH}.zip -d /usr/bin/

# Cleanup
RUN   rm -rf terraform_${VERSION_TERRAFORM}_linux_${ARCH}.zip \
      packer_${VERSION_PACKER}_linux_${ARCH}.zip
