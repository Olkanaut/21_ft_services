FROM		alpine:latest

RUN			apk update && apk upgrade
RUN			apk add mysql mysql-client > /dev/null
RUN			apk add openrc

RUN			mkdir -p /run/mysql && chown -R mysql:mysql /run/mysql

COPY		/createdb.sql /tmp/
COPY		/wordpress.sql /tmp/wordpress.sql
COPY		/my.cnf /etc/my.cnf
COPY		/start.sh /tmp/
RUN			chmod +x /tmp/start.sh

EXPOSE		3306
VOLUME		["/var/lib/mysql"]

ENTRYPOINT	["/tmp/start.sh"]
