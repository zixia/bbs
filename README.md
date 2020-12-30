# bbs.zixia.net

大话西游 zixia BBS

## Install

```
Debian / Jessie

apt-get install -y \
    autoconf automake autotools-dev libltdl-dev libssl-dev libtool m4 cmake shtool zlib1g-dev sendmail libesmtp6 openssl bison byacc libgmp3-dev flex libxml2-dev libjpeg62-turbo-dev \
    libpng12-dev libfreetype6-dev subversion libncurses5-dev g++ patch sendmail-bin libbsd-dev libgdbm-dev libexpat-dev uuid-dev gawk libsqlite3-dev libmcrypt-dev

https://www.php.net/distributions/php-5.6.40.tar.gz
./configure --with-apxs2=/bbs/www/bin/apxs --with-gd --with-png-dir --with-iconv \
    --with-jpeg-dir --with-zlib --with-freetype-dir --enable-gd-native-ttf \
    --with-mcrypt --enable-mbstring=all --enable-exif --prefix=/bbs/www

./configure --prefix=/bbs --enable-site=zixia --with-www=/bbs/www \
    --without-php=/bbs/src/php-4.4.4 --without-mysql --enable-ssh --enable-ssl \
    --with-openssl=/usr --with-libesmtp --enable-innbbsd CFLAGS="-O3 -g"
```

## History

### v20 Dec 30, 2020

### v18 2018

Two disk failure: The system data storage has two 750GB disk with ReiserFS and XFS, they have started losing data and emit lots of dmesg error messages.

System began offline since then.

### v16 2016

Mainboard failure: The system can not boot until I send it to Zhongguancun and fix it by replacing a capacitance. (Thanks my good friend 王明欣!)

### v6 (Nov 11, 2006)

New server online! (Thanks my good friend zxcvb for helping me to buy and setup this server!)

1. server configuratrion checklist table: ([link](docs/images/zixia-server-2006.webp))

### v1.0 (1999)

大话西游 zixia bbs landed!

### v0.0.1 (1998)

The former name of bbs.zixia.net is 机械志途 which is a dorm bbs build by zixia at 1998 when he was studying at DME73 in Tsinghua University at buliding 28.

## Maintainer

[Huan](https://github.com/huan) [(zixia)](https://www.zixia.net), SYSOP of [大话西游 zixia BBS](https://bbs.zixia.net), <zixia@zixia.net>

[![Profile of Huan LI (李卓桓) on StackOverflow](https://stackoverflow.com/users/flair/1
123955.png)](https://stackoverflow.com/users/1123955/huan)

## Copyright & License

- Code & Docs © 1998-2021 zixia.net
- Code released under the GPLv3
- Docs released under Creative Commons
