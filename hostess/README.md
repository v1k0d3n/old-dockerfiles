**NOTE:** Image [v1k0d3n/hostess](https://hub.docker.com/r/v1k0d3n/hostess/tags/) should be signed.

[Hostess](https://github.com/cbednarski/hostess) is an awesome little utility for managing an OS-level `/etc/hosts` file in an idempotent way. I use this program quite a bit in my proof of concepts, demos, and in my own home-lab. It's a very useful (and lightweight) utility!

I would recommend taking a look through the documentation. I've used the `CMD` for entrypoint, so you can use the container how you see fit. In particular, check out documentation on how to use a json-based manifest for hosts entries. This can be explored in the [README.md](https://github.com/cbednarski/hostess/blob/4c7ae85191a71782a67db05c4eaaada024705861/README.md#usage).

Just want to copy the binary from the container? Do the following:
```
docker run -i --rm -v $(pwd)/hostess/bin:/tmp quay.io/v1k0d3n/hostess:v0.3.0 sh << HOSTESS
cp /go/bin/hostess /tmp/hostess
HOSTESS
```

For any advanced usage, simply override the entrypoint `CMD` and use `<command>` like normal.
