# Migration from 4G PCC (PCRF) to 5G PCF

This document explains how traditional 4G PCC concepts map into the 5G Service-Based Architecture (SBA).

## 4G PCC (PCRF-centric)

In 4G EPC:

- **PCRF (Policy and Charging Rules Function)** is the central policy engine.
- **PCEF**, usually in the PGW, enforces the policy.
- **Diameter Gx**: PCRF ↔ PCEF for policy and QoS rules.
- **Diameter Gy**: PCEF ↔ OCS for online charging.
- **SPR/HSS**: Subscription profile repository for policy decisions.

## 5G PCF (Service-Based Architecture)

In 5G:

- **PCF (Policy Control Function)** replaces PCRF conceptually.
- **SMF** takes over many PCEF-like responsibilities and installs rules in the UPF.
- **N7**: PCF ↔ SMF for policy decisions (service-based interface).
- **CHF (Charging Function)** and related services handle charging in a more flexible way.
- Subscriber data is provided through **UDM/UDR**.

## How This Lab Reflects the Evolution

- PCF in this lab provides policy decisions for PDU sessions via N7 toward SMF.
- SMF configures UPF with PFCP rules (similar to PCEF in 4G).
- Policies are defined in `pcf-config.yaml`, demonstrating how QoS and slice-aware behavior can be configured without referring to legacy Gx/Gy interfaces.

This lab helps visualize the **conceptual continuity** between 4G PCRF-based PCC and 5G PCF-based policy control, while emphasizing the move toward **HTTP-based service interfaces** and microservice-oriented NFs.
