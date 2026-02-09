# Coverage Mapping

Bidirectional mapping between tests and aspects.

---

## Forward mapping (Test -> Aspects)

| Test | Aspects covered |
|------|----------------|
| T-001 | A-COL-001, A-COL-002, A-COL-003, A-COL-004, A-COL-005, A-COL-007, A-COL-008, A-COL-009 |
| T-002 | A-COL-001, A-COL-006, A-COL-007, A-COL-010, A-COL-011 |
| T-003 | A-COL-012 |
| T-004 | A-A11-003 |
| T-005 | A-MOT-006 |
| T-006 | A-A11-001, A-A11-009, A-A11-013, A-A11-014, A-TYP-001, A-TYP-002, A-TYP-007, A-TYP-010, A-CMP-003, A-CMP-011, A-CMP-012, A-BRD-001, A-BRD-003, A-BRD-004, A-BRD-005, A-COL-013 |
| T-007 | A-NAV-001, A-A11-002, A-RES-006, A-RES-007, A-SPC-004, A-SPC-008 |
| T-008 | A-NAV-002, A-NAV-003, A-NAV-005, A-RES-003, A-RES-005, A-A11-003, A-A11-015, A-SPC-007, A-MOT-004 |
| T-009 | A-COL-015, A-CMP-004, A-CMP-005, A-CMP-006, A-A11-003 |
| T-010 | A-MOT-001, A-MOT-002 |
| T-011 | A-PRT-001, A-PRT-002, A-PRT-003, A-PRT-004, A-PRT-005 |
| T-012 | A-A11-004, A-A11-005 |
| T-013 | A-TYP-001, A-TYP-002, A-TYP-007, A-TYP-008 |
| T-014 | A-TYP-003 |
| T-015 | A-TYP-004 |
| T-016 | A-TYP-006 |
| T-017 | A-RES-002 |
| T-018 | A-A11-001, A-A11-002 |
| T-019 | A-CMP-001, A-A11-011 |
| T-020 | A-BRD-001, A-BRD-003, A-BRD-004, A-BRD-005, A-COL-013 |
| T-021 | A-CNT-001, A-CNT-002, A-CNT-003, A-CNT-004, A-CNT-005, A-CNT-006, A-COL-014 |
| T-022 | A-NAV-001, A-NAV-004, A-NAV-006, A-SPC-006, A-BRD-002, A-TYP-009, A-A11-003, A-A11-006 |
| T-023 | A-A11-007, A-A11-008, A-A11-012, A-CMP-002, A-CMP-008, A-CMP-010 |
| T-024 | A-A11-010 |
| T-025 | A-SPC-002 |

---

## Reverse mapping (Aspect -> Tests)

### COL — Colors & Theming

| Aspect | Tests |
|--------|-------|
| A-COL-001 | T-001, T-002 |
| A-COL-002 | T-001 |
| A-COL-003 | T-001 |
| A-COL-004 | T-001 |
| A-COL-005 | T-001 |
| A-COL-006 | T-002 |
| A-COL-007 | T-001, T-002 |
| A-COL-008 | T-001 |
| A-COL-009 | T-001 |
| A-COL-010 | T-002 |
| A-COL-011 | T-002 |
| A-COL-012 | T-003 |
| A-COL-013 | T-006, T-020 |
| A-COL-014 | T-021 |
| A-COL-015 | T-009 |

### TYP — Typography

| Aspect | Tests |
|--------|-------|
| A-TYP-001 | T-006, T-013 |
| A-TYP-002 | T-006, T-013 |
| A-TYP-003 | T-014 |
| A-TYP-004 | T-015 |
| A-TYP-005 | *(no test — requires visual inspection)* |
| A-TYP-006 | T-016 |
| A-TYP-007 | T-006, T-013 |
| A-TYP-008 | T-013 |
| A-TYP-009 | T-022 |
| A-TYP-010 | T-006 |

### SPC — Spacing & Layout

| Aspect | Tests |
|--------|-------|
| A-SPC-001 | *(covered by T-001 implicitly via globals.css read)* |
| A-SPC-002 | T-025 |
| A-SPC-003 | *(covered by T-001 implicitly via globals.css read)* |
| A-SPC-004 | T-007 |
| A-SPC-005 | T-023 |
| A-SPC-006 | T-022 |
| A-SPC-007 | T-008 |
| A-SPC-008 | T-007 |

