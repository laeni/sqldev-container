#!/bin/bash

# K8s 部署时，配置文件通常使用 ConfigMap 提供，而 ConfigMap 是以文件夹为单位挂载的，当仅需要通过 ConfigMap 提供部分配置文件时就不能直接挂
# 到目标路径，所以可以将配置挂载到其他目录，然后将挂载的文件链接到目标目录下，其他不通过 ConfigMap 提供的配置则保持默认即可。
[ -d /opt/sqldev/config-mounted ] && ln -sf /opt/sqldev/config-mounted/* /opt/sqldev/config/

source /etc/profile && ./sqldev
