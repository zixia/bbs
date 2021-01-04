#!/usr/bin/env bash

set -e
set -o pipefail

docker run \
  --rm \
  -ti \
  -p 22:2222 \
  -p 23:2323 \
  -p 80:8080 \
  -v /data/bbs:/bbs \
  -e VIRTUAL_HOST=bbs.zixia.net,*.bbs.zixia.net \
  -e LETSENCRYPT_HOST=bbs.zixia.net \
  -e HTTPS_METHOD=noredirect \
  --entrypoint bash \
  bbs.zixia.net

  #ghcr.io/zixia/bbs.zixia.net
