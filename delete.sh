#!/bin/bash

kubectl delete deployment ftps-deployment
docker rmi ftps-image

kubectl delete -f grafana-depl-service
kubectl delete -f grafana-config
docker rmi grafana-image

kubectl delete -f telegraf-depl-service
kubectl delete -f telegraf-secret
docker rmi telegraf-image

kubectl delete -f nginx-deployment
kubectl delete -f nginx-service
docker rmi nginx-image

kubectl delete -f influxdb-depl-service
kubectl delete -f influxdb-configmap
kubectl delete -f influxdb-pv-pvc
docker rmi grafana-image
