# Plan : simplify-ui

> Statut : En cours
> Pipeline actuel : 0/4

## Pipelines

### 1. Remplacer layout par shadcn sidebar-07 [ ]
- CODE:
  - Telecharger sidebar-07 depuis shadcn blocks
  - Adapter pour notre navigation (Dashboard, Apprendre, Reviser, Profil)
  - Integrer le header avec avatar user (deja fait)
  - Supprimer layout/sidebar.tsx, layout/mobile-nav.tsx anciens
  - Mettre a jour app-shell.tsx
- VERIFY: npm run build + npm run lint + test manuel
- COMMIT: refactor(layout): use shadcn sidebar-07 block

### 2. Inline patterns dans les pages [ ]
- CODE:
  - Page /apprendre : inline ModuleCard (supprimer import)
  - Page /apprendre/[id] : inline ActivityCard
  - Supprimer patterns/module-card.tsx
  - Supprimer patterns/activity-card.tsx
  - Supprimer patterns/search-bar.tsx (utiliser Command direct)
- VERIFY: npm run build + npm run lint
- COMMIT: refactor(ui): inline simple patterns into pages

### 3. Supprimer sections/ inutiles [ ]
- CODE:
  - Inline module-list.tsx (.map direct dans page)
  - Inline activity-list.tsx (.map direct dans page)
  - Supprimer sections/header.tsx (doublon)
  - Supprimer sections/sidebar.tsx (doublon)
  - Garder sections/bottom-nav.tsx si utilise
- VERIFY: npm run build + npm run lint
- COMMIT: refactor(ui): remove redundant section components

### 4. Cleanup et verification finale [ ]
- CODE:
  - Verifier tous les imports
  - Supprimer fichiers orphelins
  - Mettre a jour index.ts exports
- VERIFY: npm run build + npm run lint + test TOUTES les pages
- COMMIT: chore: cleanup after ui simplification

---

## Notes

- Pipeline 1 est le plus impactant (layout complet)
- Pipelines 2 et 3 sont independants, peuvent etre faits en parallele
- Toujours tester les pages apres chaque pipeline
- Garder qcm/, command-menu, scan-upload intacts
