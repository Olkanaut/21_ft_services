#!/bin/sh

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql < createdb.sql
# mysql < wordpress.sql
rc-service mariadb stop
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'

# mysql -u root wordpress < /tmp/wordpress.sql
