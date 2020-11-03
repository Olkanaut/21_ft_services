#!/bin/sh

php -S 0.0.0.0:5050 -t  /etc/wordpress/
# php-fpm7
nginx -g "daemon off;"
/usr/bin/supervisord -c /etc/supervisord.conf
