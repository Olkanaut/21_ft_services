FROM		alpine:latest

#
ENV			TELEGRAF_CONFIG_PATH=/telegraf/etc/telegraf/telegraf.conf
#

RUN			wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.1_linux_amd64.tar.gz
RUN			tar -zxf telegraf-1.14.1_linux_amd64.tar.gz
RUN			rm -rf telegraf-1.14.1_linux_amd64.tar.gz
RUN			wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
			wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
			apk add glibc-2.28-r0.apk

COPY		./telegraf.conf /telegraf/etc/telegraf/telegraf.conf

CMD			[ "/telegraf/usr/bin/telegraf", "/telegraf/etc/telegraf/" ]
