# Services Chapter Report (ASTRA-1016)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1016
- Chapter/group: SERVICES
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `SERVICES`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- All control rows from the `SERVICES` sheet are included via authoritative scope filtering in `roles/cis_audit/tasks/services.yml`.
- Implemented control count: 28 controls (record type `control`, sheet `SERVICES`).
- Group-header/non-control rows are intentionally excluded from control evaluation.

## Audit Behavior
- Audit checks are read-only and offline-safe.
- No remediation actions were added.
- No package install/remove actions were added.
- No service restart/reload actions were added.
- No reboot actions were added.
- All audit checks use `changed_when: false`.

## Evidence Model
- Per-control `results` and `evidence` maps are generated for all SERVICES controls.
- Chapter summary fact: `cis_services_chapter_summary`.
- Runtime evidence sources are host-local inspection only (`service_facts`, `package_facts`, `ss -lntup`).

## OT Baseline Placeholders (Explicit)
- `MISSING_OT_BASELINE:approved_services_allowlist`
- `MISSING_OT_BASELINE:approved_service_port_exceptions`
- `MISSING_OT_BASELINE:approved_local_only_mta_baseline`
- `MISSING_OT_BASELINE:approved_network_listening_services`

## Validation
- `./scripts/validate_prd.sh` executed successfully for this change set.
- Local playbook syntax/runtime validation remains limited when `ansible-playbook` is unavailable on this workstation.

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
