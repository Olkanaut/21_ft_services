#!/bin/bash

minikube ip ;

echo "____________________deployments____________________"
kubectl get deployments ;
echo "_____________________services______________________"
kubectl get svc -o wide ;
echo "_______________________pods________________________"
kubectl get pods -o wide ;

echo "________________________wp_________________________"
minikube service wordpress-service --url ;
echo $(kubectl get svc wordpress-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")

echo "_______________________ftps________________________"
minikube service ftps-service --url ;
echo $(kubectl get svc ftps-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")

echo "________________________pma________________________"
minikube service wordpress-service --url ;
echo $(kubectl get svc phpmyadmin-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")

echo "_______________________nginx_______________________"
minikube service nginx-service --url ;
echo $(kubectl get svc nginx-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")

echo "______________________grafana______________________"
minikube service grafana-service --url ;
echo $(kubectl get svc grafana-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")