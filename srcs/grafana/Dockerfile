FROM		alpine:latest

RUN			wget https://dl.grafana.com/oss/release/grafana-7.2.1.linux-amd64.tar.gz
RUN			tar -zxf grafana-7.2.1.linux-amd64.tar.gz && mv grafana-7.2.1 /grafana
RUN			rm -rf ./grafana-7.2.1.linux-amd64.tar.gz
RUN			wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub &&\
			wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk &&\
			apk add glibc-2.28-r0.apk

# COPY		grafana.ini /grafana/conf/
# COPY		grafana.ini /etc/grafana/grafana.ini
COPY		datasource.yaml /grafana/conf/provisioning/datasources/influxdb.yaml
COPY		dashboards.yaml /grafana/conf/provisioning/dashboards/dashboards.yaml

# COPY		datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
# COPY		dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY		./data/. /var/lib/grafana/dashboards/


# RUN			mkdir /grafana/conf/provisioning/dashboards/data
# COPY		./data /grafana/conf/provisioning/dashboards/data

EXPOSE		3000


CMD			["/grafana/bin/grafana-server", "-homepath", "/grafana/"]
# ENTRYPOINT ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana"]

# COPY		./srcs/custom.ini /grafana/conf/
# COPY		./srcs/dashboard.yaml /grafana/conf/provisioning/dashboards/
# COPY		./srcs/datasources.yaml /grafana/conf/provisioning/datasources/
# COPY		./data/. /var/lib/grafana/dashboards/.
