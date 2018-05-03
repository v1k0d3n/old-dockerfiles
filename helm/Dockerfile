FROM alpine

MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

ARG  VERSION_HELM="v2.8.2"

ENV  VERSION_HELM=${VERSION_HELM}

RUN apk add --update ca-certificates \
 && apk add --update -t deps wget \
 && wget http://storage.googleapis.com/kubernetes-helm/helm-${VERSION_HELM}-linux-amd64.tar.gz \
 && tar -xvf helm-${VERSION_HELM}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && rm -f /helm-${VERSION_HELM}-linux-amd64.tar.gz

CMD ["helm", "help"]
