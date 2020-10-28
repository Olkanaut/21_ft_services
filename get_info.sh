#!/bin/bash

minikube ip ;
# echo "${TEMP}" ;
kubectl get svc -o wide ;
kubectl get pods -o wide ;
minikube service nginx-service --url ;

# kubectl exec -it nginx-deployment-694d76f59f-sdldj -- sh
