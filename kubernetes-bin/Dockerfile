FROM alpine:3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>

# NOTES FOR ARGS:
## ARCH: "amd64", "arm64", "arm" (most common)
## TYPE: "linux", "darwin" (most common)
## MODE: "client", "node", "server" (all common)
## SEE: https://kubernetes.io/docs/imported/release/notes/#downloads-for-v1100

ARG ARCH="amd64"
ARG TYPE="linux"
ARG MODE="client"
ARG VERSION_KUBERNETES="v1.9.6"

ENV ARCH=$ARCH
ENV TYPE=$TYPE
ENV MODE=$MODE
ENV VERSION_KUBERNETES=$VERSION_KUBERNETES

RUN  apk update ;\
     apk add --no-cache \
     curl ;\
     mkdir -p /opt/kubernetes/bin/ ;\
     mkdir -p /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}/kube/

# Set .vars from ARGS for potential orchestration use later:
RUN  set | grep ARCH > /opt/kubernetes/VERSION ;\
     set | grep TYPE >> /opt/kubernetes/VERSION ;\
     set | grep MODE >> /opt/kubernetes/VERSION ;\
     set | grep VERSION_KUBERNETES >> /opt/kubernetes/VERSION

# Single line may help when rebuilding locally:
RUN  curl -L https://storage.googleapis.com/kubernetes-release/release/${VERSION_KUBERNETES}/kubernetes-${MODE}-${TYPE}-${ARCH}.tar.gz -o /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}.tgz

RUN  cd /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}/ ;\
     tar --strip-components=1 -zxvf ${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}.tgz ;\
     mv /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}/${MODE}/bin/* /opt/kubernetes/bin/ ;\
     rm -rf /opt/kubernetes/bin/*.docker_tag \
       /opt/kubernetes/bin/*.tar \
       /tmp/${VERSION_KUBERNETES}-${ARCH}-${TYPE}-kubernetes-${MODE}

ENV  PATH=/opt/kubernetes/bin:$PATH

WORKDIR  /opt/kubernetes/bin/

CMD [ "kubectl", "version" ]
