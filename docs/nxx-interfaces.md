# 5G Core Nxx Interfaces

This lab provides a simplified implementation of the core 5G SA Nxx interfaces.

| Interface | Role | Example in Lab |
|----------|------|-----------------|
| N1 | NAS signaling UE ↔ AMF | UERANSIM UE registration |
| N2 | gNB ↔ AMF | NGAP signaling (registration, PDU session setup) |
| N3 | gNB ↔ UPF | GTP-U user plane traffic |
| N4 | SMF ↔ UPF | PFCP rules and session control |
| N7 | PCF ↔ SMF | Policy and QoS decisions |
| N8 | AMF ↔ UDM/AUSF | Authentication and subscription data |
| N10 | SMF ↔ UDM | Session data operations |
| N11 | AMF ↔ SMF | PDU session management |
| Nnrf | All NFs ↔ NRF | NF registration and discovery |

The corresponding configuration files in `k8s/*/` should reflect these relationships through NF addresses and URIs.
