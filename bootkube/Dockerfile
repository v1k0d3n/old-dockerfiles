FROM alpine:3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

ARG  VERSION_BOOTKUBE="v0.11.0"

RUN  apk update ;\
     apk add --no-cache \
       wget

RUN  wget -O ${VERSION_BOOTKUBE}-bootkube.tar.gz https://github.com/kubernetes-incubator/bootkube/releases/download/${VERSION_BOOTKUBE}/bootkube.tar.gz ;\
     tar zxvf v0.11.0-bootkube.tar.gz ;\
     mv bin/linux/* /usr/local/bin/ ;\
     rm -rf bin/linux/ ${VERSION_BOOTKUBE}-bootkube.tar.gz

CMD [ "bootkube", "--help"  ]
