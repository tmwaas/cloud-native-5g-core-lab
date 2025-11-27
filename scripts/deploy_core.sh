#!/usr/bin/env bash
set -e

echo "[INFO] Deploying 5G Core NFs..."

for nf in amf smf upf ausf udm nrf pcf; do
  echo "[INFO] Applying manifests for ${nf}"
  kubectl apply -f k8s/${nf}/
done

echo "[INFO] Waiting for pods to be ready..."
kubectl wait --for=condition=Available deployment/amf --timeout=120s || true
kubectl get pods -o wide
