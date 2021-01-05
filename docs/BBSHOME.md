Zixia BBS is full dockerized and the BBSHOME data can be totally separated from the bbs system.

We have the following two important folders:

1. `/kbs/`: store all kbs_bbs binaries
1. `/bbs/`: BBSHOME, data only, and should be mounted when start the bbs container

## `/kbs/`

All `kbs_bbs` binaries which is installed by run `make install` will be move to `/kbs/` folder for future usage, which is one of the most important difference to a non-dockerized bbs system.

```sh
/kbs/
|-- bin
|-- game
|-- lib
|-- service
`-- src
```

## BBSHOME `/bbs`

In our dockerized bbs system, BBSHOME is to store data only, and `/bbs/` in our docker image is a empty folder, its purpose is to be mounted from the data volume when start container.
