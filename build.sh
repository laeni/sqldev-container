#!/bin/bash

SQLDEV_VERSION=2.2.78
SQLDEV_FILE=sqldev-free-2.2.78-20241129065720.tar.gz
SQLDEV_FILE_MD5=ad10af1e21b21879dee608dc0c159fa3 # md5 获取: curl -sSL https://s1.cloud.shuaninfo.com/free/$SQLDEV_FILE | md5sum

./download-file.sh $SQLDEV_FILE $SQLDEV_FILE_MD5 https://s1.cloud.shuaninfo.com/free/$SQLDEV_FILE

rm -rf sqldev
tar -xf $SQLDEV_FILE

docker build -t laeni/sqldev:$SQLDEV_VERSION -f Dockerfile .
docker tag laeni/sqldev:$SQLDEV_VERSION ccr.ccs.tencentyun.com/laeni/sqldev:$SQLDEV_VERSION
