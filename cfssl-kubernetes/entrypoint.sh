#/bin/bash
# Source user-defined variables:
#source /example/example.vars
source /usr/local/share/cfssl/.vars

# Generate json files with user-defined variables:
(envsubst < ${CFSSL_INPUT}/ca-config.json.in) > ${CFSSL_OUTPUT}/ca-config.json
(envsubst < ${CFSSL_INPUT}/ca-csr.json.in) > ${CFSSL_OUTPUT}/ca-csr.json
(envsubst < ${CFSSL_INPUT}/user-csr.json.in) > ${CFSSL_OUTPUT}/${CFSSL_CN}-csr.json
(envsubst < ${CFSSL_INPUT}/kube-proxy-csr.json.in) > ${CFSSL_OUTPUT}/kube-proxy-csr.json
(envsubst < ${CFSSL_INPUT}/kubernetes-csr.json.in) > ${CFSSL_OUTPUT}/kubernetes-csr.json

# Generate cert artifacts:
cd ${CFSSL_OUTPUT}
printf "\nGenerating CA certificate and signing key: "
/go/bin/cfssl gencert \
    -initca ca-csr.json | /go/bin/cfssljson -bare ca

# Certificate and signing key for user(s):
printf "\nGenerating ${CFSSL_CN} certificate and signing key: "
/go/bin/cfssl gencert \
    -ca=ca.pem \
    -ca-key=ca-key.pem \
    --config=ca-config.json \
    -profile=kubernetes \
    ${CFSSL_CN}-csr.json | /go/bin/cfssljson -bare ${CFSSL_CN}

# Certificate and signing key for kube-proxy:
printf "\nGenerating Kubelet certificate and signing key: "
/go/bin/cfssl gencert \
    -ca=ca.pem \
    -ca-key=ca-key.pem \
    --config=ca-config.json \
    -profile=kubernetes \
    kube-proxy-csr.json | /go/bin/cfssljson -bare kube-proxy

# We want to present our hostlists a couple different ways.
# First, generate an array of user-provided nodes:
declare -a nodes
readarray CFSSL_HOST < ${CFSSL_INPUT}/nodes

let i=0
while (( ${#CFSSL_HOST[@]} > i )); do
    export CFSSL_HOSTARRAY="    ${CFSSL_HOST[i++]}"
    printf "${CFSSL_HOSTARRAY}"
done

# Now read this without any special characters:
while read line; do
    echo "$line" | tr -d ',' | tr -d '"'
done < ${CFSSL_INPUT}/nodes

# Certificate and signing key for the Kubernetes-API:
printf "\nGenerating Kubernetes API certificate and signing key: "
/go/bin/cfssl gencert \
    -ca=ca.pem \
    -ca-key=ca-key.pem \
    --config=ca-config.json \
    -profile=kubernetes \
    -hostname=127.0.0.1,${MASTER_IP},${MASTER_CLUSTER_IP},kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.default.svc.cluster.local,"${CFSSL_HOSTARRAY}" \
    kubernetes-csr.json | /go/bin/cfssljson -bare kubernetes

# Now move generated cert artifacts to the pki folder:
mv *.pem ${CFSSL_PKI}/
mv *.csr ${CFSSL_PKI}/
mkdir -p ${CFSSL_PKI}/input/
cp -R ${CFSSL_OUTPUT}/* ${CFSSL_PKI}/input/
