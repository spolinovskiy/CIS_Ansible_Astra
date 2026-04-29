# Reporting Strategy

This document defines audit result output and tracking requirements for the ASTRA CIS project in an offline OT environment.

## Mandatory Outcomes

1. Each audit run must generate an automatic per-host checklist with status per CIS control from `linux_cis.xlsx`.
2. Results must be collated per machine in a machine-readable format suitable for aggregation and diffs.
3. Repeated audits must support change tracking versus previous runs.

## Built-in Ansible Options (Reference)

- `ansible.builtin.tree` callback: writes per-host JSON event files (good offline default).
- `ansible.builtin.junit` callback: writes JUnit XML output (CI-compatible XML).
- `ansible.posix.json` / `ansible.posix.jsonl` callbacks: structured JSON stdout output (requires collection availability).
- Fact cache plugins (`ansible.builtin.jsonfile`, `redis`) can persist host data for repeat comparisons.
- `ansible.builtin.set_stats` can publish run-level and per-host summary stats.

### Optional XML Mode Note

- XML export can be enabled as an optional mode via `ansible.builtin.junit` callback when `ansible-playbook` runtime is available in the execution environment.
- This project keeps JSON/CSV/Markdown collation as the mandatory baseline because local workstation validation may run without `ansible-playbook`.
- XML/JUnit output is therefore documented and compatible, but not a mandatory runtime dependency.

## Recommended Offline Baseline

- Primary format: JSON per host per run (stable schema).
- Optional exports: Markdown summary and CSV flattening for operators.
- Storage path: repository/local path under `reports/<env>/<timestamp>/` per run.
- Database: deferred optional future enhancement only; implementation is gated by explicit approval and industrial-segment availability.

## Delta Tracking

- Baseline source order per host:
  - First preference: `reports/<env>/latest/<host>/checklist.json` read before it is overwritten by current run.
  - Fallback: latest timestamped `reports/<env>/<timestamp>/<host>/checklist.json` if `latest` does not exist yet.
- Per-host delta method:
  - Compare current `status_mark` vs baseline `status_mark` for each scoped `control_id`.
  - Classification rules:
    - `new`: control absent in baseline.
    - `resolved`: baseline status was not `PASS` and current status is `PASS`.
    - `changed`: baseline exists and current status differs, excluding `resolved`.
    - `unchanged`: baseline exists and status is identical.
  - Emit per-host artifact: `reports/<env>/<timestamp>/<host>/delta.json` and mirror to `reports/<env>/latest/<host>/delta.json`.
- Run-level delta collation:
  - Aggregate all per-host `delta.json` artifacts into per-control counters:
    - `changed`, `new`, `resolved`, `unchanged`.
  - Emit run-level artifact: `reports/<env>/<timestamp>/run_delta_summary.json` and mirror to `reports/<env>/latest/run_delta_summary.json`.
  - Include delta table in `run_summary.md` and delta path in `run_manifest.json`/`run_summary.csv`.

## Scope and Safety

- Scope is locked to controls from `linux_cis.xlsx` only.
- No internet downloads or external services required for reporting/tracking baseline.
