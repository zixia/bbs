#!/bin/bash
#
# Credit: Major@newsmth.net, Dec, 2020
#

set -e

BBSHOME="/data/service/bbs"

function sigterm_handler() {
  echo "SIGTERM signal received, try to gracefully shutdown all services..."
  $BBSHOME/bin/miscd flush
  /etc/init.d/httpd stop
}

function bbs_home_not_exist() {
  echo 'BBS home not exist, plz mount the bbs home first'
  echo 'use -v /data/service/bbs:/data/service/bbs'
  exit 1
}

trap "sigterm_handler; exit" TERM

# check if bbs dir is exist
if [[ ! -f "$BBSHOME"/bin/bbsd ]]; then
  bbs_home_not_exist
fi


# modify the config file
echo "Preparing services..."
if [[ -f $BBSHOME/docker/httpd.conf ]]; then
  cat $BBSHOME/docker/httpd.conf > /etc/httpd/conf/httpd.conf
fi

if [[ -f $BBSHOME/docker/php.ini ]]; then
  cat $BBSHOME/docker/php.ini > /etc/php.ini
fi

# Start service manager
echo "Starting services..."
$BBSHOME/rc.bbs start
#/etc/init.d/httpd start
echo "Starting services..."
BBSD_APACHE=/usr/sbin/apachectl -D FOREGROUND &

# flush the miscd every hour
while sleep 3600; do
  $BBSHOME/bin/miscd flush
done

# Wait for SIGTERM
wait
