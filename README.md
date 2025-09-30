# docker

Dockerfiles that are for minor services I need. With certain companies moving to "secure images"
it is nessecary to completely remove them from any workflow. This is just a bid for money while
using community sourced software.


## Building

You can build from the github repo sub directories by specifing the branch and directory

Example:

```bash
docker build -t etcd https://github.com/dstritzel/docker.git\#main:cloud/etcd/
podman build -t etcd https://github.com/dstritzel/docker.git\#main:cloud/etcd/
```