FROM		alpine:latest

RUN			apk update && apk upgrade

RUN			apk add vsftpd openssl
RUN			echo -e "bshangsPa$$word10\nbshangsPa$$word10" | adduser bshang

# RUN			openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
# 			-keyout /etc/ssl/private/myftpskey.key \
# 			-out /etc/ssl/certs/myftpscert.crt \
# 			-subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=bshang"
COPY		./myftpcert.crt /etc/ssl/certs/.
COPY		./myftpkey.key /etc/ssl/private/.

RUN echo testololo > /tmp/test_file_root
RUN echo testololo > /home/bshang/test_file

COPY		./vsftpd.conf /etc/vsftpd/myvsftpd.conf
COPY		./start.sh /tmp/.

EXPOSE 21 20 21000

ENTRYPOINT	sh /tmp/start.sh
