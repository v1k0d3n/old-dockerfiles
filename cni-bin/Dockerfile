FROM alpine:3.7
MAINTAINER Brandon B. Jozsa <bjozsa@jinkit.com>
## SEE CNI: https://github.com/containernetworking/cni 
## SEE CNI PLUGINS: https://github.com/containernetworking/plugins 

ARG ARCH="amd64"
ARG TYPE="linux"
ARG VERSION_CNI="v0.6.0"
ARG VERSION_CNI_PLUGINS="v0.6.0"

ENV ARCH=$ARCH
ENV TYPE=$TYPE
ENV VERSION_CNI=$VERSION_CNI
ENV VERSION_CNI_PLUGINS=$VERSION_CNI_PLUGINS

RUN  apk update ;\
     apk add --no-cache \
     curl ;\
     mkdir -p /usr/local/share/${VERSION_CNI}-${ARCH}-cni/bin/ ;\
     mkdir -p /tmp/${VERSION_CNI}-${ARCH}-cni/

# Set .vars from ARGS for potential orchestration use later:
RUN  set | grep ARCH > /usr/local/share/${VERSION_CNI}-${ARCH}-cni/VERSION ;\
     set | grep TYPE >> /usr/local/share/${VERSION_CNI}-${ARCH}-cni/VERSION ;\
     set | grep VERSION_CNI >> /usr/local/share/${VERSION_CNI}-${ARCH}-cni/VERSION ;\
     set | grep VERSION_CNI_PLUGINS >> /usr/local/share/${VERSION_CNI}-${ARCH}-cni/VERSION

# Download - cni:
RUN  curl -o /tmp/${VERSION_CNI}-${ARCH}-cni/${VERSION_CNI}-${ARCH}-cni.tgz https://github.com/containernetworking/cni/releases/download/${VERSION_CNI}/cni-${ARCH}-${VERSION_CNI}.tgz --location ;\
     curl -o /tmp/${VERSION_CNI_PLUGINS}-${ARCH}-cni/${VERSION_CNI_PLUGINS}-${ARCH}-cni-plugins.tgz https://github.com/containernetworking/plugins/releases/download/${VERSION_CNI_PLUGINS}/cni-plugins-${ARCH}-${VERSION_CNI_PLUGINS}.tgz --location ;\
     tar -zxvf /tmp/${VERSION_CNI}-${ARCH}-cni/${VERSION_CNI}-${ARCH}-cni.tgz -C /usr/local/share/${VERSION_CNI}-${ARCH}-cni/bin/ ;\
     tar -zxvf /tmp/${VERSION_CNI_PLUGINS}-${ARCH}-cni/${VERSION_CNI_PLUGINS}-${ARCH}-cni-plugins.tgz -C /usr/local/share/${VERSION_CNI}-${ARCH}-cni/bin/ ;\
     rm -rf /tmp/${VERSION_CNI}-${ARCH}-cni

ENV  PATH=/usr/local/share/${VERSION_CNI}-${ARCH}-cni/bin:$PATH

WORKDIR /usr/local/share/${VERSION_CNI}-${ARCH}-cni/bin/ 

CMD [ "ls", "-las" ]
