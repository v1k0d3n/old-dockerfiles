# Date: 12/22/15
# Maintainer: Brandon B. Jozsa
# Purpose: Updated/Upgraded Ubuntu Image (Trusty)
FROM ubuntu:15.04
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# Update and Install Prerequisites
RUN apt-get --quiet update && \
    apt-get --quiet upgrade -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get in, get out
CMD ["/bin/bash"]
