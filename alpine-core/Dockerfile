FROM alpine:latest
LABEL maintainer="github.com/dstritzel"
ARG S6_ARCH=x86_64 \
    S6_OVERLAY_VERSION=3.1.2.1 \
    TARGETARCH \
    TARGETOS

ADD build.sh /tmp/build.sh

RUN apk add --no-cache bash tar gzip xz
RUN echo "*** Run Build Script***" && \
    chmod +x /tmp/build.sh && \
    /tmp/build.sh

ENTRYPOINT ["/init"]