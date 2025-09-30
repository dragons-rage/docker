ARG BASE=alpine:latest
FROM $BASE AS builder

ARG VERSION=3.6.5
ARG TARGETARCH
RUN apk add alpine-sdk git curl bash && \
    curl -fSL -o go.tar.gz https://golang.google.cn/dl/go1.23.9.linux-${TARGETARCH}.tar.gz && \
    tar -xvf go.tar.gz -C /usr/local
ENV PATH="/usr/local/go/bin:${PATH}"
RUN curl -fSL -o etcd.tar.gz https://github.com/etcd-io/etcd/archive/refs/tags/v${VERSION}.tar.gz && \
    mkdir -p /etcd && \
    tar -zxf etcd.tar.gz -C /etcd --strip-components=1 && \
    rm -rf etcd.tar.gz && \
    cd /etcd && \
    make -j$nproc

# use distroless image as base
FROM alpine

COPY --from=builder /etcd/bin/etcd /usr/bin/etcd
COPY --from=builder /etcd/bin/etcdctl /usr/bin/etcdctl
COPY --from=builder /etcd/bin/etcdutl /usr/bin/etcdutl

EXPOSE 2379 2380
CMD [ "etcd" ]
