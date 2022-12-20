FROM ubuntu:latest
LABEL maintainer="github.com/dstritzel"
ARG S6_ARCH=x86_64 \
    S6_OVERLAY_VERSION=3.1.2.1 \
    TARGETARCH \
    TARGETOS

RUN  apt-get update \
  && apt-get install -y \
     xz-utils \
     curl \
  && rm -rf /var/lib/apt/lists/*
ADD build.sh /tmp/build.sh
RUN echo "*** Run Build Script***" && \
    chmod +x /tmp/build.sh && \
    /tmp/build.sh

ENTRYPOINT ["/init"]