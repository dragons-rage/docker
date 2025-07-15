#!/bin/sh -x

S6_ARCH=x86_64
S6_OVERLAY_VERSION=latest

if [ "${TARGETARCH}" == "arm64" ]; then
  S6_ARCH="aarch64"
fi

apk update && apk upgrade
apk add --no-cache bash tar gzip xz curl wget

echo "Downloading files for $S6_ARCH ${S6_OVERLAY_VERSION}"
cd /tmp
curl -O -L https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz
curl -O -L https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-${S6_ARCH}.tar.xz
curl -O -L https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-symlinks-arch.tar.xz
echo "*** Building ${TARGETOS} with ${TARGETARCH} with ${S6_ARCH} ***"
tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
tar -C / -Jxpf /tmp/s6-overlay-symlinks-arch.tar.xz
tar -C / -Jxpf /tmp/s6-overlay-${S6_ARCH}.tar.xz
rm -rf /tmp/*
