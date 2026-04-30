# Network Devices Chapter Report (ASTRA-1017)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1017
- Chapter/group: Network Devices
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `Network Devices`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- All control rows from the `Network Devices` sheet are included via authoritative scope filtering in `roles/cis_audit/tasks/network_devices.yml`.
- Implemented control count: 3 controls (record type `control`, sheet `Network Devices`).
- Group-header/non-control rows are intentionally excluded from control evaluation.

## Audit Behavior
- Audit checks are read-only and offline-safe.
- No remediation actions were added.
- No package install/remove actions were added.
- No service restart/reload actions were added.
- No reboot actions were added.
- All audit checks use `changed_when: false`.

## Evidence Model
- Per-control `results` and `evidence` maps are generated for all Network Devices controls.
- Chapter summary fact: `cis_network_devices_chapter_summary`.
- Runtime evidence sources are host-local inspection only (`ip -details link show`, `systemctl list-unit-files --type=service --no-pager --no-legend`).

## OT Baseline Placeholders (Explicit)
- `MISSING_OT_BASELINE:ipv6_required_status`
- `MISSING_OT_BASELINE:approved_wireless_interfaces`
- `MISSING_OT_BASELINE:approved_bluetooth_services`
- `MISSING_OT_BASELINE:approved_network_device_exceptions`

## Validation
- `./scripts/validate_prd.sh` executed successfully for this change set.
- Local playbook syntax/runtime validation remains limited when `ansible-playbook` is unavailable on this workstation.

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
