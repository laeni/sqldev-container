FROM oracle-client-basiclite:23.4.0.24.05

LABEL authors="Laeni"

WORKDIR /opt/sqldev

COPY sqldev /opt/sqldev
COPY run.sh /opt/sqldev/run.sh

RUN chmod -R a+rx /opt/sqldev/run.sh
RUN chmod -R a+rw /opt/sqldev/config

CMD ["/opt/sqldev/run.sh"]
