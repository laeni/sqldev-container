FROM ccr.ccs.tencentyun.com/laeni/oracle-client-basiclite:21.14.0.0.0dbru

LABEL authors="Laeni"

WORKDIR /opt/sqldev

COPY sqldev /opt/sqldev
COPY run.sh /opt/sqldev/run.sh

RUN chmod -R a+rx /opt/sqldev/run.sh
RUN chmod -R a+rw /opt/sqldev/config

CMD ["/opt/sqldev/run.sh"]
