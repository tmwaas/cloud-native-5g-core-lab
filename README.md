# Cloud-Native 5G Core Lab
*A hands-on implementation of a 5G Standalone Core using containerized microservices on Kubernetes*

This project demonstrates a **cloud-native 5G Standalone (5G SA) Core**, deployed on a local **Kubernetes** cluster using containerized NFs (AMF, SMF, UPF, AUSF, UDM, NRF, and PCF). The goal is to provide a realistic, operator-style environment for studying 5G Core architecture, call flows, policy control, slicing fundamentals, and the evolution from 4G EPC to cloud-native 5G SBA (Service-Based Architecture).

This project can be used for:

- Learning and experimenting with **real 5G Core network functions**
- Verifying end-to-end **PDU session establishment**
- Understanding **N1/N2/N3/N4/N7/N8/N10/N11/Nnrf** interfaces
- Testing **policy control** with PCF
- Simulating **network slices**
- Practicing **Kubernetes deployments** of telco workloads
- Preparing for **Packet Core Engineer / 5G Core Engineer** interviews

## Architecture Overview

Each 5G Core Network Function (NF) runs as an independent **microservice** (Kubernetes Deployment):

```text
+-----------+        +-----------+        +-----------+
|   gNodeB  | <----> |    AMF    | <----> |    UDM    |
| (UERANSIM)|   N2   |           |   N8   |           |
+-----------+        +-----------+        +-----------+
       |                   |                    |
       | N3                | N11                | N10
       v                   v                    v
+-----------+        +-----------+        +-----------+
|    UPF    | <----> |    SMF    | <----> |    PCF    |
|           |   N4   |           |   N7   |           |
+-----------+        +-----------+        +-----------+
                           |
                           | Nnrf
                           v
                     +-----------+
                     |    NRF    |
                     +-----------+
```

The **UE & gNB** are simulated using **UERANSIM**.

## Repository Structure

```text
cloud-native-5g-core-lab/
├─ README.md
├─ docs/
│  ├─ architecture-overview.md
│  ├─ call-flows-5gsa.md
│  ├─ nxx-interfaces.md
│  ├─ pcf-policy-design.md
│  ├─ slicing-overview.md
│  └─ pcc-to-pcf-evolution.md
├─ diagrams/
│  ├─ 5g_core.drawio
│  ├─ nxx_interfaces.png
│  ├─ pdu_session_flow.png
│  └─ slicing_overview.png
├─ k8s/
│  ├─ amf/
│  ├─ smf/
│  ├─ upf/
│  ├─ ausf/
│  ├─ udm/
│  ├─ nrf/
│  ├─ pcf/
│  └─ ueransim/
├─ scripts/
│  ├─ deploy_core.sh
│  ├─ deploy_ueransim.sh
│  ├─ test_pdu_session.sh
│  └─ capture_traffic.sh
└─ .github/workflows/
   └─ ci.yaml
```

## Getting Started

### 1. Prerequisites

- Kubernetes (kind, minikube, or k3d)
- Docker
- kubectl
- (Optional) Helm
- (Optional) Wireshark / tcpdump for Diameter/NAS trace analysis

### 2. Create Kubernetes Cluster

```bash
kind create cluster --name 5g-core --config kind-config.yaml
```

### 3. Deploy the 5G Core Components

```bash
./scripts/deploy_core.sh
```

This script deploys:

- AMF
- SMF
- UPF
- AUSF
- UDM
- NRF
- PCF

All NFs register dynamically to **NRF** using the **Nnrf** interface.

### 4. Deploy gNB & UE (UERANSIM)

```bash
./scripts/deploy_ueransim.sh
```

Check logs:

```bash
kubectl logs deploy/ueransim-ue
```

### 5. Test PDU Session

```bash
./scripts/test_pdu_session.sh
```

You should see successful UE registration and PDU session establishment.

## Skills Demonstrated

- AMF, SMF, UPF, AUSF, UDM, NRF, PCF
- Kubernetes-based microservices for 5G Core
- 5G SA call flows (N1–N11, Nnrf)
- PCF-based policy control
- Network slicing fundamentals
- QoS configuration
- UE/gNB simulation using UERANSIM
- PCC → PCF migration concepts
- Telco workload orchestration on Kubernetes

## Author

**Thomas Waas**  
Mobile Network & DevOps Engineer  
GitHub: https://github.com/tmwaas
