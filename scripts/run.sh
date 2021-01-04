#!/usr/bin/env bash

set -e
set -o pipefail

docker run \
  --rm \
  -ti \
  -p 2222:22 \
  -p 2323:23 \
  -p 8080:80 \
  -e VIRTUAL_HOST=bbs.zixia.net,*.bbs.zixia.net \
  -e LETSENCRYPT_HOST=bbs.zixia.net \
  -e HTTPS_METHOD=noredirect \
  --entrypoint bash \
  bbs.zixia.net

  #ghcr.io/zixia/bbs.zixia.net
