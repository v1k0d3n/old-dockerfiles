FROM alpine:3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

ARG ARCH="amd64"
ARG TYPE="linux"
ARG MODE="server"
ARG VERSION_KUBERNETES="v1.9.6"

RUN  apk update ;\
     apk add --no-cache \
     curl 

RUN  mkdir -p /opt/kubernetes/bin/ ;\
     mkdir -p /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}/

RUN  curl -L https://storage.googleapis.com/kubernetes-release/release/${VERSION_KUBERNETES}/kubernetes-${MODE}-${TYPE}-${ARCH}.tar.gz -o /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}.tgz ;\
     cd /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}/ ;\
     tar --strip-components=1 -zxvf ${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}.tgz ;\
     mv /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}/server/bin/* /opt/kubernetes/bin/ ;\
     rm -rf /opt/kubernetes/bin/*.docker_tag ;\
     rm -rf /opt/kubernetes/bin/*.tar ;\
     ls -asl /opt/kubernetes/bin/

RUN  export PATH=/opt/kubernetes/bin:$PATH

WORKDIR  /opt/kubernetes/bin/
 
CMD [ "/opt/kubernetes/bin/kubectl", "version" ]
