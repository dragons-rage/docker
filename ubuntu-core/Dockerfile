FROM ubuntu:latest
LABEL maintainer="github.com/dstritzel"
ARG ARCH=x86_64 \
    S6_OVERLAY_VERSION=3.1.2.1

ARG TARGETOS TARGETARCH

RUN  apt-get update \
  && apt-get install -y \
     xz-utils \
  && rm -rf /var/lib/apt/lists/*

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${TARGETARCH}.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-symlinks-arch.tar.xz /tmp

RUN echo "*** Building ${TARGETOS} with ${TARGETARCH} ***" && \
    tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-symlinks-arch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-${TARGETARCH}.tar.xz && \
    rm -rf /tmp/*

ENTRYPOINT ["/init"]
