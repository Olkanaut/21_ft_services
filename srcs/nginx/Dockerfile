FROM		alpine:latest

RUN			apk update && apk upgrade
RUN			apk add nginx openssl openssh supervisor openrc > /dev/null

VOLUME		[ "/sys/fs/cgroup" ]
RUN			mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx

COPY		./nginx.conf /etc/nginx/.

COPY		./mycert.crt /etc/nginx/ssl/cert.crt
COPY		./mykey.key /etc/nginx/ssl/key.key

COPY		./supervisord.conf /etc/supervisord.conf
RUN			chmod +rw /etc/supervisord.conf
RUN			echo -e "bshangsPassword10\nbshangsPassword10\n" | adduser bshang

COPY		./start.sh /tmp/start.sh
RUN			chmod u+x /tmp/start.sh

EXPOSE		443 80 22

ENTRYPOINT	sh /tmp/start.sh
