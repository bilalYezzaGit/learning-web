# CLAUDE.md — Learning App Web (Next.js)

## Commandes

```bash
npm run dev          # Dev server (localhost:3000)
npm run build        # Build production
npm run lint         # ESLint
npm run type-check   # TypeScript strict
npm run test:specs   # Spec tests (64 rules)
npm run generate     # Pipeline contenu (MDX → HTML/JSON)
```

## Structure

```
src/
├── app/              # App Router (pages)
│   ├── (auth)/      # Routes authentification
│   ├── (main)/      # Routes principales
│   └── layout.tsx   # Root layout
├── components/       # Design System (ui/, patterns/, sections/)
├── lib/              # Core (firebase/, services/, hooks/, utils/)
├── content/          # Extensions rendering (math, graph)
└── types/            # TypeScript interfaces
content/
├── {programme}/          # Ex: 3eme-math/
│   ├── _programme.yaml   # Metadata programme
│   └── {module}/         # Ex: continuite/
│       ├── _molecules/   # Cours + series YAML
│       └── *.mdx         # Atomes
```

## Stack

| Couche | Technologie |
|--------|-------------|
| Framework | Next.js 16+ (App Router) |
| Language | TypeScript strict |
| Styling | Tailwind CSS + shadcn/ui |
| State | useSyncExternalStore + Firestore listeners |
| Backend | Firebase (Auth, Firestore, Functions) |
| Math | KaTeX |
| Pipeline | remark-directive + Typst |

## Conventions

- Imports : alias `@/` uniquement
- Server Components par defaut — `'use client'` uniquement si hooks/interactivite
- Fichiers en kebab-case : `module-card.tsx`
- Conventions detaillees → `.claude/rules/` + `docs/specs/rules/`
- Contenu pedagogique → `docs/CONTENT-CONVENTIONS.md`
- Architecture contenu → `docs/chantiers/001-content-architecture.md`
- Systeme de contenu → `docs/content-agentic-workflow.md`

## Skills

- `/chantier` — Gestion des chantiers de developpement
- `/audit` — Audit code TypeScript/React
- `/check` — Verification des rules (auto + manual)
- `/audit-ui` — Audit UI/UX complet (check + exploration Level 2)
- `/component <Nom>` — Generer un composant DS
- `/content` — Gestion du contenu pedagogique

## Regles critiques

1. **TypeScript strict** — Pas de `any`, pas de `@ts-ignore`
2. **Server Components first** — Client uniquement si necessaire
3. **Projet autonome** — Pas de dependances externes non autorisees
