## Platforms

* x86_64/amd64 **(Tested on Ubuntu 20.04 LTS - Docker 20.10.21)**
* arm64/aarch64 **(Tested on Apple Silicon M1 Docker Desktop)**

Testing will be conducted on Mac OS X and Ubuntu 22.04 LTS and Raspberry Pi 4 docker instances.
RPi4 is a 64-bit ARMv8 CPU and arm64 should be supported. I have not tested this yet.

## Ubuntu Core

Base ubuntu-core with custonizations for building and running containers. Ideally this will track the latest LTS release of Ubuntu docker upstream, but for I will manually update this as needed.