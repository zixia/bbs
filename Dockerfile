FROM php:5.3
MAINTAINER "Huan <zixia@zixia.net>"
LABEL maintainer="Huan <zixia@zixia.net>"

# https://github.com/zixia/bbs.zixia.net.git

RUN apt-get update \
  && apt-get install -y --force-yes \
    apache2 \
    libgmp3-dev \
    openssl \
    sendmail \
    telnet \
    vim \
  && echo done

RUN a2enmod \
    rewrite \
  && echo done

RUN groupadd --gid 80 bbs \
  && useradd \
    --home-dir /bbs \
    --gid 80 \
    --uid 80 \
    bbs \
  && mkdir -p /bbs/src /kbs \
    && chown -R bbs.bbs /bbs /kbs /var/www \
    && chmod 700 /bbs \
  && echo done

COPY  --chown=bbs kbs_bbs /bbs/src/kbs_bbs
WORKDIR /bbs
USER bbs

ENV PHP_INCLUDE='/usr/local/include/php'
ENV CFLAGS='-O3 -g'

RUN cd src/kbs_bbs \
  && ./autogen.sh \
  && (cd sshbbsd && ./autogen.sh) \
  && ./configure \
    --prefix=/bbs \
    --enable-site=zixia \
    --with-www=/var/www \
    --with-php="$PHP_INCLUDE"\
    --without-mysql \
    --enable-ssh \
    --enable-ssl \
    --with-openssl=/usr \
    --with-libesmtp \
    CFLAGS="$CFLAGS" \
  && make \
  && make install \
  && echo done

RUN mv /bbs/* /kbs

VOLUME /bbs

# Expose web & sshbbsd & bbsd
EXPOSE 2222
EXPOSE 2323
EXPOSE 8080

CMD ["bash"]

# healthy check
# HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://localhost:80 || exit 1

LABEL org.opencontainers.image.source="https://github.com/zixia/bbs.zixia.net"

