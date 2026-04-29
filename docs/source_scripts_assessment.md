# Source Scripts Assessment

Task `ASTRA-0003A` normalized the `scripts_summary.docx` reference mapping into `canonical-script-mapping-v1`.

Summary:

- Source script sections: 17
- Mapped Excel-scoped controls: 257
- Out-of-scope or group/header candidates: 32
- Excel-scoped controls without DOCX mapping: 8

The DOCX Bash snippets are reference-only. They were not executed and must not be copied directly into Ansible. Debian, Ubuntu, APT/dpkg, systemd, and path assumptions are retained as assumptions for later OS-specific mapping.

The Debian 12 and Ubuntu 20.04 CIS PDFs may be used as interpretation references only. They must not add controls outside `linux_cis.xlsx`.
