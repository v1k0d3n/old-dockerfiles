# Date: 03/14/16
# Maintainer: Brandon B. Jozsa
# Purpose: reveal.js Presentation Software (my new favorite presentation tool)
# Documentation: https://github.com/hakimel/reveal.js/
# Notes: Taken from danidemi/docker-reveal.js
#        But I wanted to remove 'branding' and change default options
#
FROM debian:jessie
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# Update, Upgrade and Install Prerequisites
RUN apt-get --quiet update && \
    apt-get --quiet upgrade -y && \
    apt-get update && apt-get install -y \
      pandoc \
      curl \
      git \
      && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download Reveal.js
WORKDIR /home
RUN git clone https://github.com/hakimel/reveal.js.git

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y \
    nodejs \
    build-essential

# Change to reveal.js
WORKDIR /home/reveal.js

# Install Grunt
RUN npm install -g grunt-cli && npm install

# Housecleaning Items
RUN mkdir /home/slides && \
    mv /home/reveal.js/index.html /home/slides/ && \
    ln -s /home/slides/index.html /home/reveal.js/index.html

# Add exposed ports
EXPOSE 8000

# Set the entrypoint for the container
ENTRYPOINT ["grunt", "serve"]
