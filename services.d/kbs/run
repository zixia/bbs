#!/bin/bash
#
# Author: Major@newsmth.net, Dec, 2020
# Maintainer: Huan <zixia@zixia.net>
#

set -e
set -o pipefail

KBS='/kbs'
BBSHOME='/bbs'

function sigterm_handler () {
  echo "SIGTERM signal received, try to gracefully shutdown all services..."
  $KBS/bin/miscd flush
  # /etc/init.d/httpd stop
}

function bbs_home_not_mounted () {
  echo 'BBS home volume is not mounted, plz mount it first'
  echo 'use `-v /data/bbs:/bbs`'
  exit 1
}

function start_bbs () {
  "$KBS"/bin/miscd daemon
  "$KBS"/bin/bbslogd
  "$KBS"/bin/bbsd -p 2323
  "$KBS"/bin/sshbbsd -p 2222
  # cd /opt/lampp/bin
  # "$KBS"/apachectl start

  # $BBSHOME/rc.bbs start
  #/etc/init.d/httpd start
  # BBSD_APACHE=/usr/sbin/apachectl -D FOREGROUND &

}
trap "sigterm_handler; exit" TERM

# check if bbs volume is mounted
if [[ ! -f "$BBSHOME".PASSWD ]]; then
  bbs_home_not_mounted
fi

start_bbs

# flush the miscd every hour
while sleep 3600; do
  "$KBS"/bin/miscd flush
done

# Wait for SIGTERM
wait
