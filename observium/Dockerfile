# Date: 12/23/15
# Maintainer: Brandon B. Jozsa
# Purpose: Observium Network Monitoring Container
# Documentation: http://www.observium.org
FROM ubuntu:latest
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

RUN apt-get --quiet update && \
    apt-get --quiet upgrade -y && \
    apt-get --quiet install -y libapache2-mod-php5 php5-cli php5-mysql php5-gd php5-snmp php-pear snmp graphviz php5-mcrypt php5-json subversion mysql-server mysql-client rrdtool fping imagemagick whois mtr-tiny nmap ipmitool python-mysqldb wget \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/observium

WORKDIR /opt

RUN wget http://www.observium.org/observium-community-latest.tar.gz && \
    tar zxvf observium-community-latest.tar.gz && \
    rm /opt/observium-community-latest.tar.gz

WORKDIR /opt/observium

RUN cp config.php.default config.php

RUN mkdir logs && \
    mkdir rrd

RUN chown www-data:www-data rrd
