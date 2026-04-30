# Network Kernel Modules Chapter Report (ASTRA-1014)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1014
- Chapter/group: Network Kernel Modules
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `Network Kernel Modules`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- 3.2.1 Ensure dccp kernel module is not available
- 3.2.2 Ensure tipc kernel module is not available
- 3.2.3 Ensure rds kernel module is not available
- 3.2.4 Ensure sctp kernel module is not available
- 3.3.1 Ensure ip forwarding is disabled
- 3.3.2 Ensure packet redirect sending is disabled
- 3.3.3 Ensure bogus icmp responses are ignored
- 3.3.4 Ensure broadcast icmp requests are ignored
- 3.3.5 Ensure icmp redirects are not accepted
- 3.3.6 Ensure secure icmp redirects are not accepted
- 3.3.7 Ensure reverse path filtering is enabled
- 3.3.8 Ensure source routed packets are not accepted
- 3.3.9 Ensure suspicious packets are logged
- 3.3.10 Ensure tcp syn cookies is enabled
- 3.3.11 Ensure ipv6 router advertisements are not accepted

## Skipped Controls
- None (all control rows from the `Network Kernel Modules` sheet were implemented).
- Group-header/non-control rows (`3.2`, `3.3`) from the sheet were intentionally not implemented as controls.

## Offline and Safety Constraints
- No remediation actions were added.
- No package install/remove actions were added.
- No service restart/reload actions were added.
- No reboot actions were added.
- All audit checks are idempotent with `changed_when: false`.

## Evidence Model
- Per-control evidence/result facts are generated for all implemented controls.
- Chapter summary fact: `cis_network_kernel_modules_chapter_summary`.
- Runtime commands are local OS inspection only (`modprobe`, `lsmod`, `grep`, `sysctl`).

## OT Baseline Placeholders (Explicit)
- `MISSING_OT_BASELINE:approved_router_forwarding_exceptions`
- `MISSING_OT_BASELINE:approved_network_kernel_module_exceptions`
- `MISSING_OT_BASELINE:approved_network_sysctl_exceptions`

## Temporary/Default Baseline Notes
- Router-forwarding exceptions baseline is intentionally left as an OT placeholder and must be approved before any future remediation.
- Kernel module exceptions baseline is intentionally left as an OT placeholder and must be approved before any future remediation.
- Network sysctl exceptions baseline is intentionally left as an OT placeholder and must be approved before any future remediation.

## Validation
- `./scripts/validate_prd.sh` executed successfully for this change set.
- Local playbook syntax/runtime validation remains limited when `ansible-playbook` is unavailable on this workstation.

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
