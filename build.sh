#!/bin/bash

# https://www.oracle.com/cn/database/technologies/instant-client/linux-x86-64-downloads.html
# Docker 无法识别直接从 oracle 官网下载的 zip 包，所以导致 ADD 会将整个未解压的文件添加进去，
# 所以需要先提前解压，然后使用 COPY 命令直接拷贝解压后的文件即可

ORACLE_FILE=instantclient-basiclite-linux.x64-23.4.0.24.05.zip
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

download_file $ORACLE_FILE "afab029f7b5c7e1c74956d6a52b00598" https://download.oracle.com/otn_software/linux/instantclient/2340000/$ORACLE_FILE
download_file $SQLDEV_FILE "c129c17065422b6fc8d50ba65f4f1f84" https://s1.cloud.shuaninfo.com/free/$SQLDEV_FILE

rm -rf instantclient META-INF
unzip $ORACLE_FILE
mv instantclient_23_4 instantclient

rm -rf sqldev
tar -xf $SQLDEV_FILE

docker build -t sqldev:2.2.76 -f Dockerfile .
