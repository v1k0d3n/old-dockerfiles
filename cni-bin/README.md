**NOTE:** Image [v1k0d3n/cni-bin](https://hub.docker.com/r/v1k0d3n/cni-bin/tags/) should be signed.

This container is really only useful for the delivery of CNI binaries/plugins via a container runtime. It can be leveraged in other deployment or integration pipelines/tooling.

For more information about CNI or CNI Plugins, please see the following:<br>
- [CNI](https://github.com/containernetworking/cni)
- [CNI Plugins](https://github.com/containernetworking/cni)

For any advanced usage, simply override the entrypoint `CMD` and use `<command>` like normal.
