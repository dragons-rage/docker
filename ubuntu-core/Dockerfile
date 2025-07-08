# VIRTVERSION 2
FROM ubuntu:24.04 AS ubuntu-build
LABEL maintainer="github.com/dstritzel"
ARG S6_ARCH=x86_64 \
    S6_OVERLAY_VERSION=3.2.1.0 \
    TARGETARCH \
    TARGETOS

COPY build.sh /tmp/build.sh

RUN apt-get update && \
    apt-get install -y xz-utils curl && \
    rm -rf /var/lib/apt/lists/*

RUN echo "*** Run Build Script***" && \
    chmod a+x /tmp/build.sh && \
    /tmp/build.sh

# FROM ubuntu-build
ENTRYPOINT ["/init"]
