# Meetup: CCOG-002
# Date: 12/24/15
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Maltrail Malware Detection Docs: https://github.com/stamparm/maltrail
# Run the container:
# docker run -d -v /path/to/configdir:/maltrail -v /path/to/logdir:/var/log/maltrail -p 8338:8338 quay.io/v1k0d3n/maltrail
FROM quay.io/v1k0d3n/ubuntu-vivid:latest
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# Update, Upgrade and Install Prerequisites
RUN apt-get --quiet update && \
    apt-get --quiet upgrade -y && \
    apt-get update && apt-get install -y \
      schedtool python-pcapy git \
      && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download Maltrail
RUN git clone https://github.com/stamparm/maltrail.git && \
    mkdir -p /var/log/maltrail/

WORKDIR /maltrail

# Add commands to /maltrail/start.sh
RUN ECHO "/usr/bin/python sensor.py > /var/log/maltrail/sensor.log &" > /maltrail/start.sh
RUN ECHO "/usr/bin/python server.py > /var/log/maltrail/server.log &" >> /maltrail/start.sh

# Add exposed ports
EXPOSE 8338

# Set the entrypoint for the container
ENTRYPOINT [/maltrail/start.sh]
