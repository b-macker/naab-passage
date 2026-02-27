# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report security vulnerabilities by emailing the project maintainer directly.

Include the following information:
- Type of issue (e.g., buffer overflow, SQL injection, cross-site scripting, etc.)
- Full paths of source file(s) related to the manifestation of the issue
- The location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit it

## Security Features

NAAb Passage implements multiple layers of security:

1. **Sovereign Architecture** - All security decisions made by NAAb brain, not polyglot workers
2. **Self-Synthesis** - Workers compiled at boot with SHA-256 verification
3. **Hardware Isolation** - CPU pinning and network namespace isolation
4. **Forensic Shredding** - 3-pass source code overwrite after compilation
5. **Schema Enforcement** - Anti-smuggling protection against protocol tunneling
6. **Constant-Time Scanning** - Prevents timing side-channel attacks
7. **Audit Logging** - Hash-chained audit trail

## Security Disclosure Timeline

- **Day 0**: Security report received
- **Day 1-3**: Initial assessment and acknowledgment
- **Day 7**: Preliminary fix developed (if applicable)
- **Day 14**: Fix tested and validated
- **Day 21**: Security advisory published and patch released

We appreciate responsible disclosure and will acknowledge security researchers in release notes.
