## Images Available
The following images are available:Image [v1k0d3n/kubernetes-server:v1.9.6](https://hub.docker.com/r/v1k0d3n/kubernetes-server/tags/) is signed.
- **Client:** [v1k0d3n/kubernetes-client](https://hub.docker.com/r/v1k0d3n/kubernetes-client/tags/) (signed)
- **Node:** [v1k0d3n/kubernetes-node](https://hub.docker.com/r/v1k0d3n/kubernetes-node/tags/) (signed)
- **Server:** [v1k0d3n/kubernetes-server](https://hub.docker.com/r/v1k0d3n/kubernetes-server/tags/) (signed)

## Purpose
Use this container to deploy common Kubernetes binaries via a standard container runtime. This image can also be used to start a Kubernetes cluster with the correct mappings. The directory `/opt/kubernetes/bin/` is the `WORKDIR` and is added to `$PATH`.

1. You can run the container (by default) like:
```
docker run -it v1k0d3n/v1k0d3n/kubernetes-server:v1.9.6 <command> version
```

## Details

**Client Binaries Included:** <br>
- kubectl

**Node Binaries Included:** <br>
- kubeadm
- kubectl
- kube-proxy
- kubelet

**Server Binaries Included:** <br>
- apiextensions-apiserver
- cloud-controller-manager
- hyperkube
- kube-aggregator
- kube-apiserver
- kube-controller-manager
- kube-proxy
- kube-scheduler
- kubeadm
- kubectl
- kubelet
- mounter

Look at the Dockerfile for `ENV` settings. All bins are located in `WORKDIR` according to `version`, `arch`, `type` and `mode` (see example below).

```
$ docker run -it v1k0d3n/kubernetes-server:v1.9.6 ls -asl /usr/local/share/v1.9.6-amd64-linux-kubernetes-client/bin 
total 1293528
     4 drwxr-xr-x    1 root     root          4096 Apr  8 18:07 .
     4 drwxr-xr-x    1 root     root          4096 Apr  8 17:55 ..
 54584 -rwxr-xr-x    1 root     root      55890324 Mar 21 15:51 apiextensions-apiserver
115240 -rwxr-xr-x    1 root     root     118004631 Mar 21 15:51 cloud-controller-manager
246696 -rwxr-xr-x    1 root     root     252612736 Mar 21 15:51 hyperkube
 53536 -rwxr-xr-x    1 root     root      54819823 Mar 21 15:51 kube-aggregator
205768 -rwxr-xr-x    1 root     root     210704859 Mar 21 15:51 kube-apiserver
134804 -rwxr-xr-x    1 root     root     138036242 Mar 21 15:51 kube-controller-manager
 62100 -rwxr-xr-x    1 root     root      63586789 Mar 21 15:51 kube-proxy
 60272 -rwxr-xr-x    1 root     root      61715563 Mar 21 15:51 kube-scheduler
148572 -rwxr-xr-x    1 root     root     152136968 Mar 21 15:51 kubeadm
 65976 -rwxr-xr-x    1 root     root      67557285 Mar 21 15:52 kubectl
143856 -rwxr-xr-x    1 root     root     147306352 Mar 21 15:51 kubelet
  2116 -rwxr-xr-x    1 root     root       2165591 Mar 21 15:51 mounter
```

**Origin of Files:** <br>
All of the binaries included in this container are originating from: [https://storage.googleapis.com/kubernetes-release/release/](https://storage.googleapis.com/kubernetes-release/release/).

For any advanced usage, simply override the entrypoint `CMD` and use `<command>` like normal.
