FROM alpine:3.7
MAINTAINER smee@squeee.com
RUN apk add --no-cache g++ make zlib-dev pcre-dev
RUN wget -O /tmp/tintin.tar.gz 'http://downloads.sourceforge.net/project/tintin/TinTin%2B%2B%20Source%20Code/2.01.1/tintin-2.01.1.tar.gz?r=http%3A%2F%2Ftintin.sourceforge.net%2Fdownload.php&ts=1460041741&use_mirror=ufpr' \
    && cd /tmp \
    && tar -xf tintin.tar.gz \
    && cd tt/src && ./configure && make && make install && cd /tmp && rm -rf tintin.tar.gz tt
RUN mkdir /storage
VOLUME /storage
ENTRYPOINT ["tt++"]
