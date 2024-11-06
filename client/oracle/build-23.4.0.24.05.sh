#!/bin/bash

cd $(dirname $(readlink -f "$0"))/../..

# https://www.oracle.com/cn/database/technologies/instant-client/linux-x86-64-downloads.html
# Docker 无法识别直接从 oracle 官网下载的 zip 包，所以导致 ADD 会将整个未解压的文件添加进去，
# 所以需要先提前解压，然后使用 COPY 命令直接拷贝解压后的文件即可

ORACLE_FILE=instantclient-basiclite-linux.x64-23.4.0.24.05.zip

./download-file.sh $ORACLE_FILE "afab029f7b5c7e1c74956d6a52b00598" https://download.oracle.com/otn_software/linux/instantclient/2340000/$ORACLE_FILE

rm -rf instantclient META-INF
unzip $ORACLE_FILE
mv instantclient_23_4 instantclient

docker build -t ccr.ccs.tencentyun.com/laeni/oracle-client-basiclite:23.4.0.24.05 -f Dockerfile-oracle-client .
