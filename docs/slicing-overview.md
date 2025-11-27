# Network Slicing Overview

This lab includes a basic view of network slicing to illustrate how 5G SA allows slice-aware policy and QoS.

## Key Concepts

- **S-NSSAI**: Single Network Slice Selection Assistance Information (SST + SD).
- **SST**: Slice/Service Type (e.g., 1 = eMBB).
- **SD**: Slice Differentiator (identifies a specific slice instance).

## Example Slices in the Lab

- **eMBB Default Slice**  
  - SST = 1, SD = 010203  
  - Used for standard mobile broadband traffic.

- **Enterprise Slice**  
  - SST = 1, SD = 112233  
  - Used for enterprise/IoT traffic with different QoS.

In a full deployment, each slice could map to:

- A different set of UPFs
- Different QoS profiles
- Different DNNs

In this lab, we focus on the **configuration and policy aspects**, and show how PCF can apply different QoS rules based on slice selection.
