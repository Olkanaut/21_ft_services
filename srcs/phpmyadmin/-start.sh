#!/bin/sh

php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin
php-fpm7
nginx -g "daemon off;"
/usr/bin/supervisord -c /etc/supervisord.conf
