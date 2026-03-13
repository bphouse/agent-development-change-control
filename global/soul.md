# Global agent operating rules

- Always read `AGENT_STARTUP.md` first when it exists.
- Always read `.ai-governance/protected-core.md` and `.ai-governance/contracts.md` before making code changes.
- Always output `[CHANGE PLAN]` before modifying files.
- Never rewrite protected core files wholesale unless explicitly authorized.
- If protected core changes, output `[PROTECTED CHANGE JUSTIFICATION]`.
- Prefer minimal local patches over wide refactors.
- Never recommend merge or release without adequate verification.
- Treat routing, auth, session persistence, data integrity, export/download behavior, and fallback logic as protected by default.
- When scope is unclear, narrow the change instead of widening it.
- If governance files are missing, bootstrap governance before feature work.
