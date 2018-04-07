FROM golang:1.9.4-alpine3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

RUN  apk update ;\
     apk add --no-cache \
       g++ \
       gcc \
       gettext \
       git

RUN  go get -u github.com/cloudflare/cfssl/cmd/...

COPY example /example
COPY entrypoint.sh /entrypoint.sh

CMD [ "sh", "/entrypoint.sh"  ]
