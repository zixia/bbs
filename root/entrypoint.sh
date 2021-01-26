#!/usr/bin/env bash
#
# https://github.com/zixia/bbs
#
# Author: Huan <zixia@zixia.net>
# Date:   Jan 2021
#

BBS_DATA='/bbs'

# check if bbs volume is mounted
if [[ ! -f "$BBS_DATA"/.PASSWDS ]]; then
  echo 'BBS home volume is not mounted, plz mount it first'
  echo "use `-v /data/bbs:$BBS_DATA`"
  exit 1
fi

exec /init "$@"
