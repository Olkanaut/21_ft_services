#!/bin/sh

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql < /tmp/createdb.sql
mysql -u root wordpress < /tmp/wordpress.sql
rc-service mariadb stop
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
