# etcd Docker Image

This Dockerfile builds a custom etcd container image from source code using a multi-stage build process.

## Overview

etcd is a distributed, reliable key-value store for the most critical data of a distributed system. This Docker image compiles etcd from source and packages it in a lightweight Alpine Linux container.

## Build Arguments

The following build arguments can be customized when building the image:

| Argument | Default | Description |
|----------|---------|-------------|
| `BASE` | `alpine:latest` | Base image for the builder stage |
| `VERSION` | `3.6.5` | etcd version to download and compile |
| `TARGETARCH` | (auto-detected) | Target architecture for Go compilation (e.g., amd64, arm64) |

## Building the Image

### Default build:
```bash
docker build -t etcd:latest .
```

### Custom version:
```bash
docker build --build-arg VERSION=3.5.9 -t etcd:3.5.9 .
```

### Custom base image:
```bash
docker build --build-arg BASE=alpine:3.18 -t etcd:alpine-3.18 .
```

## Exposed Ports

| Port | Description |
|------|-------------|
| `2379` | Client communication port |
| `2380` | Peer communication port |

## Available Binaries

The image includes the following etcd binaries:

- **`etcd`** - The main etcd server binary (default entrypoint)
- **`etcdctl`** - Command-line client for etcd
- **`etcdutl`** - Utility for etcd maintenance operations

## Usage Examples

### Single Node etcd Server

```bash
docker run -d \
  --name etcd \
  -p 2379:2379 \
  -p 2380:2380 \
  etcd:latest \
  etcd \
  --name s1 \
  --data-dir /data/etcd \
  --listen-client-urls http://0.0.0.0:2379 \
  --advertise-client-urls http://0.0.0.0:2379 \
  --listen-peer-urls http://0.0.0.0:2380 \
  --initial-advertise-peer-urls http://0.0.0.0:2380 \
  --initial-cluster s1=http://0.0.0.0:2380 \
  --initial-cluster-token tkn \
  --initial-cluster-state new \
  --log-level info \
  --logger zap \
  --log-outputs stderr
```

### Using etcdctl

```bash
# Run etcdctl commands
docker run --rm -it \
  --network container:etcd \
  etcd:latest \
  etcdctl --endpoints=http://localhost:2379 member list

# Set a key-value pair
docker run --rm -it \
  --network container:etcd \
  etcd:latest \
  etcdctl --endpoints=http://localhost:2379 put mykey myvalue

# Get a value
docker run --rm -it \
  --network container:etcd \
  etcd:latest \
  etcdctl --endpoints=http://localhost:2379 get mykey
```

### Using etcdutl

```bash
# Backup etcd data
docker run --rm -it \
  -v etcd-data:/data/etcd \
  -v $(pwd):/backup \
  etcd:latest \
  etcdutl snapshot save /backup/etcd-snapshot.db --data-dir /data/etcd
```

## Environment Variables

This Dockerfile sets the following default environment variables:

| Variable | Default Value | Description |
|----------|---------------|-------------|
| `ETCD_DATA_DIR` | `/data/etcd` | Path to the data directory |
| `ETCD_ENABLE_V2` | `"true"` | Enable etcd v2 API compatibility |
| `ALLOW_NONE_AUTHENTICATION` | `"yes"` | Allow connections without authentication |
| `ETCD_ADVERTISE_CLIENT_URLS` | `"http://etcd:2379"` | URLs to advertise to clients |
| `ETCD_LISTEN_CLIENT_URLS` | `"http://0.0.0.0:2379"` | URLs to listen on for client traffic |


etcd also supports numerous other environment variables for configuration:

### Common etcd Environment Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `ETCD_NAME` | Human-readable name for this member | `node1` |
| `ETCD_DATA_DIR` | Path to the data directory | `/data/etcd` |
| `ETCD_LISTEN_CLIENT_URLS` | List of URLs to listen on for client traffic | `http://0.0.0.0:2379` |
| `ETCD_ADVERTISE_CLIENT_URLS` | List of this member's client URLs to advertise to the public | `http://localhost:2379` |
| `ETCD_LISTEN_PEER_URLS` | List of URLs to listen on for peer traffic | `http://0.0.0.0:2380` |
| `ETCD_INITIAL_ADVERTISE_PEER_URLS` | List of this member's peer URLs to advertise to the rest of the cluster | `http://localhost:2380` |
| `ETCD_INITIAL_CLUSTER` | Initial cluster configuration for bootstrapping | `node1=http://localhost:2380` |
| `ETCD_INITIAL_CLUSTER_STATE` | Initial cluster state | `new` or `existing` |
| `ETCD_INITIAL_CLUSTER_TOKEN` | Initial cluster token for the etcd cluster during bootstrap | `etcd-cluster-1` |

### Using Environment Variables

```bash
# Override default environment variables
docker run -d \
  --name etcd \
  -p 2379:2379 \
  -p 2380:2380 \
  -e ETCD_NAME=node1 \
  -e ETCD_DATA_DIR=/data/etcd \
  -e ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379 \
  -e ETCD_ADVERTISE_CLIENT_URLS=http://localhost:2379 \
  -e ETCD_LISTEN_PEER_URLS=http://0.0.0.0:2380 \
  -e ETCD_INITIAL_ADVERTISE_PEER_URLS=http://localhost:2380 \
  -e ETCD_INITIAL_CLUSTER=node1=http://localhost:2380 \
  -e ETCD_INITIAL_CLUSTER_STATE=new \
  -e ETCD_INITIAL_CLUSTER_TOKEN=etcd-cluster-1 \
  etcd:latest
```

## Data Persistence

To persist etcd data, mount a volume to the data directory:

```bash
docker run -d \
  --name etcd \
  -p 2379:2379 \
  -p 2380:2380 \
  -v etcd-data:/data/etcd \
  etcd:latest \
  etcd --data-dir=/data/etcd [other-options...]
```

## Security Considerations

For production use, consider:

- Using TLS for client and peer communication
- Setting up authentication and authorization
- Running with non-root user
- Configuring proper firewall rules
- Regular backups of etcd data

## Further Reading

- [etcd Official Documentation](https://etcd.io/docs/)
- [etcd Configuration Reference](https://etcd.io/docs/v3.6/op-guide/configuration/)
- [etcd Clustering Guide](https://etcd.io/docs/v3.6/op-guide/clustering/)

## Notes

AI was used to generate this README.md file, was proofread by human eyes. Some bad info may still exist.