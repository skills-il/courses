# Security Policy

## Reporting

Report security issues to security@agentskills.co.il. We'll respond within 72 hours.

## Course content

Every course in this repo is scanned by:
- Tank scanner (markdown ruleset + code ruleset on `scripts/`)
- LLM prompt-injection review (fresh-context Claude Opus on every sync)

Findings with verdict=fail block publication. See `docs/superpowers/specs/2026-05-21-courses-design.md` in the parent repo for details.
