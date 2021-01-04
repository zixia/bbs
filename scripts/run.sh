#!/usr/bin/env bash

set -e
set -o pipefail

docker run \
  --rm \
  -ti \
  -p 2222:2222 \
  -p 22222:22222 \
  -p 2323:2323 \
  -p 8080:8080 \
  -v /data/bbs:/bbs \
  -e VIRTUAL_HOST=bbs.zixia.net,*.bbs.zixia.net \
  -e LETSENCRYPT_HOST=bbs.zixia.net \
  -e HTTPS_METHOD=noredirect \
  --entrypoint bash \
  bbs.zixia.net

  #ghcr.io/zixia/bbs.zixia.net
