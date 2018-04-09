#!/bin/sh
# Source user-defined variables:
#source /example/example.vars
source /usr/local/share/cfssl/.vars

# Generate json files with user-defined variables:
(envsubst < ${CFSSL_INPUT}/ca-config.json.in) > ${CFSSL_OUTPUT}/ca-config.json
(envsubst < ${CFSSL_INPUT}/ca-csr.json.in) > ${CFSSL_OUTPUT}/ca-csr.json
(envsubst < ${CFSSL_INPUT}/kubernetes-csr.json.in) > ${CFSSL_OUTPUT}/${CFSSL_CN}-csr.json

# Generate cert artifacts:
cd ${CFSSL_OUTPUT}
/go/bin/cfssl gencert -initca ca-csr.json | /go/bin/cfssljson -bare ca
/go/bin/cfssl gencert -ca=ca.pem -ca-key=ca-key.pem \
    --config=ca-config.json -profile=kubernetes \
    ${CFSSL_CN}-csr.json | /go/bin/cfssljson -bare ${CFSSL_CN} 

# Now move generated cert artifacts to the pki folder:
mv *.pem ${CFSSL_PKI}/
mv *.csr ${CFSSL_PKI}/
mkdir ${CFSSL_PKI}/input/
cp -R ${CFSSL_OUTPUT}/* ${CFSSL_PKI}/input/
