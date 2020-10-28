FROM		alpine:latest

RUN			apk update && apk upgrade

RUN			apk add nginx
RUN			apk add openssl
RUN			apk add openssh
RUN			apk add supervisor
RUN			apk add openrc
# ARG			IP

VOLUME		[ "/sys/fs/cgroup" ]
RUN			mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx
RUN			rm -f /etc/nginx/conf.d/*.conf
COPY		./nginx.conf /etc/nginx/conf.d/default.conf

COPY		./mycert.crt /etc/nginx/ssl/cert.crt
COPY		./mykey.key /etc/nginx/ssl/key.key

# RUN			openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
# 			-keyout /etc/ssl/private/mykey.key \
# 			-out /etc/ssl/certs/mycert.crt \
# 			-subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=bshang"

# RUN			sed -i "s%olololo%${IP}%" /etc/nginx/conf.d/default.conf
RUN			echo "daemon off;" >> /etc/nginx/nginx.conf

COPY		./supervisord.conf /etc/supervisord.conf
RUN			chmod +rw /etc/supervisord.conf
RUN			echo -e "bshangsmatePa$$word10\nbshangsmatePa$$word10" | adduser bshang

COPY		./start.sh /tmp/start.sh
RUN			chmod u+x /tmp/start.sh

EXPOSE		443 80

ENTRYPOINT	["/tmp/start.sh"]