# Private Data Strategy (Universal)

## Goal
Keep sensitive OT data out of GitHub while allowing repeatable Ansible execution across projects.

## What must stay private
- IP addresses and network topology
- Server/workstation role tags tied to real assets
- SSH private keys and key material
- Jump-host/bastion details
- Domain/service credentials
- Any mapping that can expose OT architecture

## Model
1. Repository keeps only placeholders and schemas.
2. Real values live in untracked `private_data/` or external path.
3. Optional encryption uses Ansible Vault with `--vault-id`.
4. Playbooks load private overlay if present; continue safely with defaults/placeholders if absent.

## Supported load order
`cis_common` loads the first existing file from this list:
1. `CIS_PRIVATE_VARS_FILE` (env var absolute/relative path)
2. `private_data/private_sensitive.yml`
3. `private_data/private_sensitive.vault.yml`
4. `private_data/<inventory_dir_basename>/private_sensitive.yml`
5. `private_data/<inventory_dir_basename>/private_sensitive.vault.yml`

## Recommended operations workflow
1. Copy `private_data/examples/private_sensitive.example.yml` to a private location.
2. Fill in real values.
3. Encrypt with Vault for shared-secure usage.
4. Run playbooks with `--vault-id <label>@<source>`.

## Expandability
The `cis_private_overlay` structure is intentionally generic and can be reused by other projects:
- `management_networks`, `bastion_hosts`, `host_catalog`, `approved_services`, `approved_ports`, etc.
- New keys can be added without changing existing role logic.

## Git safety guardrails
The repository `.gitignore` excludes common private/secrets paths and sensitive overlay file names.
