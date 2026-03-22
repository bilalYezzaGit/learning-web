# CLAUDE.md — Learning App Web (Next.js)

## Commandes

```bash
npm run dev          # Dev server (localhost:3000)
npm run build        # Pipeline + Next.js build
npm run lint         # ESLint
npm run type-check   # TypeScript strict
npm run test:specs   # Spec tests (14 domaines, ~64 rules)
npm run generate     # Pipeline contenu (MDX/YAML → HTML/JSON/PDF)
```

## Structure

```
src/
├── app/
│   ├── (auth)/       # Login, signup, reset-password
│   ├── (landing)/    # Landing page
│   ├── (legal)/      # Privacy, terms
│   ├── app/          # App principale (livrets, exercices, QCM, scan, progres)
│   └── api/          # API routes
├── components/
│   └── ui/           # shadcn/ui (Badge, Button, Card, Tabs…)
├── lib/
│   ├── firebase/     # Config + client + admin SDK
│   ├── services/     # Auth, booklet, scan, progress, error-logger
│   ├── hooks/        # useProgress, useModuleProgress
│   ├── context/      # AuthContext
│   ├── parcours/     # Logique parcours (3eme-math, 2nde-math…)
│   └── utils/        # Helpers divers
└── types/            # Interfaces (content, booklet, progress)

_meta/
├── _interface.yaml       # Contrat IDs, schemas, composition
├── lexique.yaml          # Conventions globales (append-only)
├── complexite.yaml       # Echelle 0-3
├── booklet-profiles.yaml # Profils cours/examen/exploration
└── {programme}/          # Ex: 3eme-math/
    ├── prerequis-graph.yaml
    ├── {module}/         # savoir.yaml, praxeologies.yaml, patterns.yaml, misconceptions.yaml, lexique.yaml, redaction.yaml
    └── examens/{slug}/   # spec.yaml

content/
├── {programme}/            # Ex: 3eme-math/
│   ├── _programme.yaml     # Metadata programme
│   └── {module}/           # Ex: continuite/
│       ├── _molecules/     # Repertoire par molecule
│       │   └── {slug}/     # Ex: continuite/
│       │       ├── molecule.yaml    # Livret YAML
│       │       ├── _planning.yaml   # Planning (optionnel)
│       │       └── _validation.md   # Validation (optionnel)
│       └── *.mdx           # Atomes (lesson, exercise, qcm)

tools/pipeline/src/         # Pipeline de contenu
├── stages/                 # read → validate → compile → resolve → write → generate-pdfs
└── pdf/                    # Templates Typst, QR, MDX-to-Typst
```

## Stack

| Couche | Technologie |
|--------|-------------|
| Framework | Next.js 16+ (App Router) |
| Language | TypeScript strict |
| Styling | Tailwind CSS v4 + shadcn/ui |
| State | useSyncExternalStore + Firestore listeners |
| Backend | Firebase (Auth, Firestore, Functions) |
| Math | KaTeX |
| Pipeline | remark-directive + Typst (6 stages) |

## Conventions

- Imports : alias `@/` uniquement
- Server Components par defaut — `'use client'` uniquement si hooks/interactivite
- Fichiers en kebab-case : `module-card.tsx`
- Rules detaillees → `.claude/rules/index.md` + `docs/specs/rules/` (14 domaines)
- Contenu pedagogique → `docs/CONTENT-CONVENTIONS.md`
- Systeme de contenu → `docs/content-agentic-workflow.md`
- Modele academique → `_meta/` (savoir, praxeologies, patterns, misconceptions, lexique, redaction)

## Skills

- `/content` — Gestion du contenu pedagogique (atomes, molecules, KB, planning, generation)
- `/transcription` — Indexer des PDF sources et transcrire des modules en Typst
- `/source` — Gerer le registre de sources educatives et scanner des sites
- `/check` — Verification des rules (auto + manual)
- `/audit-ui` — Audit UI/UX complet (check + exploration)
- `/component <Nom>` — Generer un composant Design System
- `/frontend-design` — Creer des interfaces frontend soignees
- `/find-skills` — Decouvrir et installer des skills

## Regles critiques

1. **TypeScript strict** — Pas de `any`, pas de `@ts-ignore`
2. **Server Components first** — Client uniquement si necessaire
3. **Projet autonome** — Pas de dependances externes non autorisees
4. **Contenu** — Atomes MDX (lesson/exercise/qcm) + molecules YAML (livrets). Le champ `praxeologies` dans le frontmatter est optionnel (defaut `[]`), renseigne lors de la generation depuis un planning.
