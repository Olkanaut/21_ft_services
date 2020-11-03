FROM		alpine:latest

RUN			apk update && apk upgrade
RUN			apk add php7 \
			php7-mysqli \
			php7-json \
			php7-mbstring \
			php7-session \
			php7-fpm \
			php7-zlib

RUN			apk add nginx openrc supervisor


RUN			mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx
#
RUN			adduser -D -g 'www' www
RUN			mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www
COPY		nginx.conf /etc/nginx/conf.d/default.conf
#^ added


ADD			https://wordpress.org/latest.tar.gz /etc/
RUN			tar -xf /etc/latest.tar.gz -C /etc > /dev/null && rm -f /latest.tar.gz > /dev/null
RUN			mv /etc/wordpress /www/


COPY		supervisord.conf /etc/supervisord.conf
# COPY		./wp-config.php /etc/wordpress/
COPY		./wp-config.php /www/wordpress/
COPY		./start.sh /tmp/start.sh
RUN			chmod +x /tmp/start.sh

EXPOSE		5050

ENTRYPOINT	["/tmp/start.sh"]



# RUN			mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx
# ADD			https://wordpress.org/latest.tar.gz /etc/
# RUN			tar -xvf /etc/latest.tar.gz -C /etc > /dev/null && rm -f /etc/latest.tar.gz > /dev/null

# COPY		./wp-config.php /etc/wordpress/
# COPY		./start.sh /tmp/start.sh
# RUN			chmod +x /tmp/start.sh

# EXPOSE		5050

# ENTRYPOINT	["/tmp/start.sh"]