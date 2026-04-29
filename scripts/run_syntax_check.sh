#!/usr/bin/env bash
set -euo pipefail
for playbook in playbooks/precheck.yml playbooks/audit.yml playbooks/remediate.yml playbooks/report.yml; do
  ansible-playbook --syntax-check "$playbook"
done
