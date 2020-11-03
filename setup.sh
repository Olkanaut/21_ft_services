#!/bin/bash

minikube start --driver=virtualbox --memory='3900MB' --disk-size='10000MB' ;

minikube addons enable dashboard ;
minikube addons enable metallb ;
minikube addons enable metrics-server ;
echo "__________________________________ addons enabled <<<\n" ;
echo "__________________________________ metallb" ;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/namespace.yaml ;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/metallb.yaml ;
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" ;
kubectl apply -f ./srcs/metallb/metallb.yaml ;

eval $(minikube docker-env)

echo "__________________________________ NGINX"
kubectl create -f ./srcs/nginx/nginx-service.yaml
sleep 5
TEMP=$(kubectl get svc nginx-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
echo "${TEMP}" ;
docker build -t nginx-image --build-arg IP=${TEMP} ./srcs/nginx
docker build -t nginx-image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx-deployment.yaml
TEMPA=$(kubectl get svc nginx-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
echo "${TEMPA}" ;

echo "__________________________________ MySQL"
# kubectl create -f ./srcs/mysql/mysql-service.yaml
docker build -t mysql-image ./srcs/mysql
# kubectl apply -f ./srcs/mysql/mysql-deployment.yaml
# kubectl apply -f ./srcs/mysql/mysql-pv.yaml
# kubectl apply -f ./srcs/mysql/mysql-pvc.yaml
kubectl apply -f ./srcs/mysql/mysql-depl-service-pv-pvc.yaml

echo "__________________________________ WORDPRESS"
# kubectl create -f ./srcs/wordpress/wordpress-service.yaml
docker build -t wordpress-image ./srcs/wordpress > /dev/null
# kubectl apply -f ./srcs/wordpress/wordpress-deployment.yaml
kubectl apply -f ./srcs/wordpress/wordpress-depl-service.yaml
TEMP=$(kubectl get svc wordpress-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
echo "${TEMP}" ;

echo "__________________________________ phpMyAdmin"
docker build -t phpmyadmin-image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin-depl-service.yaml


echo "__________________________________ FTPS"
# kubectl create -f ./srcs/ftps/ftps-service.yaml
docker build -t ftps-image ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps-deployment.yaml
# kubectl apply -f ./srcs/ftps/ftps-pv.yaml
# kubectl apply -f ./srcs/ftps/ftps-pvc.yaml
TEMP=$(kubectl get svc ftps-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
echo "${TEMP}" ;

echo "__________________________________ InfluxDB"
docker build -t influxdb-image ./srcs/influxdb
# kubectl apply -f ./srcs/influxdb/influxdb-depl-service.yaml
# kubectl apply -f ./srcs/influxdb/influxdb-pv-pvc.yaml

# kubectl apply -f ./srcs/influxdb/influxdb-service.yaml
kubectl apply -f ./srcs/influxdb/influxdb-pv-pvc.yaml
kubectl apply -f ./srcs/influxdb/influxdb-configmap.yaml
kubectl apply -f ./srcs/influxdb/influxdb-depl-service.yaml
# kubectl apply -f ./srcs/influxdb/influxdb-deployment.yaml


echo "__________________________________ Telegraf"
docker build -t telegraf-image ./srcs/telegraf
kubectl apply -f ./srcs/telegraf/telegraf-secret.yaml
kubectl apply -f ./srcs/telegraf/telegraf-depl-service.yaml

echo "__________________________________ Grafana"
docker build -t grafana-image ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana-depl-service.yaml
