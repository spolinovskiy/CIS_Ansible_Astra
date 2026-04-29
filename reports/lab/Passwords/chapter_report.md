# Passwords Chapter Report (ASTRA-1008)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1008
- Chapter/group: Passwords
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `Passwords`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- 5.4.1.1 Ensure password expiration is configured
- 5.4.1.2 Ensure minimum password days is configured (Manual)
- 5.4.1.3 Ensure password expiration warning days is configured
- 5.4.1.4 Ensure strong password hashing algorithm is configured
- 5.4.1.5 Ensure inactive password lock is configured
- 5.4.1.6 Ensure all users last password change date is in the past

## Skipped Controls
- None (all Passwords control rows were implemented).
- Non-control group header rows from the sheet were intentionally not implemented.

## Manual Review Controls
- 5.4.1.2 is manual by title and requires engineer threshold confirmation.
- 5.4.1.4 requires approved hashing algorithm baseline when policy values are environment-specific.
- 5.4.1.6 requires approved exceptions baseline when future-last-change entries are present.

## Blocked Controls
- None at implementation time.
- Runtime execution may still be blocked by host-specific conditions (missing account files/tools) and will be reflected in registered evidence/results.

## High-Risk Controls
- Password policy/account-aging controls are authentication-critical; this task remains audit-only.

## Offline Assumptions
- No Internet access is required by this implementation.
- No package installation/removal is performed.
- No service restart/reload is performed.
- No file remediation is performed.

## OS Tested
- Controller-side implementation validation only on local workstation.
- No target Astra host execution evidence was collected in this task.

## Commands
- Runtime audit commands implemented in tasks:
- `grep` from `/etc/login.defs` and `/etc/pam.d/common-password`
- `useradd -D` for default inactive lock setting
- `awk` checks on `/etc/shadow` for last-change date validation

## Evidence Records
- 5.4.1.1-5.4.1.3: `cis_5_4_1_1_3_login_defs_cmd`, parsed value facts, per-control evidence/results
- 5.4.1.4: `cis_5_4_1_4_hashing_cmd`, `cis_pw_detected_hash_algorithms`, `cis_5_4_1_4_evidence`, `cis_5_4_1_4_result`
- 5.4.1.5: `cis_5_4_1_5_inactive_cmd`, `cis_5_4_1_5_evidence`, `cis_5_4_1_5_result`
- 5.4.1.6: `cis_5_4_1_6_future_change_cmd`, `cis_5_4_1_6_evidence`, `cis_5_4_1_6_result`
- Chapter summary: `cis_passwords_chapter_summary`

## OT Baseline Placeholders (Explicit)
- `MISSING_OT_BASELINE:approved_password_max_days`
- `MISSING_OT_BASELINE:approved_password_min_days`
- `MISSING_OT_BASELINE:approved_password_warn_days`
- `MISSING_OT_BASELINE:approved_password_inactive_days_max`
- `MISSING_OT_BASELINE:approved_password_hash_algorithms`
- `MISSING_OT_BASELINE:approved_last_change_exceptions`

## Result Summary
- Passwords chapter implementation is complete for audit-only control rows in scope.
- Local technical validation covered file/JSON/YAML correctness and PRD consistency.
- Ansible runtime validation was limited by local environment tooling availability (recorded below).

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
