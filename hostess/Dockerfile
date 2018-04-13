FROM golang:1.9.4-alpine3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

ARG  VERSION_CFSSL=v0.3.0

ENV  VERSION_CFSSL=$VERSION_CFSSL

RUN  apk update ;\
     apk add --no-cache \
       bash \
       g++ \
       gcc \
       gettext \
       git

RUN  go get -u github.com/cbednarski/hostess/cmd/...

CMD [ "hostess", "--help"  ]
