#!/bin/bash

export MINIKUBE_HOME=/Users/bshang/goinfre/.minikube ;
export PATH=$MINIKUBE_HOME/bin:$PATH ;
export KUBECONFIG=$MINIKUBE_HOME/.kube/config ;
export KUBE_EDITOR="code -w" ;
minikube start --driver=virtualbox --disk-size=5000MB;

minikube addons enable dashboard ;
minikube addons enable metallb ;
minikube addons enable metrics-server ;
echo "__________________________________ addons enabled <<<\n" ;

echo "__________________________________ metallb" ;
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" ;
kubectl apply -f ./srcs/metallb/metallb.yaml ;

eval $(minikube docker-env)

echo "__________________________________ NGINX"
kubectl create -f ./srcs/nginx/nginx-service.yaml
docker build -t nginx-image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx-deployment.yaml

echo "__________________________________ MySQL"
docker build -t mysql-image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql-pv-pvc.yaml
kubectl apply -f ./srcs/mysql/mysql-secret.yaml
kubectl apply -f ./srcs/mysql/mysql-deployment.yaml

echo "__________________________________ phpMyAdmin"
docker build -t phpmyadmin-image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin-depl-service.yaml

echo "__________________________________ WORDPRESS"
docker build -t wordpress-image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress-depl-service.yaml

echo "__________________________________ FTPS"
docker build -t ftps-image ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps-deployment.yaml

echo "__________________________________ InfluxDB"
docker build -t influxdb-image ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb-pv-pvc.yaml
kubectl apply -f ./srcs/influxdb/influxdb-configmap.yaml
kubectl apply -f ./srcs/influxdb/influxdb-depl-service.yaml

echo "__________________________________ Telegraf"
docker build -t telegraf-image ./srcs/telegraf
kubectl apply -f ./srcs/telegraf/telegraf-secret.yaml
kubectl apply -f ./srcs/telegraf/telegraf-depl-service.yaml

echo "__________________________________ Grafana"
docker build -t grafana-image ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana-config.yaml
kubectl apply -f ./srcs/grafana/grafana-depl-service.yaml
