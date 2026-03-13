# Governance Reference

## Default governance principles

- plan before modification
- protect architecture-critical behavior
- reason against contracts, not vague intent
- prefer minimal local patches
- block release when protected behavior changes without strong verification

## Default protected areas

Treat these as protected unless the project explicitly narrows or expands the list:
- routing and orchestration
- authentication, authorization, and session persistence
- source-of-truth and data integrity logic
- output contracts used by clients or downstream systems
- export, download, and compatibility logic
- fallback and error-handling paths that preserve safe behavior

## Release assumptions

Before release, expect at least:
- static guard confidence
- contract verification
- integration confidence
- smoke validation for critical paths
- rollback readiness
