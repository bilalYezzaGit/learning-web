---
paths:
  - "src/components/**/*.{ts,tsx}"
  - "src/app/**/*.{ts,tsx}"
---

# React Patterns

## Ordre des imports

```
1. React/Next.js
2. Libs externes
3. Alias internes (@/components, @/lib, @/types)
4. Types (import type)
```

## Server vs Client Components

- Server Components : fetch direct, pas de state, pas de hooks
- Client Components : `'use client'` en premiere ligne, state, hooks, event handlers
- Maximiser les Server Components, extraire les parties interactives en Client Components enfants

## Zustand Store Pattern

- Un fichier par store dans `src/lib/stores/`
- Nommage : `{domain}-store.ts`
- Interface d'etat typee, actions dans le store
- Pas d'effets de bord dans le store — les mettre dans les hooks ou services

## CVA Variants

- Utiliser `cva()` de `class-variance-authority` pour les variantes de composants
- Exporter `buttonVariants` (ou equivalent) pour usage externe
- Combiner avec `cn()` pour les overrides
