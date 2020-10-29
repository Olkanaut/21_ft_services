#!/bin/bash

minikube ip ;
# echo "${TEMP}" ;
echo "____________________deployments____________________"
kubectl get deployments ;
echo "_____________________services______________________"
kubectl get svc -o wide ;
echo "_______________________pods________________________"
kubectl get pods -o wide ;
# minikube service nginx-service --url ;

# echo $(kubectl get svc nginx-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
# kubectl exec -it nginx-deployment-694d76f59f-sdldj -- sh

echo "_______________________wp-ip________________________"
minikube service wordpress-service --url ;
echo $(kubectl get svc wordpress-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")

echo "______________________ftps-ip_______________________"
minikube service ftps-service --url ;
echo $(kubectl get svc ftps-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
