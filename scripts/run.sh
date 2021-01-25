#!/usr/bin/env bash

set -e
set -o pipefail

# https://github.com/zixia/bbs.zixia.net/issues/12
GDB_OPTIONS=\
  --cap-add=SYS_PTRACE \
  --security-opt apparmor=unconfined \

PORT_OPTIONS=\
  -p 2222:22 \
  -p 22222:2222 \
  -p 2323:23 \
  -p 8080:80 \

ENV_OPTIONS=\
  -e VIRTUAL_HOST=bbs.zixia.net,*.bbs.zixia.net,wforum.zixia.net,*.wforum.zixia.net \
  -e LETSENCRYPT_HOST=bbs.zixia.net,wforum.zixia.net \
  -e HTTPS_METHOD=noredirect \

docker run \
  --rm \
  -ti \
  $GDB_OPTIONS \
  $PORT_OPTIONS \
  $ENV_OPTIONS \
  --name bbs.zixia.net \
  -v /data/bbs:/bbs \
  ghcr.io/zixia/bbs.zixia.net
  # --entrypoint bash \
  # bbs.zixia.net

