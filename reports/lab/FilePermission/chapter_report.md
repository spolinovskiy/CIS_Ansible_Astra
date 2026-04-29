# FilePermission Chapter Report (ASTRA-1007)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1007
- Chapter/group: FilePermission
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `FilePermission`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- 7.1.1 Ensure permissions on /etc/passwd are configured
- 7.1.2 Ensure permissions on /etc/passwd- are configured
- 7.1.3 Ensure permissions on /etc/group are configured
- 7.1.4 Ensure permissions on /etc/group- are configured
- 7.1.5 Ensure permissions on /etc/shadow are configured
- 7.1.6 Ensure permissions on /etc/shadow- are configured
- 7.1.7 Ensure permissions on /etc/gshadow are configured
- 7.1.8 Ensure permissions on /etc/gshadow- are configured
- 7.1.9 Ensure permissions on /etc/shells are configured
- 7.1.10 Ensure permissions on /etc/security/opasswd are configured
- 7.1.11 Ensure world writable files and directories are secured
- 7.1.12 Ensure no files or directories without an owner and a group exist
- 7.1.13 Ensure SUID and SGID files are reviewed (Manual)

## Skipped Controls
- None (all FilePermission control rows were implemented).
- Non-control group header rows from the sheet were intentionally not implemented.

## Manual Review Controls
- 7.1.11 requires approved world-writable path exceptions when findings are present.
- 7.1.12 requires approved unowned/ungrouped path exceptions when findings are present.
- 7.1.13 is manual by design and requires approved SUID/SGID review allowlist baseline.

## Blocked Controls
- None at implementation time.
- Runtime execution may still be blocked by host-specific conditions (restricted mounts/filesystems/permissions) and will be reflected in registered evidence/results.

## High-Risk Controls
- File permission controls can expose sensitive account/authentication/system files; this task remains audit-only.

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
- `stat` checks for `/etc/*` protected files in scope
- `find / -xdev -perm -0002` for world-writable paths
- `find / -xdev -nouser -o -nogroup` for unowned/ungrouped paths
- `find / -xdev -perm -4000 -o -perm -2000` for SUID/SGID review evidence

## Evidence Records
- 7.1.1-7.1.10: `cis_7_1_1_10_stats`, `cis_fp_result_map`, per-control evidence/result entries
- 7.1.11: `cis_7_1_11_world_writable_cmd`, `cis_7_1_11_evidence`, `cis_7_1_11_result`
- 7.1.12: `cis_7_1_12_unowned_cmd`, `cis_7_1_12_evidence`, `cis_7_1_12_result`
- 7.1.13: `cis_7_1_13_suid_sgid_cmd`, `cis_7_1_13_evidence`, `cis_7_1_13_result`
- Chapter summary: `cis_file_permission_chapter_summary`

## OT Baseline Placeholders (Explicit)
- `MISSING_OT_BASELINE:approved_world_writable_path_exceptions`
- `MISSING_OT_BASELINE:approved_unowned_ungrouped_path_exceptions`
- `MISSING_OT_BASELINE:approved_suid_sgid_review_allowlist`

## Result Summary
- FilePermission chapter implementation is complete for audit-only control rows in scope.
- Local technical validation covered file/JSON/YAML correctness and PRD consistency.
- Ansible runtime validation was limited by local environment tooling availability (recorded below).

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
