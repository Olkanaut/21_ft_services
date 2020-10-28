#!/bin/bash

minikube ip ;
# echo "${TEMP}" ;
kubectl get deployments ;
kubectl get svc -o wide ;
kubectl get pods -o wide ;
# minikube service nginx-service --url ;

# echo $(kubectl get svc nginx-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
# kubectl exec -it nginx-deployment-694d76f59f-sdldj -- sh

# minikube service wordpress-service --url ;
echo $(kubectl get svc wordpress-service -o=custom-columns='m:status.loadBalancer.ingress' | sed -n 2p | tr -d "[maip:]")
