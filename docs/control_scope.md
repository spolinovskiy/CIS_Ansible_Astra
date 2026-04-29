# Control Scope

The only authoritative control source is `../Refference_docs/linux_cis.xlsx`.

Canonical extraction task: `ASTRA-0002C`.

Extracted scope:

- Worksheets: 18
- Dotted rows: 319
- Controls: 265
- Group headers: 54
- Controls requiring scope clarification: 91
- Manual controls: 61

Canonical top-level keys are `metadata`, `sheets`, `controls`, and `group_headers`. Record keys are fixed by `metadata.canonical_record_keys`.

Rows are controls only when column A contains a dotted CIS ID and the title starts with `Ensure`. Other dotted rows are retained as `group_header` records for traceability.

Remediation is disabled by default for every record. OT safety flags are conservative metadata only and do not authorize remediation.
