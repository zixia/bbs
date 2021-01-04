FROM php:5.3
LABEL maintainer="Huan <zixia@zixia.net>"

# https://github.com/zixia/bbs.zixia.net.git

RUN apt-get update \
  && apt-get install -y --force-yes \
    apache2 \
    libgmp3-dev \
    openssl \
    sendmail \
    vim \

RUN a2enmod \
  rewrite \

RUN groupadd bbs --gid 80 \
  && useradd bbs \
    --home-dir /bbs \
    --uid 80 \
    --gid 80 \
  && mkdir /bbs \
    && chown bbs.bbs /bbs \
    && chmod 700 /bbs

USER bbs

RUN cd kbs_bbs \
  && ./autogen.sh \
  && (cd sshbbsd && ./autogen.sh) \
  && ./configure \
    --prefix=/bbs \
    --enable-site=zixia \
    --with-www=/var/www \
    --with-php=/usr/local/include/php \
    --without-mysql \
    --enable-ssh \
    --enable-ssl \
    --with-openssl=/usr \
    --with-libesmtp \
    CFLAGS="-O3 -g" \
  && make \
  && make install

# Expose web & sshbbsd & bbsd
EXPOSE 22
EXPOSE 23
EXPOSE 80

CMD ["bash"]

# healthy check
# HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://localhost:80 || exit 1

