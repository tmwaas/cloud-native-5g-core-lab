# 5G SA Call Flows

This document describes the main call flows validated in the lab.

## 1. Registration

1. UE sends **Registration Request** (N1 NAS) to AMF via gNB (N2).
2. AMF contacts **UDM** and **AUSF** for authentication over N8.
3. Authentication challenge/response is exchanged between UE and AUSF via AMF.
4. On success, UE is registered, and AMF updates UE context.

## 2. PDU Session Establishment

1. UE sends **PDU Session Establishment Request**.
2. AMF forwards the request to **SMF** over N11.
3. SMF selects **UPF** and allocates IP address for the UE.
4. SMF programs UPF via **N4** (PFCP rules).
5. SMF queries **PCF** over **N7** for policy and QoS decisions.
6. On success, AMF sends **PDU Session Establishment Accept** to UE.

## 3. User-Plane Traffic

- UE sends traffic toward the DN (Data Network).
- gNB forwards GTP-U packets to UPF (N3).
- UPF forwards packets toward DN according to rules installed by SMF.

For detailed message sequences, see `diagrams/pdu_session_flow.png`.
