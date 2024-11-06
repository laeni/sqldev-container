#!/bin/bash

SQLDEV_FILE=sqldev-free-2.2.76-20240524081723.tar.gz

./download-file.sh $SQLDEV_FILE "c129c17065422b6fc8d50ba65f4f1f84" https://s1.cloud.shuaninfo.com/free/$SQLDEV_FILE

rm -rf sqldev
tar -xf $SQLDEV_FILE

docker build -t ccr.ccs.tencentyun.com/laeni/sqldev/sqldev:2.2.76.2 -f Dockerfile .
