ARG BUILD_FROM
FROM $BUILD_FROM


# Setup locals
ENV \
    LANG=C.UTF-8

ARG BUILD_ARCH

RUN \
    set -x \
    && apk add --no-cache \
        git \
        docker \
        coreutils \
    && apk add --no-cache --virtual .build-dependencies \
        build-base \
    && rm -rf /root/.cache \
    \
    && apk del .build-dependencies

COPY builder.sh /usr/bin/

WORKDIR /data
ENTRYPOINT ["/usr/bin/builder.sh"]
