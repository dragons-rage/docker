# VIRTVERSION 2
FROM ubuntu:24.04 AS ubuntu-build
LABEL maintainer="github.com/dstritzel"
ARG TARGETARCH \
    TARGETOS

COPY ubuntu-build.sh /tmp/ubuntu-build.sh

RUN /tmp/ubuntu-build.sh && rm -f /tmp/ubuntu-build.sh

# FROM ubuntu-build
ENTRYPOINT ["/init"]
