
ARG GO_VERSION=1.25.1
ARG ETCD_VERSION=3.6.5
ARG ALPINE_VERSION=3

FROM alpine:${ALPINE_VERSION} AS builder


ARG TARGETARCH
RUN apk add --no-cache alpine-sdk git curl bash && \
    echo "Building for architecture: ${TARGETARCH}" && \
    echo "curl -fSL -o go.tar.gz https://go.dev/dl/go$GO_VERSION.linux-$TARGETARCH.tar.gz" && \
    curl -fSL -o go.tar.gz "https://go.dev/dl/go$GO_VERSION.linux-$TARGETARCH.tar.gz" && \
    tar -xvf go.tar.gz -C /usr/local
ENV PATH="/usr/local/go/bin:${PATH}"
RUN curl -fSL -o etcd.tar.gz "https://github.com/etcd-io/etcd/archive/refs/tags/v$ETCD_VERSION.tar.gz" && \
    mkdir -p /etcd && \
    tar -zxf etcd.tar.gz -C /etcd --strip-components=1 && \
    rm -rf etcd.tar.gz && \
    cd /etcd && \
    make -j$nproc

# We will use a clean alpine image as the base
FROM alpine:${ALPINE_VERSION}

RUN addgroup -S etcd && adduser -S etcd -G etcd
COPY --from=builder /etcd/bin/etcd /usr/bin/etcd
COPY --from=builder /etcd/bin/etcdctl /usr/bin/etcdctl
COPY --from=builder /etcd/bin/etcdutl /usr/bin/etcdutl

RUN mkdir -p /data/etcd && chown -R etcd:etcd /data/etcd

VOLUME ["/data/etcd"]

USER etcd
ENV ETCD_DATA_DIR=/data/etcd \
    ETCD_ENABLE_V2="true" \
    ALLOW_NONE_AUTHENTICATION="yes" \
    ETCD_ADVERTISE_CLIENT_URLS="http://etcd:2379" \
    ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD etcdctl --endpoints=http://127.0.0.1:2379 endpoint health || exit 1

EXPOSE 2379 2380
CMD [ "etcd" ]
