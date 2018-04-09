#!/bin/sh
# Source user-defined variables:
#source /example/example.vars
source /usr/local/share/cfssl/.vars

# Generate json files with user-defined variables:
(envsubst < ${CFSSL_INPUT}/ca-config.json.in) > ${CFSSL_OUTPUT}/ca-config.json
(envsubst < ${CFSSL_INPUT}/ca-csr.json.in) > ${CFSSL_OUTPUT}/ca-csr.json
(envsubst < ${CFSSL_INPUT}/user-csr.json.in) > ${CFSSL_OUTPUT}/${CFSSL_CN}-csr.json
(envsubst < ${CFSSL_INPUT}/kube-proxy.json.in) > ${CFSSL_OUTPUT}/kube-proxy-csr.json

# Generate cert artifacts:
cd ${CFSSL_OUTPUT}
printf "\nGenerating CA certificate and signing key: "
/go/bin/cfssl gencert -initca ca-csr.json | /go/bin/cfssljson -bare ca

printf "\nGenerating ${CFSSL_CN} certificate and signing key: "
/go/bin/cfssl gencert -ca=ca.pem -ca-key=ca-key.pem \
    --config=ca-config.json -profile=kubernetes \
    ${CFSSL_CN}-csr.json | /go/bin/cfssljson -bare ${CFSSL_CN} 

printf "\nGenerating Kubelet certificate and signing key: "
/go/bin/cfssl gencert -ca=ca.pem -ca-key=ca-key.pem \
    --config=ca-config.json -profile=kubernetes \
    kube-proxy-csr.json | /go/bin/cfssljson -bare kube-proxy

# Now move generated cert artifacts to the pki folder:
mv *.pem ${CFSSL_PKI}/
mv *.csr ${CFSSL_PKI}/
mkdir ${CFSSL_PKI}/input/
cp -R ${CFSSL_OUTPUT}/* ${CFSSL_PKI}/input/
