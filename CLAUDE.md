# CLAUDE.md — Learning App Web (Next.js)

Instructions pour Claude Code sur ce projet Next.js.

## Commandes

```bash
npm run dev          # Dev server (localhost:3000)
npm run build        # Build production
npm run lint         # ESLint
npm run type-check   # TypeScript strict (si configuré)
```

## Structure

```
src/
├── app/                    # App Router (pages)
│   ├── (auth)/            # Routes authentification
│   ├── (main)/            # Routes principales
│   └── layout.tsx         # Root layout
├── components/            # Design System React
│   ├── ui/               # Atoms (Button, Input, etc.)
│   ├── patterns/         # Molecules
│   └── sections/         # Organisms
├── lib/                   # Core logic
│   ├── firebase/         # Firebase config
│   ├── services/         # Services métier
│   ├── stores/           # Zustand stores
│   ├── hooks/            # Custom hooks
│   └── utils/            # Helpers
├── content/              # HTML extensions (math, graph)
└── types/                # TypeScript interfaces
```

## Stack

| Couche | Technologie |
|--------|-------------|
| Framework | Next.js 16+ (App Router) |
| Language | TypeScript strict |
| Styling | Tailwind CSS + shadcn/ui |
| State | Zustand |
| Backend | Firebase (Auth, Firestore, Functions) |
| Math | KaTeX |
| Charts | Recharts |
| PWA | next-pwa |

## Conventions

### Imports

Utiliser les alias `@/` pour tous les imports :
```typescript
import { Button } from '@/components/ui/button'
import { useAuth } from '@/lib/hooks/use-auth'
```

### Composants

- **Server Components** par défaut (pas de `'use client'`)
- **Client Components** uniquement si hooks ou interactivité
- Nommer les fichiers en kebab-case : `module-card.tsx`

```tsx
// Server Component (default)
export default function Page() { ... }

// Client Component
'use client'
import { useState } from 'react'
export default function Counter() { ... }
```

### State Management (Zustand)

```typescript
// src/lib/stores/auth-store.ts
import { create } from 'zustand'

interface AuthState {
  user: User | null
  setUser: (user: User | null) => void
}

export const useAuthStore = create<AuthState>((set) => ({
  user: null,
  setUser: (user) => set({ user }),
}))
```

### Services

Les services sont des singletons qui encapsulent la logique Firebase :

```typescript
// src/lib/services/content-service.ts
class ContentService {
  async fetchModules(): Promise<Module[]> { ... }
}

export const contentService = new ContentService()
```

### Types

Interfaces TypeScript dans `src/types/` :

```typescript
// src/types/models.ts
export interface Module {
  id: string
  title: string
  // ...
}
```

## Design System (shadcn/ui)

Composants dans `src/components/ui/` gérés par shadcn CLI :

```bash
npx shadcn@latest add button    # Ajouter un composant
```

Personnalisation via CSS variables dans `globals.css`.

## Skills disponibles

- `/dev` — Guide développement et debug
- `/audit` — Audit code TypeScript/React
- `/component <Nom>` — Générer un composant DS

## Système de contenu

Le contenu pédagogique (cours, exercices, QCM) est géré séparément.

### Structure

```
content/                    # Source YAML
├── activities/            # 75 activités (lessons, exercises, qcm)
├── programmes/            # 3 programmes avec modules
└── series/                # 2 séries de révision

scripts/content-build/     # Build pipeline (Node.js)
├── src/build.js          # YAML → JSON
├── src/validate.js       # Validation contenu
└── src/bump-version.js   # Version Remote Config

public/content/            # Output JSON (généré, gitignore)
```

### Commandes

```bash
cd scripts/content-build
npm run validate      # Valider le contenu YAML
npm run build         # Générer les JSON
npm run deploy        # Build + deploy Firebase + bump version
```

### Configuration actuelle

Le contenu est servi depuis **Firebase CDN** :
```typescript
// src/lib/services/content-service.ts
const BASE_URL = 'https://learning-os-platform.web.app/content'
```

### Documentation complète

Voir `docs/CONTENT-SYSTEM.md` pour :
- Architecture détaillée
- Option de servir via Next.js direct
- Format des fichiers JSON
- Workflow de mise à jour

## Skills disponibles

- `/chantier` — Gestion des chantiers de développement
- `/dev` — Guide développement et debug
- `/audit` — Audit code TypeScript/React
- `/component <Nom>` — Générer un composant DS

## Règles critiques

1. **TypeScript strict** — Pas de `any`, pas de `@ts-ignore`
2. **Server Components first** — Client uniquement si nécessaire
3. **Pas de dépendances externes au projet** — Ce projet est autonome
