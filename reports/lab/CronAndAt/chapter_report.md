# ASTRA-1004 Chapter Report: Cron&At

## Scope
- Source scope: `linux_cis.xlsx` only.
- Implemented controls (rows only): `2.4.1.1` to `2.4.2.1` (9 controls).
- Group headers from sheet were not implemented as controls.
- Out-of-scope controls from CIS PDFs/docs/wiki were not implemented.

## Implementation
- Added include in `roles/cis_audit/tasks/main.yml`.
- Added audit-only tasks in `roles/cis_audit/tasks/cron_at.yml`.
- All tasks use `changed_when: false`.
- No remediation actions, no package install/remove, no service restart, no reboot.

## Evidence Model
- Per-control evidence and result facts are generated for all implemented controls.
- Chapter summary fact: `cis_cron_at_chapter_summary`.
- Mandatory placeholder markers are included in evidence for missing OT data.

## Missing Information Placeholders
- `MISSING_OT_BASELINE:cicd_or_ops_approved_cron_allowed_users`
- `MISSING_OT_BASELINE:cicd_or_ops_approved_at_allowed_users`
- `MISSING_OS_VALIDATION:cron_service_unit_name_for_target_astra_versions`

## Temporary/Default Baseline Notes
- Candidate cron service units default to `cron.service` and `crond.service` until Astra-version validation data is provided.
- Authorized users baselines for `cron.allow` and `at.allow` default to empty lists, which causes `manual_review_required` for user-list validation checks.
- These defaults are temporary placeholders and must be replaced by engineer-approved OT values before production use.

## Safety
- Audit-only behavior preserved (`audit_mode` compatible).
- Offline-safe behavior preserved (no internet, no external downloads).
- High-risk changes remain disabled by default.

## Validation
- PRD schema validation executed successfully.
- Local playbook syntax/runtime validation is limited because `ansible-playbook` is not available on this workstation.

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
