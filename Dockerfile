FROM php:5.3
MAINTAINER "Huan <zixia@zixia.net>"
LABEL maintainer="Huan <zixia@zixia.net>"
LABEL org.opencontainers.image.source="https://github.com/zixia/bbs.zixia.net"

EXPOSE 2222
EXPOSE 2323
EXPOSE 8080

CMD ["bash"]

# healthy check
# HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://localhost:80 || exit 1

RUN apt-get update \
  && apt-get install -y --force-yes \
    apache2 \
    libgmp3-dev \
    openssl \
    sendmail \
    telnet \
    vim \
  && echo done

# RUN a2enmod \
#     rewrite \
#   && echo done

RUN groupadd --gid 80 bbs \
  && useradd \
    --home-dir /bbs \
    --gid 80 \
    --uid 80 \
    bbs \
  && mkdir -p /bbs/src /kbs \
    && chown -R bbs.bbs /bbs /kbs /var/www \
    && chmod 700 /bbs /kbs \
  && echo done

COPY --chown=bbs kbs_bbs /bbs/src/kbs_bbs
WORKDIR /bbs
USER bbs

ENV PHP_INCLUDE='/usr/local/include/php'
ENV CFLAGS='-O3 -g'

RUN cd src/kbs_bbs \
  && ./autogen.sh \
  && (cd sshbbsd && ./autogen.sh) \
  && ./configure \
    --enable-site=zixia \
    --prefix=/bbs \
    \
    --enable-ssh \
    --enable-ssl \
    --with-libesmtp \
    --with-openssl=/usr \
    --with-php="$PHP_INCLUDE"\
    --with-www=/var/www \
    --without-mysql \
    CFLAGS="$CFLAGS" \
  && make \
  && make install \
  && echo done

#
# Huan(202101): We use /kbs/ to store all sys binaries,
#   so that we can use /bbs/ as a pure data volume.
#
RUN mv /bbs/* /kbs

# Huan(202001): We have to put `VOLUME` after any operation to the `/bbs/` folder
#   because after the `VOLUME` line, the folder will not be able to `chown` anymore.
VOLUME /bbs
