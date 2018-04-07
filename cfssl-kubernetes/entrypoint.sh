#!/bin/sh
# Source user-defined variables:
source /example/example.vars

# Generate json files with user-defined variables:
(envsubst < /example/ca-config.json.in) > /example/ca-config.json
(envsubst < /example/ca-csr.json.in) > /example/ca-csr.json
(envsubst < /example/kubernetes-csr.json.in) > /example/kubernetes-csr.json

# Generate cert artifacts:
cd /example
/go/bin/cfssl gencert -initca ca-csr.json | /go/bin/cfssljson -bare ca
/go/bin/cfssl gencert -ca=ca.pem -ca-key=ca-key.pem \
    --config=ca-config.json -profile=kubernetes \
    kubernetes-csr.json | /go/bin//cfssljson -bare server

# Now move generated cert artifacts to the pki folder:
mv *.pem /pki/
mv *.csr /pki/
