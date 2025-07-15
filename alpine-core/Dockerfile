FROM alpine:3 AS alpine-build

LABEL maintainer="dstritzel <dstritzel@users.noreply.github.com>"

ARG TARGETARCH \
    TARGETOS

COPY alpine-build.sh /tmp/alpine-build.sh

RUN /tmp/alpine-build.sh /tmp/alpine-build.sh

#FROM alpine-build
ENTRYPOINT ["/init"]
