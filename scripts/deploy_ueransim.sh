#!/usr/bin/env bash
set -e

echo "[INFO] Deploying UERANSIM gNB and UE..."

kubectl apply -f k8s/ueransim/gnb.yaml
kubectl apply -f k8s/ueransim/ue.yaml

kubectl get pods -l app=ueransim-gnb
kubectl get pods -l app=ueransim-ue
