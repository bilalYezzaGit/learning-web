# UI/UX Specification System

Living specification for the Learning OS design system. Three linked files define **what** must be true, **how** to verify it, and **which tests cover which rules**.

## Files

| File | Purpose |
|------|---------|
| `aspects.md` | ~96 atomic UI/UX rules (what MUST be true) |
| `tests.md` | ~25 executable test procedures (how to verify) |
| `coverage.md` | Bidirectional mapping aspects <-> tests |
| `CHANGELOG.md` | Dated log of spec changes |

## ID scheme

- **Aspects**: `A-{CAT}-{NNN}` — e.g. `A-COL-001`, `A-A11-003`
- **Tests**: `T-{NNN}` — flat numbering (one test covers multiple categories)

### Aspect categories (11)

| Code | Category | ~Count |
|------|----------|--------|
| COL | Colors & Theming | 15 |
| TYP | Typography | 10 |
| SPC | Spacing & Layout | 8 |
| RES | Responsive | 8 |
| A11 | Accessibility | 15 |
| NAV | Navigation | 6 |
| CMP | Components | 12 |
| MOT | Motion & Animation | 6 |
| CNT | Content & MDX | 6 |
| PRT | Print | 5 |
| BRD | Brand & Identity | 5 |

## Relation with existing docs

```
docs/audits/       -> INPUT (historical findings)
docs/specs/        -> SOURCE OF TRUTH (what must be true)
docs/chantiers/    -> ACTION (work to fix violations)
```

Audits inform aspects. Specs replace audits as the reference.

## Iteration workflow

### After a UI change

1. Identify touched aspects via `coverage.md` reverse table
2. Run only the concerned tests from `tests.md`
3. If a test fails, the change introduced a regression

### After an audit

1. Compare audit findings against existing aspects
2. Add new aspects + tests for uncovered findings
3. Update `coverage.md` with new mappings
4. Log changes in `CHANGELOG.md`

### Detect obsolescence

1. Verify referenced files in aspects still exist (`Glob` check)
2. Remove or update aspects pointing to deleted files

### Full regression check

1. Run all 25 tests sequentially
2. Report pass/fail per test with failing aspect IDs
3. Failing aspects = work remaining (create chantier tasks)
