#!/bin/bash

minikube start --driver=virtualbox --memory='3900MB' --disk-size='10000MB' ;

minikube addons enable dashboard ;
minikube addons enable metallb ;
echo "__________________________________ addons enabled <<<\n" ;

eval $(minikube docker-env)

echo "__________________________________ metallb" ;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/namespace.yaml ;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/metallb.yaml ;
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" ;
kubectl apply -f ./srcs/metallb/metallb.yaml ;

echo "__________________________________ NGINX"
kubectl create -f ./srcs/nginx/nginx-service.yaml
sleep 15
# N_IP=$(kubectl get svc nginx-service -o=custom-columns='DATA:status.loadBalancer.ingress' | sed -n 2p | cut -d ":" -f2 | tr -d "]") ;
# echo "${N_IP}" ;
TEMP=$(kubectl get svc nginx-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
echo "${TEMP}" ;
# docker build -t nginx-image --build-arg IP=${TEMP} ./srcs/nginx ;
docker build -t nginx-image ./srcs/nginx ;
kubectl apply -f ./srcs/nginx/nginx-deployment.yaml ;
TEMP=$(kubectl get svc nginx-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
echo "${TEMP}" ;
