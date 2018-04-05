FROM golang:1.9.4-alpine3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

RUN  apk update ;\
     apk add \
       g++ \
       gcc \
       git

RUN  go get -u github.com/cloudflare/cfssl/cmd/...

CMD ["cfssl", "--help"]
