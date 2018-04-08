**NOTE:** Image [v1k0d3n/cni-bin](https://hub.docker.com/r/v1k0d3n/cni-bin/tags/) should be signed.

This container is really only useful for the delivery of CNI binaries/plugins via a container runtime. It can be leveraged in other deployment or integration pipelines/tooling.

```
v1k0d3n at SKYNET in ~GITPATH/github/v1k0d3n/dockerfiles/cni-bin (master●)
$ mkdir -p $(pwd)/cni/bin
docker run -i --rm -v $(pwd)/cni/bin:/tmp v1k0d3n/cni-bin:v0.6.0 sh << CNI
cp -R * /tmp/
CNI

v1k0d3n at SKYNET in ~GITPATH/github/v1k0d3n/dockerfiles/cni-bin (master●)
$ ls -asl $(pwd)/cni/bin
total 50088
   0 drwxr-xr-x 16 v1k0d3n 767211335     544 Apr  8 17:18 .
   0 drwxr-xr-x  3 v1k0d3n 767211335     102 Apr  8 17:17 ..
3800 -rwxr-xr-x  1 v1k0d3n 767211335 3890407 Apr  8 17:18 bridge
2712 -rwxr-xr-x  1 v1k0d3n 767211335 2775211 Apr  8 17:18 cnitool
9692 -rwxr-xr-x  1 v1k0d3n 767211335 9921982 Apr  8 17:18 dhcp
2752 -rwxr-xr-x  1 v1k0d3n 767211335 2814104 Apr  8 17:18 flannel
2924 -rwxr-xr-x  1 v1k0d3n 767211335 2991965 Apr  8 17:18 host-local
3396 -rwxr-xr-x  1 v1k0d3n 767211335 3475802 Apr  8 17:18 ipvlan
2956 -rwxr-xr-x  1 v1k0d3n 767211335 3026388 Apr  8 17:18 loopback
3440 -rwxr-xr-x  1 v1k0d3n 767211335 3520724 Apr  8 17:18 macvlan
2548 -rwxr-xr-x  1 v1k0d3n 767211335 2606733 Apr  8 17:18 noop
3392 -rwxr-xr-x  1 v1k0d3n 767211335 3470464 Apr  8 17:18 portmap
3788 -rwxr-xr-x  1 v1k0d3n 767211335 3877986 Apr  8 17:18 ptp
2548 -rwxr-xr-x  1 v1k0d3n 767211335 2605279 Apr  8 17:18 sample
2744 -rwxr-xr-x  1 v1k0d3n 767211335 2808402 Apr  8 17:18 tuning
3396 -rwxr-xr-x  1 v1k0d3n 767211335 3475750 Apr  8 17:18 vlan
```

For more information about CNI or CNI Plugins, please see the following:<br>
- [CNI](https://github.com/containernetworking/cni)
- [CNI Plugins](https://github.com/containernetworking/cni)

For any advanced usage, simply override the entrypoint `CMD` and use `<command>` like normal.
