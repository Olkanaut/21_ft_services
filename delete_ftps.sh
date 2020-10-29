#!/bin/bash

kubectl delete deployment ftps-deployment
kubectl delete service ftps-service
docker rmi ftps-image