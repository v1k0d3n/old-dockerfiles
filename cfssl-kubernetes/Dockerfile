FROM golang:1.9.4-alpine3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

ARG  MASTER_IP="192.168.3.21"
ARG  MASTER_CLUSTER_IP="100.64.30.25"
ARG  CFSSL_INPUT="/usr/local/share/cfssl/input"
ARG  CFSSL_OUTPUT="/usr/local/share/cfssl/output"
ARG  CFSSL_PKI="/pki"
ARG  CFSSL_EXP="8760h"
ARG  CFSSL_CN="admin"
ARG  CFSSL_ALGO="rsa"
ARG  CFSSL_SIZE="2048"
ARG  CFSSL_COUNTRY="US"
ARG  CFSSL_STATE="Colorado"
ARG  CFSSL_CITY="Denver"
ARG  CFSSL_ORG="JinkIT LLC"
ARG  CFSSL_OU="Cloud Team"

ENV  MASTER_IP=$MASTER_IP \
     MASTER_CLUSTER_IP=$MASTER_CLUSTER_IP \
     CFSSL_INPUT=$CFSSL_INPUT \
     CFSSL_OUTPUT=$CFSSL_OUTPUT \
     CFSSL_USER=$CFSSL_USER \
     CFSSL_EXP=$CFSSL_EXP \
     CFSSL_CN=$CFSSL_CN \
     CFSSL_ALGO=$CFSSL_ALGO \
     CFSSL_SIZE=$CFSSL_SIZE \
     CFSSL_COUNTRY=$CFSSL_COUNTRY \
     CFSSL_STATE=$CFSSL_STATE \
     CFSSL_CITY=$CFSSL_CITY \
     CFSSL_ORG=$CFSSL_ORG \
     CFSSL_OU=$CFSSL_OU

RUN  mkdir -p ${CFSSL_INPUT}/ ;\
     mkdir -p ${CFSSL_OUTPUT}/ ;\
     mkdir -p ${CFSSL_PKI}/

# Set .vars from ARGS for potential orchestration use later:
RUN  set | grep MASTER_ > /usr/local/share/cfssl/.vars ;\
     set | grep CFSSL_ >> /usr/local/share/cfssl/.vars 

RUN  apk update ;\
     apk add --no-cache \
       g++ \
       gcc \
       gettext \
       git

RUN  go get -u github.com/cloudflare/cfssl/cmd/...

COPY input ${CFSSL_INPUT}
COPY entrypoint.sh /entrypoint.sh

CMD [ "sh", "/entrypoint.sh"  ]
