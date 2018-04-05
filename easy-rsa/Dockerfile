FROM alpine:3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

ARG  VERSION_EASYRSA="3.0.3-r0"

RUN  apk update ;\
     apk add easy-rsa=${VERSION_EASYRSA}

WORKDIR /home 

CMD  [ "/usr/share/easy-rsa/easyrsa", "--help" ]
