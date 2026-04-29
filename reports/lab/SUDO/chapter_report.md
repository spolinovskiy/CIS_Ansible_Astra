# SUDO Chapter Report (ASTRA-1001)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1001
- Chapter/group: SUDO
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `SUDO`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- 5.2.1 Ensure sudo is installed
- 5.2.2 Ensure sudo commands use pty
- 5.2.3 Ensure sudo log file exists
- 5.2.4 Ensure users must provide password for privilege escalation
- 5.2.5 Ensure re-authentication for privilege escalation is not disabled globally 585
- 5.2.6 Ensure sudo authentication timeout is configured correctly
- 5.2.7 Ensure access to the su command is restricted

## Skipped Controls
- None (all SUDO control rows were implemented).
- Non-control group header rows from the sheet were intentionally not implemented.

## Manual Review Controls
- 5.2.4 can return `manual_review_required` when only allowlisted `NOPASSWD` exceptions are found (default pattern includes `zabbix` based on scope comment and required-information template guidance).

## Blocked Controls
- None at implementation time.
- Runtime execution may still be blocked by host-specific conditions (missing files/binaries) and will be reflected in registered evidence/results.

## High-Risk Controls
- 5.2.1 through 5.2.7 are marked high-risk-for-OT in extracted scope metadata and remain audit-only in this task.

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
- `grep -R -E -- '^[[:space:]]*Defaults[^#]*use_pty([[:space:],]|$)' /etc/sudoers /etc/sudoers.d`
- `grep -R -h -E '^[[:space:]]*Defaults[^#]*logfile[[:space:]]*=' /etc/sudoers /etc/sudoers.d` (+ awk/sed parsing)
- `grep -R -E -- '^[[:space:]]*[^#].*NOPASSWD' /etc/sudoers /etc/sudoers.d`
- `grep -R -E -- '^[[:space:]]*[^#].*!authenticate' /etc/sudoers /etc/sudoers.d`
- `sudo -V`
- `grep -R -h -E '^[[:space:]]*Defaults[^#]*timestamp_timeout[[:space:]]*=' /etc/sudoers /etc/sudoers.d` (+ awk parsing)
- `grep -E -- '^[[:space:]]*auth[[:space:]]+(required|requisite)[[:space:]]+pam_wheel\.so' /etc/pam.d/su`

## Evidence Records
- 5.2.1: `cis_5_2_1_evidence`, `cis_5_2_1_result`
- 5.2.2: `cis_5_2_2_use_pty_cmd`, `cis_5_2_2_evidence`, `cis_5_2_2_result`
- 5.2.3: `cis_5_2_3_logfile_paths_cmd`, `cis_5_2_3_logfile_stats`, `cis_5_2_3_evidence`, `cis_5_2_3_result`
- 5.2.4: `cis_5_2_4_nopasswd_cmd`, `cis_5_2_4_evidence`, `cis_5_2_4_result`
- 5.2.5: `cis_5_2_5_no_auth_cmd`, `cis_5_2_5_evidence`, `cis_5_2_5_result`
- 5.2.6: `cis_5_2_6_sudo_version_cmd`, `cis_5_2_6_timeout_values_cmd`, `cis_5_2_6_evidence`, `cis_5_2_6_result`
- 5.2.7: `cis_5_2_7_pam_su_stat`, `cis_5_2_7_pam_wheel_cmd`, `cis_5_2_7_evidence`, `cis_5_2_7_result`

## Result Summary
- SUDO chapter implementation is complete for audit-only control rows in scope.
- Local technical validation covered file/JSON/YAML correctness and PRD consistency.
- Ansible runtime validation was limited by local environment tooling availability (recorded below).

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
