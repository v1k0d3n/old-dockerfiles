**NOTE:** Image [v1k0d3n/cfssl-kubernetes:v0.1.0](https://hub.docker.com/r/v1k0d3n/cfssl-kubernetes/tags/) is signed.

This container is based on the instructions outlined in [Kubernertes Certificate Administration](https://kubernetes.io/docs/concepts/cluster-administration/certificates/).

1. Edit the `example.vars` file in the `./example` directory to match your environment.

2. Then you can run the container (by default) like:
```
docker run -it -v $(pwd)/pki:/pki v1k0d3n/cfssl-kubernetes:v0.1.0
```

For any advanced usage, simply override the entrypoint `CMD` and use `cfssl` like normal.
