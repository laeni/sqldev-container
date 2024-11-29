#!/bin/bash

SQLDEV_FILE=sqldev-free-2.2.78-20241129065720.tar.gz

# md5 获取: curl -sSL https://s1.cloud.shuaninfo.com/free/$SQLDEV_FILE | md5sum
./download-file.sh $SQLDEV_FILE "ad10af1e21b21879dee608dc0c159fa3" https://s1.cloud.shuaninfo.com/free/$SQLDEV_FILE

rm -rf sqldev
tar -xf $SQLDEV_FILE

docker build -t ccr.ccs.tencentyun.com/laeni/sqldev/sqldev:2.2.78 -f Dockerfile .
