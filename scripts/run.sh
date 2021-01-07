#!/usr/bin/env bash

set -e
set -o pipefail

docker run \
  --name bbs.zixia.net \
  --rm \
  -ti \
  -p 2222:22 \
  -p 22222:2222 \
  -p 2323:23 \
  -p 8080:80 \
  -v /data/bbs:/bbs \
  -e VIRTUAL_HOST=bbs.zixia.net,*.bbs.zixia.net,wforum.zixia.net,*.wforum.zixia.net \
  -e LETSENCRYPT_HOST=bbs.zixia.net,wforum.zixia.net \
  -e HTTPS_METHOD=noredirect \
  ghcr.io/zixia/bbs.zixia.net
  # --entrypoint bash \
  # bbs.zixia.net

