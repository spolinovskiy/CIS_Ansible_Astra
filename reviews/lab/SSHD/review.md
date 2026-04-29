# ASTRA-2005 Review: SSHD (ASTRA-1005)

## Verdict
- `pass`

## Review Scope
- Reviewed `roles/cis_audit/tasks/main.yml` and `roles/cis_audit/tasks/sshd.yml` for chapter inclusion, linux_cis scope lock, evidence/result structure, and audit-only behavior.
- Reviewed `reports/lab/SSHD/chapter_report.md` for control accounting, safety posture, and declared limitations/placeholders.
- Checked PRD alignment for task progression from implementation (`ASTRA-1005`) to review (`ASTRA-2005`).

## Scope/Safety/Quality Assessment
- Scope lock is respected: implemented control rows are limited to SSHD sheet control rows (`5.1.1` through `5.1.22`) from `linux_cis.xlsx`; no out-of-scope controls were added.
- Safety posture is appropriate for OT/offline stage: implementation is audit-only and does not perform remediation writes, package operations, service restarts, firewall changes, or reboots.
- Evidence model quality is acceptable: each control exports structured evidence and result facts; chapter summary fact aggregates full chapter output.
- Missing data is explicitly marked with placeholders for OT-approved baselines:
  - approved SSH access subnets/users/groups
  - approved ciphers/MACs/Kex
  - approved banner text source
  - approved idle/session/max settings

## Validation Limitation
- `ansible-playbook` is not available on the current workstation, so runtime execution and syntax-check via playbook runner could not be performed here.
- This review is based on static inspection and artifact consistency checks.

## Test/Default Service-Port Baseline (Temporary)
- Temporary default assumptions in SSHD checks are explicitly marked and are acceptable only for lab audit continuity.
- These assumptions must be replaced by engineer-approved environment values before production OT execution.

## Decision Notes
- No scope, safety, or quality blocker requiring rework was identified in this review pass.
