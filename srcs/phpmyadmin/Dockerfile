FROM		alpine:latest

RUN			apk update && apk upgrade

RUN			apk add vim
RUN			apk add php php7-mbstring php7-session php7-json php7-mysqli

RUN			mkdir -p /usr/share/webapps/
RUN			wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN			tar zxvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN			mv phpMyAdmin-5.0.4-all-languages /usr/share/webapps/phpmyadmin && \
			rm phpMyAdmin-5.0.4-all-languages.tar.gz

COPY		./config.inc.php /usr/share/webapps/phpmyadmin/
COPY		./start.sh /tmp/start.sh
# RUN			chmod u+x /tmp/start.sh

EXPOSE		5000

ENTRYPOINT	["/tmp/start.sh"]