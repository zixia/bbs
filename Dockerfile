FROM php:5.3
MAINTAINER "Huan <zixia@zixia.net>"
LABEL maintainer="Huan <zixia@zixia.net>"
LABEL org.opencontainers.image.source="https://github.com/zixia/bbs"

# BBS SSH
EXPOSE 22
# BBS Telnt
EXPOSE 23
# BBS HTTP
EXPOSE 80
# BBS Shell SSH
EXPOSE 2222

# healthy check
# HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://localhost:80 || exit 1

RUN apt-get update \
  && apt-get install -y --force-yes \
    apache2 \
    gdb \
    jq \
    libgmp3-dev \
    locales \
    openssh-client \
    openssh-server \
    openssl \
    screen \
    sendmail \
    strace \
    sudo \
    telnet \
    vim \
  && echo done

RUN groupadd --gid 80 bbs \
  && useradd \
    --home-dir /bbs \
    --shell /bin/bash \
    --gid 80 \
    --uid 80 \
    bbs \
  && mkdir -p /bbs/src /kbs \
    && chown -R bbs.bbs /bbs /kbs /var/www \
    && chmod 700 /bbs /kbs \
  && echo "bbs ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && sed -i '/zh_CN.GBK/s/^# //' /etc/locale.gen \
  && sed -i '/en_US.UTF/s/^# //' /etc/locale.gen \
  && locale-gen \
  && echo done

# Huan(202101): ARG must after FROM, or it will lost in the context after FROM.
ARG S6_OVERLAY_VERSION=1.22.1.0
ARG S6_OVERLAY_MD5HASH=3060e2fdd92741ce38928150c0c0346a

# S6 Overlay
RUN curl -J -L -o /tmp/s6-overlay-amd64.tar.gz "https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz" \
  && echo -n "Checking md5sum... " \
  && echo "$S6_OVERLAY_MD5HASH /tmp/s6-overlay-amd64.tar.gz" | md5sum -c - \
  && tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
  && rm /tmp/s6-overlay-amd64.tar.gz

COPY --chown=bbs kbs_bbs/ /bbs/src/kbs_bbs

WORKDIR /bbs
USER bbs

ARG PHP_INCLUDE='/usr/local/include/php'
ARG CFLAGS='-O3 -g'
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

USER root
COPY root/ /
COPY VERSION /
ENTRYPOINT /entrypoint.sh
