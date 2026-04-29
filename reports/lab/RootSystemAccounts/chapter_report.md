# Root&System Accounts Chapter Report (ASTRA-1009)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1009
- Chapter/group: Root&System Accounts
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `Root&System Accounts`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- 5.4.2.1 Ensure root is the only UID 0 account
- 5.4.2.2 Ensure root is the only GID 0 account
- 5.4.2.3 Ensure group root is the only GID 0 group
- 5.4.2.4 Ensure root account access is controlled
- 5.4.2.5 Ensure root path integrity
- 5.4.2.6 Ensure root user umask is configured
- 5.4.2.7 Ensure system accounts do not have a valid login shell
- 5.4.2.8 Ensure accounts without a valid login shell are locked
- 5.4.3.1 Ensure nologin is not listed in /etc/shells
- 5.4.3.2 Ensure default user shell timeout is configured
- 5.4.3.3 Ensure default user umask is configured

## Skipped Controls
- None (all Root&System Accounts control rows were implemented).
- Non-control group header rows from the sheet were intentionally not implemented.

## Manual Review Controls
- 5.4.2.4 requires environment policy confirmation for root access controls.
- 5.4.2.5 requires approved OT exceptions baseline for root PATH entries.
- 5.4.2.6 requires approved root umask baseline confirmation.
- 5.4.2.7 requires approved exception baseline for system accounts with valid login shells.
- 5.4.2.8 requires approved exception baseline for non-login-shell accounts that are not locked.
- 5.4.3.2 requires approved shell timeout baseline confirmation.
- 5.4.3.3 requires approved default umask baseline confirmation.

## Blocked Controls
- None at implementation time.
- Runtime execution may still be blocked by host-specific conditions (missing account files/tools) and will be reflected in registered evidence/results.

## High-Risk Controls
- Root/system account controls are authentication-critical; this task remains audit-only.

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
- `awk` on `/etc/passwd`, `/etc/group`, `/etc/shadow`
- `grep` on `/etc/shells`, `/etc/profile`, `/etc/bash.bashrc`, `/etc/profile.d/*.sh`, and root profile files
- `passwd -S` for account lock-state evidence
- PATH entry extraction via `echo "${PATH}" | tr ':' '\n'`

## Evidence Records
- 5.4.2.1-5.4.2.3: `cis_5_4_2_1_3_cmd`, parsed UID/GID facts, per-control evidence/results
- 5.4.2.4: `cis_5_4_2_4_root_access_cmd`, `cis_5_4_2_4_evidence`, `cis_5_4_2_4_result`
- 5.4.2.5: `cis_5_4_2_5_root_path_cmd`, `cis_5_4_2_5_evidence`, `cis_5_4_2_5_result`
- 5.4.2.6: `cis_5_4_2_6_root_umask_cmd`, `cis_5_4_2_6_evidence`, `cis_5_4_2_6_result`
- 5.4.2.7: `cis_5_4_2_7_system_shell_cmd`, `cis_5_4_2_7_evidence`, `cis_5_4_2_7_result`
- 5.4.2.8: `cis_5_4_2_8_locked_shell_cmd`, `cis_5_4_2_8_evidence`, `cis_5_4_2_8_result`
- 5.4.3.1: `cis_5_4_3_1_nologin_shells_cmd`, `cis_5_4_3_1_evidence`, `cis_5_4_3_1_result`
- 5.4.3.2: `cis_5_4_3_2_timeout_cmd`, `cis_5_4_3_2_evidence`, `cis_5_4_3_2_result`
- 5.4.3.3: `cis_5_4_3_3_default_umask_cmd`, `cis_5_4_3_3_evidence`, `cis_5_4_3_3_result`
- Chapter summary: `cis_root_system_accounts_chapter_summary`

## OT Baseline Placeholders (Explicit)
- `MISSING_OT_BASELINE:approved_root_path_exceptions`
- `MISSING_OT_BASELINE:approved_system_account_shell_exceptions`
- `MISSING_OT_BASELINE:approved_locked_account_exceptions`
- `MISSING_OT_BASELINE:approved_default_shell_timeout_max`
- `MISSING_OT_BASELINE:approved_default_umask_max`
- `MISSING_OT_BASELINE:approved_root_umask_max`

## Result Summary
- Root&System Accounts chapter implementation is complete for audit-only control rows in scope.
- Local technical validation covered file/JSON/YAML correctness and PRD consistency.
- Ansible runtime validation was limited by local environment tooling availability (recorded below).

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
