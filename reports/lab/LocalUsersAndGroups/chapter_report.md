# Local Users and Groups Chapter Report (ASTRA-1006)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1006
- Chapter/group: Local Users and Groups
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `Local Users and Groups`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- 7.2.1 Ensure accounts in /etc/passwd use shadowed passwords
- 7.2.2 Ensure /etc/shadow password fields are not empty
- 7.2.3 Ensure all groups in /etc/passwd exist in /etc/group
- 7.2.4 Ensure shadow group is empty
- 7.2.5 Ensure no duplicate UIDs exist
- 7.2.6 Ensure no duplicate GIDs exist
- 7.2.7 Ensure no duplicate user names exist
- 7.2.8 Ensure no duplicate group names exist
- 7.2.9 Ensure local interactive user home directories are configured
- 7.2.10 Ensure local interactive user dot files access is configured

## Skipped Controls
- None (all Local Users and Groups control rows were implemented).
- Non-control group header rows from the sheet were intentionally not implemented.

## Manual Review Controls
- 7.2.5, 7.2.6, 7.2.7, 7.2.8 require approved duplicate-ID/name exception baselines when duplicates are present.
- 7.2.9 requires approved nonlocal/missing-home exception baseline when missing home directories are present.
- 7.2.10 requires approved dotfile exemption baseline when noncompliant dotfiles are present.

## Blocked Controls
- None at implementation time.
- Runtime execution may still be blocked by host-specific conditions (missing account files/home paths) and will be reflected in registered evidence/results.

## High-Risk Controls
- Local account state controls are authentication/authorization sensitive; this task remains audit-only.

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
- `awk` checks over `/etc/passwd`, `/etc/shadow`, `/etc/group`
- `getent group` lookups for passwd GID mapping
- `stat` checks for interactive-user home directory existence
- `find` checks for interactive-user dotfile modes

## Evidence Records
- 7.2.1: `cis_7_2_1_passwd_shadow_cmd`, `cis_7_2_1_evidence`, `cis_7_2_1_result`
- 7.2.2: `cis_7_2_2_shadow_empty_cmd`, `cis_7_2_2_evidence`, `cis_7_2_2_result`
- 7.2.3: `cis_7_2_3_passwd_group_match_cmd`, `cis_7_2_3_evidence`, `cis_7_2_3_result`
- 7.2.4: `cis_7_2_4_shadow_group_cmd`, `cis_7_2_4_evidence`, `cis_7_2_4_result`
- 7.2.5-7.2.8: `cis_7_2_5_8_dupes_cmd`, per-control evidence/result facts
- 7.2.9: `cis_7_2_9_interactive_homes_cmd`, `cis_7_2_9_home_stats`, `cis_7_2_9_evidence`, `cis_7_2_9_result`
- 7.2.10: `cis_7_2_10_dotfiles_cmd`, `cis_7_2_10_evidence`, `cis_7_2_10_result`
- Chapter summary: `cis_local_users_groups_chapter_summary`

## OT Baseline Placeholders (Explicit)
- `MISSING_OT_BASELINE:approved_duplicate_uid_exceptions`
- `MISSING_OT_BASELINE:approved_duplicate_gid_exceptions`
- `MISSING_OT_BASELINE:approved_duplicate_user_exceptions`
- `MISSING_OT_BASELINE:approved_duplicate_group_exceptions`
- `MISSING_OT_BASELINE:approved_nonlocal_home_exceptions`
- `MISSING_OT_BASELINE:approved_dotfile_exemptions`

## Result Summary
- Local Users and Groups chapter implementation is complete for audit-only control rows in scope.
- Local technical validation covered file/JSON/YAML correctness and PRD consistency.
- Ansible runtime validation was limited by local environment tooling availability (recorded below).

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
