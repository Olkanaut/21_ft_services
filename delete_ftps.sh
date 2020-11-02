#!/bin/bash

# kubectl delete deployment ftps-deployment
# kubectl delete service ftps-service
# docker rmi ftps-image

kubectl delete deployment telegraf-deployment
kubectl delete service telegraf-service
docker rmi telegraf-image

kubectl delete deployment nginx-deployment
kubectl delete service nginx-service
docker rmi nginx-image