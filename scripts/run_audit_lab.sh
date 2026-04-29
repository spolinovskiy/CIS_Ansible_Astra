#!/usr/bin/env bash
set -euo pipefail
ansible-playbook -i inventories/lab/hosts.yml playbooks/audit.yml
