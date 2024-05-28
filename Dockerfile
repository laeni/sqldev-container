FROM ubuntu:24.04

# 由于 Oracel Client 依赖 libaio，所以 libaio-dev 包必须安装；考虑到排查问题方便就一同安装 vim-tiny 和 inetutils-ping
RUN apt update
RUN apt install -y vim-tiny inetutils-ping libaio-dev
RUN sed -i 's/set compatible/set nocompatible/g' /etc/vim/vimrc.tiny
RUN ln -s /usr/lib/x86_64-linux-gnu/libaio.so /usr/lib/x86_64-linux-gnu/libaio.so.1

# 安装 Oracel Client - https://www.oracle.com/cn/database/technologies/instant-client/linux-x86-64-downloads.html
COPY instantclient /opt/oracle
RUN echo 'export LD_LIBRARY_PATH=/opt/oracle:\$LD_LIBRARY_PATH' >> /etc/profile

LABEL authors="Laeni"

WORKDIR /opt/sqldev

COPY sqldev /opt/sqldev
COPY run.sh /opt/sqldev/run.sh

RUN chmod -R a+rx /opt/sqldev/run.sh
RUN chmod -R a+rw /opt/sqldev/config

CMD ["/opt/sqldev/run.sh"]
