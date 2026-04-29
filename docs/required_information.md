# Required Information

Task `ASTRA-0004A` normalized the required-information checklist to `canonical-required-information-v1`.

Groups:

- `host_identity`: 11 items
- `network`: 11 items
- `domain_and_authentication`: 12 items
- `offline_package_management`: 10 items
- `services_and_ports`: 14 items
- `logging_and_audit`: 7 items
- `filesystem`: 6 items
- `ssh`: 6 items
- `remediation_safety`: 8 items
- `reporting`: 4 items

Production values are not stored in this repository. Missing values must block remediation and may block selected audits where the information is required to avoid unsafe OT assumptions.

Key blockers before remediation include approved services and ports, must-not-stop services, SSH source allowlists, offline package source details, maintenance window, rollback or snapshot procedure, SIEM/logging destinations, and engineer approver.
