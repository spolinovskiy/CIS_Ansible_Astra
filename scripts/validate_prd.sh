#!/usr/bin/env bash
set -euo pipefail
python3 -m json.tool PRD.json >/dev/null
python3 - <<'PY'
import json
from pathlib import Path
prd=json.loads(Path('PRD.json').read_text())
seen=set()
for task in prd.get('tasks',[]):
    tid=task.get('task_id')
    if not tid or tid in seen:
        raise SystemExit(f'duplicate or missing task_id: {tid}')
    seen.add(tid)
    if task.get('passes') and not task.get('technical_passes'):
        raise SystemExit(f'{tid} has passes=true without technical_passes=true')
    approval=task.get('engineer_approval_status')
    if task.get('passes') and approval not in {'approved','not_required'}:
        raise SystemExit(f'{tid} has passes=true without valid approval status')
print(f'PRD validation passed: {len(seen)} tasks')
PY
