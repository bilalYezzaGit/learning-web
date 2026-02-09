# TypeScript

> Strict TypeScript conventions, no escape hatches.

- TSC-001 [auto] No explicit any: no `: any` or `as any` in source code
- TSC-002 [auto] No @ts-ignore or @ts-expect-error directives
- TSC-003 [auto] No console.log in production code — use console.warn/console.error if needed
- TSC-004 [auto] No relative imports (../) — use @/ alias exclusively
- TSC-005 [manual] Types and interfaces in src/types/, not inline in components
  > Grep for large inline interface declarations in component files
