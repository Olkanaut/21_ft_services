#!/bin/bash

minikube ip ;
# echo "${TEMP}" ;
echo "____________________deployments____________________"
kubectl get deployments ;
echo "_____________________services______________________"
kubectl get svc -o wide ;
echo "_______________________pods________________________"
kubectl get pods -o wide ;

# echo "_____________________nginx-ip______________________"
# minikube service nginx-service --url ;
# echo $(kubectl get svc nginx-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
# kubectl exec -it nginx-deployment-694d76f59f-sdldj -- sh

echo "_________________________wp__________________________"
minikube service wordpress-service --url ;
echo $(kubectl get svc wordpress-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")

echo "________________________ftps_________________________"
minikube service ftps-service --url ;
echo $(kubectl get svc ftps-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")

echo "______________________telegraf_______________________"
minikube service telegraf-service --url ;
echo $(kubectl get svc telegraf-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
