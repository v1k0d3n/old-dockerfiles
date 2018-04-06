This container is based on the instructions outlined in [Kubernertes Certificate Administration](https://kubernetes.io/docs/concepts/cluster-administration/certificates/).

You can run the container (by default) like:
```
docker run -it -v $(pwd)/pki:/pki cfssl-kubernetes:v0.1.0
```

For any advanced useage, simply override the entrypoint CMD.
