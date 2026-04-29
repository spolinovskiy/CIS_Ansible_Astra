# Astra Linux CIS Ansible for OT

Independent Ansible project for CIS audit and controlled remediation on Astra Linux hosts in offline industrial/OT environments.

Scope is limited to controls listed in `../Refference_docs/linux_cis.xlsx`. Reference PDFs and `scripts_summary.docx` are supporting material only and must not expand scope.

Default execution mode is audit-only. Remediation must be explicitly enabled through variables and chapter approval.

## Sensitive Data Handling

This repository must not contain real OT sensitive values.
Use the private overlay model described in `docs/private_data_strategy.md`.

- Place real data in untracked `private_data/` or external path.
- Optionally encrypt with Ansible Vault.
- Set `CIS_PRIVATE_VARS_FILE` to point to the private vars file when needed.
