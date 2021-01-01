# 大话西游 zixia BBS

![大话西游紫霞BBS](docs/images/zixia-bbs-login.png)

## Install

```sh
# Debian / Jessie

apt-get install -y \
    autoconf automake autotools-dev libltdl-dev libssl-dev libtool m4 cmake shtool zlib1g-dev sendmail libesmtp6 openssl bison byacc libgmp3-dev flex libxml2-dev libjpeg62-turbo-dev \
    libpng12-dev libfreetype6-dev subversion libncurses5-dev g++ patch sendmail-bin libbsd-dev libgdbm-dev libexpat-dev uuid-dev gawk libsqlite3-dev libmcrypt-dev

https://www.php.net/distributions/php-5.6.40.tar.gz
./configure --with-apxs2=/bbs/www/bin/apxs --with-gd --with-png-dir --with-iconv \
    --with-jpeg-dir --with-zlib --with-freetype-dir --enable-gd-native-ttf \
    --with-mcrypt --enable-mbstring=all --enable-exif --prefix=/bbs/www

./configure --prefix=/bbs --enable-site=zixia --with-www=/bbs/www \
    --with-php=/bbs/src/php-5.6.40 --without-mysql --enable-ssh --enable-ssl \
    --with-openssl=/usr --with-libesmtp CFLAGS="-O3 -g"
```

## Usage

The KBS sytem is using GBK for encoding so we need to use `luit` to convert GBK to UTF8

```sh
luit -encoding GBK ssh zixia@bbs.zixia.net

# or

luit -encoding GBK telnet bbs.zixia.net
```

And the web can be visited at <https://bbs.zixia.net>

## Screenshots

![大话西游紫霞BBS](docs/images/zixia-bbs-menu.png)

![大话西游紫霞BBS](docs/images/zixia-bbs-elite.png)

## History

### v20 Dec 30, 2020

### v18 2018

Two disk failure: The system data storage has two 750GB disk with ReiserFS and XFS, they have started losing data and emit lots of dmesg error messages.

System began offline since then.

### v16 2016

Mainboard failure: The system can not boot until I send it to Zhongguancun and fix it by replacing a capacitance. (Thanks my good friend 王明欣!)

### v13 (Jan 3, 2013)

- [我之天马行空 - 左拥周星驰，右抱马云](https://blog.zixia.net/2013/03/07/zhouxingchi-mayun-zixia/)

### v6 (Nov 11, 2006)

New server online! (Thanks my good friend zxcvb for helping me to buy and setup this server!)

1. server configuratrion checklist table: ([link](docs/images/zixia-server-2006.webp))

### v1.0 (1999)

大话西游 zixia bbs landed!

### v0.0.1 (1998)

The former name of bbs.zixia.net is 机械志途 which is a dorm bbs build by zixia at 1998 when he was studying at DME73 in Tsinghua University at buliding 28.

## The Story

![大话西游：紫霞，齐天大圣孙悟空](docs/images/zixia-qitiandasheng.png)

### 我的大话西游紫霞情缘

1998年，一部周星驰电影《大话西游》由清华开始,在全国高校蔓延。

> “下雨啦,收衣服!”  
> “你妈贵姓啊?”

这些电影对白成为大学校园的通行证，最后又蔓延到社会，成为一种社交工具。
一个年轻人不知道“大话”，在当时是不可思议的一件事。

这一年，李卓桓在清华上大二，并同时任职 ChinaRen.com，
开始互联网职业生涯。业余时间,他专门创办了一个名为“大话西游”的BBS，
即 bbs.zixia.net 。此后。《大话》女主人公的名字“zixia”，
便成为李卓桓在网络上和生活中的另外一个名字，远远超过了其本名的传播度。
而 zixia BBS 成为“大话西游”迷的阵地而红极一时。

《大话西游》作为一部深受 zixia 和他的清华同学们所热爱的电影，
在这个 BBS 上被进一步推波助澜地传播出去。
大话西游文化以清华为中心在各大高校传播，影响了一代大学生。

电影用通过无厘头的行为和语言释放了年轻人的郁闷，提供了一个宣泄渠道，
用调侃的态度安全地表达着年轻人对生活的一种渴望。

如果说每个人的文化记忆中，都会有伴随一生的东西，会以那个时代的生活态度传达出来，
被不断地重复使用。那么“大话”无疑就是李卓桓和他的同龄人的那件记忆符号。15年来,
《大话西游》成为校园中的一个传奇，也是一代人的青春记忆。

此本纪念册，汇集了1999年前后有代表性的几篇短文。有幸借此“天马行空”的机会，
作为小小心意，赠与星爷、马云先生，共同重温大话西游时代的感动。

“你想要啊？你想要的话你就说话嘛。你不说我怎么知道你想要呢？
虽然你很有诚意地看着我，可是你还是要跟我说你想要的。你真的想要吗？
那你就拿去吧！你不是真的想要吧？难道你真的想要吗？......”

> 李卓桓，写于赠送给周星驰和马云的[《天马行空（周星驰、马云）大话西游紫霞BBS礼物册》](docs/大话西游紫霞BBS之天马行空2013.pdf)  
> 2013年1月3日，星期四

![天马行空（周星驰、马云、zixia）传媒大学](docs/images/mayun-zhouxingchi-zixia.webp)

## Maintainer

[Huan](https://github.com/huan) [(zixia)](https://www.zixia.net), Creator & SYSOP of [大话西游 zixia BBS](https://bbs.zixia.net), <zixia@zixia.net>

[![Profile of Huan LI (李卓桓) on StackOverflow](https://stackoverflow.com/users/flair/1123955.png)](https://stackoverflow.com/users/1123955/huan)

## Copyright & License

- Code & Docs © 1998-2021 zixia.net
- Code released under the GPLv3
- Docs released under Creative Commons

![大话西游：一生所爱](docs/images/zixia-film.webp)
