# Meetup: CCOG-002
# Date: 12/24/15
# Presenter: Brandon B. Jozsa
# Purpose: Dockerfile Example
# Maltrail Malware Detection Docs: https://github.com/stamparm/maltrail
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

# Run the Sensor
RUN python sensor.py > /var/log/maltrail/sensor.log &

# Run the Server (Port 8338)
RUN python server.py > /var/log/maltrail/server.log &
