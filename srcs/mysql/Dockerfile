FROM		alpine:latest

RUN			apk update && apk upgrade
RUN			apk add mysql mysql-client supervisor
# RUN			apk add openrc

RUN			mkdir -p /run/mysql && chown -R mysql:mysql /run/mysql

COPY		/createdb.sql /tmp/
# COPY		/wordpress.sql /tmp/wordpress.sql
COPY		/my.cnf /etc/my.cnf
COPY		/start.sh /tmp/
RUN			chmod +x /tmp/start.sh

EXPOSE		3306
# VOLUME		/var/lib/mysql

ENTRYPOINT	["/tmp/start.sh"]










# # kubectl create secret generic mysql-pass --from-literal=password=admin
# # kubectl get secrets
# # kubectl create -f mysql-secret.yaml

# # echo && cat /dev/urandom | env LC_CTYPE=C tr -dc [:alnum] | head -c 15 | base64 && echo
# kubectl create -f secret.yaml

# kubectl create -f pvc.yaml
# kubectl create -f pv.yaml

# # kubectl describe pv persistent-storage
# # kubectl describe pv persistent-storage-wp
# kubectl create -f mysql-deployment.yaml

# kubectl create -f wordpress-deployment.yaml
# # kubectl create -f wp-depl.yaml

