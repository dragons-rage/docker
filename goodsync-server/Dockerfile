FROM dstritzel/alpine-core:latest
LABEL maintainer "dstritzel <dstritzel@users.noreply.github.com>"

ENV DIRECTORY_CONFIG=/config \
    DIRECTORY_DATA=/data \
    ARCH=x86_64


ADD https://www.goodsync.com/download/goodsync-release-${ARCH}.tar.gz /tmp/goodsync-release-${ARCH}.tar.gz


RUN echo "**** install gs-server ****" && \
 tar xvzf /tmp/goodsync-release-${ARCH}.tar.gz -C /usr/bin --strip-components=1 && \
 chmod +x /usr/bin/gs-server && \
 echo "**** cleanup ****" && \
 rm -rf /tmp/*

ADD --chown=abc:abc root/ /

# [PORTS]
# WebUI Port
EXPOSE 11000/tcp
# Main goodsync protocol port, for uploads/downloads
EXPOSE 33333/tcp
# Local Discovery of GS services are done using these 2 ports
EXPOSE 33338/udp
EXPOSE 33339/udp

VOLUME [ "/data", "/config" ]

ENTRYPOINT [ "/usr/bin/gs-server", "/profile=${DIRECTORY_CONFIG}" ]