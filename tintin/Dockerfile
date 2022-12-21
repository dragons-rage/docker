FROM faliarin/alpine-core:latest

ENV CONFIG_FILE=run.tin

LABEL maintainer "dstritzel <dstritzel@users.noreply.github.com>"

RUN apk add --no-cache wget build-base zlib-dev gnutls-dev pcre-dev make
RUN wget -L -O /tmp/tintin.tar.gz 'https://github.com/scandum/tintin/releases/download/2.02.20/tintin-2.02.20.tar.gz' \
    && cd /tmp \
    && mkdir /config
    && tar -xf tintin.tar.gz \
    && cd tt/src && ./configure && make && make install && cd /tmp && rm -rf tintin.tar.gz tt

VOLUME [ "/config" ]
WORKDIR "/config"
CMD ["tt++", "/config/${CONFIG_FILE}"]