# PCF Policy Design

The Policy Control Function (PCF) provides policy and QoS decisions for PDU sessions.

## Policy Examples

- **Per DNN policy**: Different QoS and access rules for `internet` vs `enterprise` DNNs.
- **Slice-based policy**: Different QoS parameters per S-NSSAI (slice/service type).
- **UE-specific policy**: Rules for specific subscribers based on SUPI/IMSI.

## Example Policy Use Cases

1. **Gold vs Silver subscribers**  
   - Gold: Higher guaranteed bit-rate (GBR), lower latency.  
   - Silver: Best-effort service with lower priority.

2. **Enterprise slice**  
   - Traffic from UEs using enterprise S-NSSAI mapped to a specific UPF and DNN.

PCF policies in this lab are defined via configuration in `k8s/pcf/pcf-config.yaml`.
