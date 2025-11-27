#!/usr/bin/env bash
set -e

echo "[INFO] Checking logs for UE registration and PDU session..."

kubectl logs deployment/ueransim-ue --tail=100 || echo "UE logs not available"
