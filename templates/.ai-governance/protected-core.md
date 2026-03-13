# Protected Core

## Protected files
List files that must not be rewritten wholesale.

## Protected functions
List functions or modules that preserve architecture-critical behavior.

## Protected behaviors
- routing and dispatch logic
- authentication and session persistence
- source-of-truth and data integrity logic
- output contracts used by downstream consumers
- export / download compatibility behavior
- fallback and error-handling behavior

## Change policy
Protected core changes require:
- `[PROTECTED CHANGE JUSTIFICATION]`
- stronger testing
- reviewer approval
