**NOTE:** Image [v1k0d3n/bootkube:v0.11.0](https://hub.docker.com/r/v1k0d3n/bootkube/tags/) is signed.

READ: [Bootkube Documentation](https://github.com/kubernetes-incubator/bootkube)

1. Run the container (by default) like:
```
sudo docker run -it \
    -v $(pwd):/home \
    v1k0d3n/bootkube:v0.11.0 \
    bootkube render \
    --asset-dir=/home/.bootkube \
    --api-servers=https://kubernetes.default:8443,https://192.168.4.56:8443 \
    --pod-cidr=10.25.0.0/16 \
    --service-cidr=10.96.0.0/16
```

For any advanced useage, simply override the entrypoint `CMD` and use `bootkube` like normal. You can also copy the bootkube binary from the container to your local Linux host as well.
