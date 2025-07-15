
FROM alpine:3
LABEL maintainer="dstritzel <dstritzel@users.noreply.github.com>"

ARG TINTIN_VERSION=2.02.51
ENV CONFIG_FILE=run.tin

COPY tintin-build.sh /tmp/

RUN /tmp/tintin-build.sh && rm -f /tmp/tintin-build.sh
USER tintin
VOLUME [ "/config" ]

WORKDIR "/config"

CMD [ "sh", "-c", "tt++ ${CONFIG_FILE}" ]
