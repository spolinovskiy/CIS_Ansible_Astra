# SSHD Chapter Report (ASTRA-1005)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1005
- Chapter/group: SSHD
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `SSHD`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- 5.1.1 Ensure permissions on /etc/ssh/sshd_config are configured
- 5.1.2 Ensure permissions on SSH private host key files are configured
- 5.1.3 Ensure permissions on SSH public host key files are configured
- 5.1.4 Ensure sshd access is configured
- 5.1.5 Ensure sshd Banner is configured
- 5.1.6 Ensure sshd Ciphers are configured
- 5.1.7 Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured
- 5.1.8 Ensure sshd DisableForwarding is enabled
- 5.1.9 Ensure sshd GSSAPIAuthentication is disabled
- 5.1.10 Ensure sshd HostbasedAuthentication is disabled
- 5.1.11 Ensure sshd IgnoreRhosts is enabled
- 5.1.12 Ensure sshd KexAlgorithms is configured
- 5.1.13 Ensure sshd LoginGraceTime is configured
- 5.1.14 Ensure sshd LogLevel is configured
- 5.1.15 Ensure sshd MACs are configured
- 5.1.16 Ensure sshd MaxAuthTries is configured
- 5.1.17 Ensure sshd MaxSessions is configured
- 5.1.18 Ensure sshd MaxStartups is configured
- 5.1.19 Ensure sshd PermitEmptyPasswords is disabled
- 5.1.20 Ensure sshd PermitRootLogin is disabled
- 5.1.21 Ensure sshd PermitUserEnvironment is disabled
- 5.1.22 Ensure sshd UsePAM is enabled

## Skipped Controls
- None (all SSHD control rows were implemented).
- Non-control group header rows from the sheet were intentionally not implemented.

## Manual Review Controls
- 5.1.4 requires approved OT baselines for access subnets/users/groups.
- 5.1.5 requires approved banner text source baseline.
- 5.1.6, 5.1.12, and 5.1.15 require approved ciphers/KEX/MAC baselines.
- 5.1.7, 5.1.13, 5.1.16, 5.1.17, and 5.1.18 require approved idle/session/max settings baselines.

## Blocked Controls
- None at implementation time.
- Runtime execution may still be blocked by host-specific conditions (missing sshd binary/config/files) and will be reflected in registered evidence/results.

## High-Risk Controls
- SSHD configuration controls are remote-access and OT-safety sensitive; this task remains audit-only.

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
- `sshd -T`
- `grep -R` against `/etc/ssh/sshd_config` and `/etc/ssh/sshd_config.d`
- `stat -Lc` checks for `sshd_config` and host key files

## Evidence Records
- 5.1.1: `cis_5_1_1_sshd_config_stat`, `cis_5_1_1_evidence`, `cis_5_1_1_result`
- 5.1.2/5.1.3: `cis_5_1_2_5_1_3_hostkey_stat_cmd`, `cis_5_1_2_evidence`, `cis_5_1_3_evidence`, `cis_5_1_2_result`, `cis_5_1_3_result`
- 5.1.4: `cis_5_1_4_access_cmd`, `cis_5_1_4_evidence`, `cis_5_1_4_result`
- 5.1.5-5.1.22: `cis_sshd_t_cmd`, `cis_sshd_effective`, per-control evidence/result facts
- Chapter summary: `cis_sshd_chapter_summary`

## OT Baseline Placeholders (Explicit)
- `MISSING_OT_BASELINE:approved_ssh_access_subnets`
- `MISSING_OT_BASELINE:approved_ssh_access_users`
- `MISSING_OT_BASELINE:approved_ssh_access_groups`
- `MISSING_OT_BASELINE:approved_sshd_ciphers`
- `MISSING_OT_BASELINE:approved_sshd_macs`
- `MISSING_OT_BASELINE:approved_sshd_kex_algorithms`
- `MISSING_OT_BASELINE:approved_banner_text_source`
- `MISSING_OT_BASELINE:approved_idle_session_max_settings`

## Result Summary
- SSHD chapter implementation is complete for audit-only control rows in scope.
- Local technical validation covered file/JSON/YAML correctness and PRD consistency.
- Ansible runtime validation was limited by local environment tooling availability (recorded below).

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
