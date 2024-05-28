#!/bin/bash

SQLDEV_FILE=sqldev-free-2.2.76-20240524081723.tar.gz

download_file() {
  if [ -f $1 ]; then
    md5=$(md5sum "$1" | awk '{print $1}')
    if [ "$md5" != "$2" ]; then
      echo "md5sum not match, download again. actual md5: \"$md5\", expect md5: \"$2\"."
      rm -rf $1
      curl -LO $3
    fi
  else
    curl -LO $3
  fi
}

download_file $SQLDEV_FILE "c129c17065422b6fc8d50ba65f4f1f84" https://s1.cloud.shuaninfo.com/free/$SQLDEV_FILE

rm -rf sqldev
tar -xf $SQLDEV_FILE

docker build -t laeni/sqldev:2.2.76 -f Dockerfile .
