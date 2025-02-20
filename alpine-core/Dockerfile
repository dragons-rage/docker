FROM alpine:latest as alpine-build

LABEL maintainer "dstritzel <dstritzel@users.noreply.github.com>"

ARG S6_ARCH=x86_64 \
    S6_OVERLAY_VERSION=3.2.0.2 \
    TARGETARCH \
    TARGETOS

ADD build.sh /tmp/build.sh

RUN apk add --no-cache bash tar gzip xz curl

RUN echo "*** Run Build Script***" && \
    chmod +x /tmp/build.sh && \
    /bin/bash -x /tmp/build.sh

FROM alpine-build
ENTRYPOINT ["/init"]
