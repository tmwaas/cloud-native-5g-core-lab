# 5G Core Architecture Overview

This lab implements a simplified but realistic **5G Standalone Core** using containerized Network Functions (NFs) on Kubernetes.

## Network Functions

- **AMF (Access and Mobility Management Function)**  
  Handles registration, connection management, handover, and NAS signaling (N1).

- **SMF (Session Management Function)**  
  Manages PDU sessions, IP address allocation, and traffic steering (N4 to UPF).

- **UPF (User Plane Function)**  
  Forwards user-plane traffic (GTP-U), enforces forwarding rules from SMF.

- **AUSF (Authentication Server Function)**  
  Performs 5G AKA authentication with the UE via AMF.

- **UDM (Unified Data Management)**  
  Stores subscription information, authentication data, and subscriber profiles.

- **NRF (Network Repository Function)**  
  Acts as a service registry for all NFs, enabling discovery and registration (Nnrf).

- **PCF (Policy Control Function)**  
  Makes policy decisions for QoS, charging, and access control, using N7 toward SMF.

## High-Level Architecture

```text
UE --- gNodeB --- AMF --- SMF --- UPF --- Data Network (DN)
              \       \    \
               \       \    +--> PCF
                \       +--------> UDM
                 +-----------------> NRF
```

All NFs run as individual Deployments in Kubernetes, and their configuration is externalized via ConfigMaps.

## Kubernetes Design Principles

- One NF per **Deployment**
- One or more Pods per NF (replicas)
- NF configuration stored in **ConfigMaps**
- NF services exposed internally via **ClusterIP Services**
- UERANSIM deployed in its own namespace or as part of the same cluster for simplicity

This structure mimics a microservice architecture and is directly transferable to a production-grade 5G Core deployment model.
