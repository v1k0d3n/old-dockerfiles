# Date: 03/14/16
# Maintainer: Brandon B. Jozsa
# Purpose: reveal.js Presentation Software (my new favorite presentation tool)
# Documentation: https://github.com/hakimel/reveal.js/
#
FROM debian:jessie
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# Update, upgrade and limit layers across our host:
RUN apt-get --quiet update && \
    apt-get --quiet upgrade -y

# Run prerequisites:
RUN apt-get update && apt-get install -y \
      pandoc \
      sudo \
      curl \
      git \
      && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add some protections for wetty:
RUN groupadd reveal && \
    useradd reveal -m -g reveal -s /bin/bash  && \
    passwd -d -u reveal
RUN echo "reveal ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/reveal
RUN chmod 0440 /etc/sudoers.d/reveal  && \
    mkdir /home/reveal/presos && \
    chown reveal:reveal /home/reveal/presos

# Download Reveal.js
WORKDIR /home
RUN git clone https://github.com/hakimel/reveal.js.git && \
    git clone https://github.com/krishnasrinivas/wetty

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y \
    nodejs \
    build-essential

# Change to reveal.js
WORKDIR /home/reveal.js

# Install Grunt
RUN npm install -g grunt-cli && \
    npm install

# Change to wetty
WORKDIR /home/wetty
RUN npm install && \
    npm install -g bower && \
    npm install -g yo && \
    npm install -g generator-reveal

# Housecleaning Items
RUN mkdir /home/slides && \
    mv /home/reveal.js/index.html /home/slides/ && \
    ln -s /home/slides/index.html /home/reveal.js/index.html

WORKDIR /home/reveal.js

VOLUME /home/slides

# Add exposed ports
EXPOSE 8000 9000

# Set the entrypoint for the container
ENTRYPOINT ["grunt", "serve"]
