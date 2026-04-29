# PAM Chapter Report (ASTRA-1003)

## Scope
- Project: Astra_Ansible_CIS
- PRD task: ASTRA-1003
- Chapter/group: PAM
- Source scope authority: `data/cis_linux_scope/controls_from_excel.json` (sheet `PAM`)
- Mode: audit-only by default (`cis_remediation_enabled=false`)

## Implemented Controls
- 5.3.1.1 Ensure latest version of pam is installed
- 5.3.1.2 Ensure libpam-modules is installed
- 5.3.1.3 Ensure libpam-pwquality is installed
- 5.3.2.1 Ensure pam_unix module is enabled
- 5.3.2.2 Ensure pam_faillock module is enabled
- 5.3.2.3 Ensure pam_pwquality module is enabled
- 5.3.2.4 Ensure pam_pwhistory module is enabled
- 5.3.3.1.1 Ensure password failed attempts lockout is configured
- 5.3.3.1.2 Ensure password unlock time is configured
- 5.3.3.1.3 Ensure password failed attempts lockout includes root account
- 5.3.3.2.1 Ensure password number of changed characters is configured
- 5.3.3.2.2 Ensure minimum password length is configured
- 5.3.3.2.3 Ensure password complexity is configured (Manual)
- 5.3.3.2.4 Ensure password same consecutive characters is configured
- 5.3.3.2.5 Ensure password maximum sequential characters is configured
- 5.3.3.2.6 Ensure password dictionary check is enabled
- 5.3.3.2.7 Ensure password quality checking is enforced
- 5.3.3.2.8 Ensure password quality is enforced for the root user
- 5.3.3.3.1 Ensure password history remember is configured
- 5.3.3.3.2 Ensure password history is enforced for the root user
- 5.3.3.3.3 Ensure pam_pwhistory includes use_authtok
- 5.3.3.4.1 Ensure pam_unix does not include nullok
- 5.3.3.4.2 Ensure pam_unix does not include remember
- 5.3.3.4.3 Ensure pam_unix includes a strong password hashing algorithm
- 5.3.3.4.4 Ensure pam_unix includes use_authtok

## Skipped Controls
- None (all PAM control rows were implemented).
- Non-control group header rows from the sheet were intentionally not implemented.

## Manual Review Controls
- 5.3.1.1 latest-version validation is marked `manual_review_required` because temporary/default package baseline assumptions are inherited and require environment-approved package baseline values.
- 5.3.3.2.3 is marked `manual_review_required` when complexity parameter evidence is found because policy thresholds require engineer-approved baseline values.

## Blocked Controls
- None at implementation time.
- Runtime execution may still be blocked by host-specific conditions (missing files/binaries) and will be reflected in registered evidence/results.

## High-Risk Controls
- All PAM controls are authentication-stack sensitive and remain audit-only in this task.

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
- `dpkg-query -W -f='${Package} ${Version}' pam libpam0g`
- `grep -R -E` pattern checks across `/etc/pam.d/common-*`, `/etc/security/faillock.conf`, `/etc/security/pwquality.conf`, `/etc/security/pwhistory.conf`

## Evidence Records
- 5.3.1.1: `cis_5_3_1_1_pam_versions_cmd`, `cis_5_3_1_1_evidence`, `cis_5_3_1_1_result`
- 5.3.1.2: `cis_5_3_1_2_evidence`, `cis_5_3_1_2_result`
- 5.3.1.3: `cis_5_3_1_3_evidence`, `cis_5_3_1_3_result`
- 5.3.2.1-5.3.3.4.4: `cis_pam_pattern_evidence_cmd`, `cis_pam_pattern_map`, per-control `cis_<control>_evidence`, per-control `cis_<control>_result`
- Chapter summary: `cis_pam_chapter_summary`

## Test/Default Service-Port Baseline (Temporary)
- This chapter does not modify services or listening ports.
- Temporary/default baseline assumptions are inherited assumptions only and require environment-approved values before production use.
- Package/version/compliance threshold values used for review decisions must be replaced by engineer-approved environment baselines.

## Result Summary
- PAM chapter implementation is complete for audit-only control rows in scope.
- Local technical validation covered file/JSON/YAML correctness and PRD consistency.
- Ansible runtime validation was limited by local environment tooling availability (recorded below).

ENGINEER APPROVAL REQUIRED BEFORE FINAL COMPLETION.
