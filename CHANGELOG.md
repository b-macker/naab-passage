# Changelog

All notable changes to NAAb Passage will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-02-27

### Added
- Initial release of NAAb Passage
- Sovereign architecture with NAAb brain as decision engine
- Self-synthesizing polyglot workers (Go gateway, Rust shield)
- PII detection for SSNs, credit cards, emails, high-entropy secrets
- Schema enforcement (anti-smuggling protection)
- Hardware isolation (CPU pinning, network namespaces)
- Forensic source shredding (3-pass overwrite)
- SHA-256 binary caching
- Configurable risk matrix and policies
- HTTP/TLS gateway on port 8091
- Unix socket communication between components
- Comprehensive test suite
- Documentation and examples

### Security
- Zero-trust architecture - all decisions made by NAAb brain
- Self-healing capability through runtime synthesis
- Constant-time pattern scanning to prevent timing attacks
- Hash-chained audit logging

---

[1.0.0]: https://github.com/b-macker/naab-passage/releases/tag/v1.0.0
