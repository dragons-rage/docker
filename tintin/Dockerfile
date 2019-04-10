FROM alpine:3.9
MAINTAINER smee@squeee.com
RUN apk add --no-cache g++ make zlib-dev pcre-dev gnutls-dev
RUN wget -O /tmp/tintin.tar.gz 'http://sourceforge.net/projects/tintin/files/TinTin%2B%2B%20Source%20Code/2.01/tintin-2.01.7.tar.gz/download' \
    && cd /tmp \
    && tar -xf tintin.tar.gz \
    && cd tt/src && ./configure && make && make install && cd /tmp && rm -rf tintin.tar.gz tt
ENTRYPOINT ["tt++"]
