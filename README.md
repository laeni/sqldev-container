# 使用镜像

1. 复制默认配置文件到指定目录

   ```shell
   mkdir -p /tmp/config
   docker run --rm -v /tmp/config:/opt/sqldev/config1 laeni/sqldev:2.2.78 bash -c "cp /opt/sqldev/config/* /opt/sqldev/config1/"
   ```

2. 根据实际情况修改配置文件

   `app.ini` 中的 Redis 配置以及 `gorm.ini` 中的数据库配置一定要修改，其余配置可以保持默认。

3. 使用修改后的配置启动容器

   ```shell
   docker run \
     --name sqldev \
     -d \
     --restart=always \
     -p 9000:9000 \
     -v /tmp/config:/opt/sqldev/config \
     laeni/sqldev:2.2.78
   ```
