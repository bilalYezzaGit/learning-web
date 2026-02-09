# Testing &amp; Meta-Rules

> Rules about the test system itself. Ensures tests stay healthy and in sync with rules.

- TST-001 [auto] No duplicate rule IDs across all rule files
- TST-002 [auto] Every [auto] rule ID has a corresponding test function
- TST-003 [auto] Every test function ID maps to an existing rule
- TST-004 [auto] Rule files and test files are in mirror (each rules/*.md has a specs/*.mjs)
- TST-005 [auto] Files referenced in hardcoded test paths exist on disk
- TST-006 [auto] Positive grep tests still match expected minimum counts
