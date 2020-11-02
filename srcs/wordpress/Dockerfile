FROM		alpine:latest

RUN			apk update && apk upgrade

RUN			apk add php7 \
			php7-mysqli \
			php7-json \
			php7-mbstring \
			php7-session

RUN			mkdir -p /usr/share/webapps/

ADD			https://wordpress.org/latest.tar.gz /etc/
RUN			tar -xvf /etc/latest.tar.gz -C /etc > /dev/null && rm -f /etc/latest.tar.gz > /dev/null

COPY		./wp-config.php /etc/wordpress/
COPY		./start.sh /tmp/start.sh
RUN			chmod +x /tmp/start.sh

EXPOSE		5050

ENTRYPOINT	["/tmp/start.sh"]