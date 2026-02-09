# Spec System

Two-level guardrail framework for development with Claude Code.

## Level 1 — Deterministic (pass/fail)

Rules are concrete, binary, testable assertions organized by domain.

```
docs/specs/rules/     14 domain files, ~66 rules
scripts/specs/        16 test modules (mirror of rules/)
```

### Rule format

```markdown
- COL-001 [auto] Description of what must be true
- COL-004 [manual] Description of what must be true
  > Procedure: how to verify manually
```

- `[auto]` = verified by `npm run test:specs`
- `[manual]` = verified by `/check` (Claude Code reads and checks)

### Commands

| Command | What it does |
|---------|-------------|
| `npm run test:specs` | Run all [auto] rules (~90%) |
| `/check` | Run auto + manual rules (100%) |
| `/audit-ui` | Full check + Level 2 exploration |

### Adding a rule

1. Add a line in the right `docs/specs/rules/*.md` file
2. If `[auto]`: add a test function in `scripts/specs/*.mjs` (mirror file)
3. Run `npm run test:specs` to verify

## Level 2 — Exploratory (discovery)

Skills used as reference material to discover new rules:

| Skill | Purpose |
|-------|---------|
| `ui-ux-pro-max` | UX guidelines, accessibility, animation |
| `frontend-design` | Creative design, typography, color theory |

Level 2 feeds Level 1: audit finds issue → add rule → never regress.

## File structure

```
docs/specs/
├── rules/              14 domain files (source of truth)
│   ├── colors.md       COL-xxx
│   ├── typography.md   TYP-xxx
│   ├── layout.md       LAY-xxx
│   ├── accessibility.md A11-xxx
│   ├── navigation.md   NAV-xxx
│   ├── components.md   CMP-xxx
│   ├── motion.md       MOT-xxx
│   ├── content.md      CNT-xxx
│   ├── print.md        PRT-xxx
│   ├── brand.md        BRD-xxx
│   ├── typescript.md   TSC-xxx
│   ├── react.md        RCT-xxx
│   ├── backend.md      BAK-xxx
│   └── testing.md      TST-xxx (meta-rules)
├── README.md           This file
└── CHANGELOG.md        Dated log of changes

scripts/specs/
├── runner.mjs          Orchestrator (npm run test:specs)
├── helpers.mjs         Shared utilities
├── colors.mjs          Tests for COL-xxx
├── ...                 (mirrors rules/ structure)
└── testing.mjs         Meta-tests (TST-xxx)
```

## ID scheme

`{DOMAIN}-{NNN}` — e.g. `COL-001`, `A11-003`, `TSC-002`
