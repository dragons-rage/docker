#!/bin/bash

if [ "${TARGETARCH}" == "arm64" ]; then S6_ARCH="aarch64"; fi

echo "Downloading files"
cd /tmp

curl -O -J https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
curl -O -J https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${S6_ARCH}.tar.xz /tmp
curl -O -J https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-symlinks-arch.tar.xz /tmp

echo "*** Building ${TARGETOS} with ${TARGETARCH} with ${S6_ARCH} ***"
tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
tar -C / -Jxpf /tmp/s6-overlay-symlinks-arch.tar.xz
tar -C / -Jxpf /tmp/s6-overlay-${S6_ARCH}.tar.xz
rm -rf /tmp/*