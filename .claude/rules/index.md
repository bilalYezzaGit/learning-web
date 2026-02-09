# Project Rules

All verifiable rules live in `docs/specs/rules/` (14 domain files, ~66 rules).
Run `npm run test:specs` to check all automated rules.

## Key principles

- **TypeScript strict**: no `any`, no `@ts-ignore`, no `console.log`, `@/` imports only
- **Server Components first**: `'use client'` only when hooks or event handlers are needed
- **Semantic color tokens**: no hardcoded Tailwind colors (bg-red-500), use bg-primary, text-success
- **Specific transitions**: no `transition-all`, use transition-colors, transition-transform
- **Accessibility**: aria-hidden on icons, role="alert" on errors, 44px touch targets, skip-link
- **100svh not 100vh**, no bare `container` class, ellipsis character not triple-dot

## Firebase

- All Firebase SDK imports in `src/lib/` only (services encapsulate all calls)
- No credentials in source code
- Firestore rules deny by default

## Content (MDX/YAML)

- Source of truth: `docs/CONTENT-CONVENTIONS.md`
- Templates: `.claude/skills/content/references/templates.md`

## Debug checklist

1. **Build fails** → `npm run type-check` then `npm run lint`
2. **Hydration mismatch** → check `'use client'` on components with state
3. **Firebase error** → check `src/lib/firebase/config.ts`
4. **Test fails** → `npm run test:specs` then fix the rule violation
