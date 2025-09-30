FROM alpine AS builder

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

# We will use a clean alpine image as the base
FROM alpine

RUN addgroup -S etcd && adduser -S etcd -G etcd
COPY --from=builder /etcd/bin/etcd /usr/bin/etcd
COPY --from=builder /etcd/bin/etcdctl /usr/bin/etcdctl
COPY --from=builder /etcd/bin/etcdutl /usr/bin/etcdutl

RUN mkdir -p /data/etcd && chown -R etcd:etcd /data/etcd

USER etcd
ENV ETCD_DATA_DIR=/data/etcd \
    ETCD_ENABLE_V2="true" \
    ALLOW_NONE_AUTHENTICATION="yes" \
    ETCD_ADVERTISE_CLIENT_URLS="http://etcd:2379" \
    ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"

EXPOSE 2379 2380
CMD [ "etcd" ]
