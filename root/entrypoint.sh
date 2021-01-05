#!/usr/bin/env bash
#
# Author: Huan <zixia@zixia.net>
#   Jan 2021

BBS_DATA='/bbs'

# check if bbs volume is mounted
if [[ ! -f "$BBS_DATA"/.PASSWDS ]]; then
  echo 'BBS home volume is not mounted, plz mount it first'
  echo 'use `-v /data/bbs:/bbs`'
  exit 1
fi

exec /init "$@"