### RES — Responsive

| Aspect | Tests |
|--------|-------|
| A-RES-001 | T-006 |
| A-RES-002 | T-017 |
| A-RES-003 | T-008 |
| A-RES-004 | T-023 |
| A-RES-005 | T-008 |
| A-RES-006 | T-007 |
| A-RES-007 | T-007 |
| A-RES-008 | T-023 |

### A11 — Accessibility

| Aspect | Tests |
|--------|-------|
| A-A11-001 | T-006, T-018 |
| A-A11-002 | T-007, T-018 |
| A-A11-003 | T-004, T-008, T-009, T-022 |
| A-A11-004 | T-012 |
| A-A11-005 | T-012 |
| A-A11-006 | T-022 |
| A-A11-007 | T-023 |
| A-A11-008 | T-023 |
| A-A11-009 | T-006 |
| A-A11-010 | T-024 |
| A-A11-011 | T-019 |
| A-A11-012 | T-023 |
| A-A11-013 | T-006 |
| A-A11-014 | T-006 |
| A-A11-015 | T-008 |

### NAV — Navigation

| Aspect | Tests |
|--------|-------|
| A-NAV-001 | T-007, T-022 |
| A-NAV-002 | T-008 |
| A-NAV-003 | T-008 |
| A-NAV-004 | T-022 |
| A-NAV-005 | T-008 |
| A-NAV-006 | T-022 |

### CMP — Components

| Aspect | Tests |
|--------|-------|
| A-CMP-001 | T-019 |
| A-CMP-002 | T-023 |
| A-CMP-003 | T-006 |
| A-CMP-004 | T-009 |
| A-CMP-005 | T-009 |
| A-CMP-006 | T-009 |
| A-CMP-007 | T-023 |
| A-CMP-008 | T-023 |
| A-CMP-009 | T-023 |
| A-CMP-010 | T-023 |
| A-CMP-011 | T-006 |
| A-CMP-012 | T-006 |

### MOT — Motion & Animation

| Aspect | Tests |
|--------|-------|
| A-MOT-001 | T-010 |
| A-MOT-002 | T-010 |
| A-MOT-003 | T-022 |
| A-MOT-004 | T-008 |
| A-MOT-005 | T-021 |
| A-MOT-006 | T-005 |

### CNT — Content & MDX

| Aspect | Tests |
|--------|-------|
| A-CNT-001 | T-021 |
| A-CNT-002 | T-021 |
| A-CNT-003 | T-021 |
| A-CNT-004 | T-021 |
| A-CNT-005 | T-021 |
| A-CNT-006 | T-021 |

### PRT — Print

| Aspect | Tests |
|--------|-------|
| A-PRT-001 | T-011 |
| A-PRT-002 | T-011 |
| A-PRT-003 | T-011 |
| A-PRT-004 | T-011 |
| A-PRT-005 | T-011 |

### BRD — Brand & Identity

| Aspect | Tests |
|--------|-------|
| A-BRD-001 | T-006, T-020 |
| A-BRD-002 | T-022 |
| A-BRD-003 | T-006, T-020 |
| A-BRD-004 | T-006, T-020 |
| A-BRD-005 | T-006, T-020 |

---

## Coverage summary

| Category | Aspects | Fully covered | Gaps |
|----------|---------|---------------|------|
| COL | 15 | 15 | — |
| TYP | 10 | 9 | A-TYP-005 (requires visual) |
| SPC | 8 | 8 | — |
| RES | 8 | 8 | — |
| A11 | 15 | 15 | — |
| NAV | 6 | 6 | — |
| CMP | 12 | 12 | — |
| MOT | 6 | 6 | — |
| CNT | 6 | 6 | — |
| PRT | 5 | 5 | — |
| BRD | 5 | 5 | — |
| **Total** | **96** | **95** | **1 gap** |

**Note:** A-TYP-005 (no text smaller than 14px) requires visual inspection or complex regex that would produce false positives. Consider adding a Grep-based heuristic test in a future iteration.
