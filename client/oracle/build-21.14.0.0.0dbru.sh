#!/bin/bash

# https://www.oracle.com/cn/database/technologies/instant-client/linux-x86-64-downloads.html
# Docker 无法识别直接从 oracle 官网下载的 zip 包，所以导致 ADD 会将整个未解压的文件添加进去，
# 所以需要先提前解压，然后使用 COPY 命令直接拷贝解压后的文件即可

ORACLE_FILE=instantclient-basiclite-linux.x64-21.14.0.0.0dbru.zip

../../download-file.sh $ORACLE_FILE "9447acb812afdbe274d6eff083738640" https://download.oracle.com/otn_software/linux/instantclient/2114000/$ORACLE_FILE

rm -rf instantclient META-INF
unzip $ORACLE_FILE
mv instantclient_21_14 instantclient

docker build -t oracle-client-basiclite:21.14.0.0.0dbru -f Dockerfile-oracle-client .
