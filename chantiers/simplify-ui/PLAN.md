# Plan : simplify-ui

> Statut : En cours
> Pipeline actuel : 0/5

## Pipelines

### 1. Installer shadcn sidebar-07 pour le layout [ ]
- CODE:
  - `npx shadcn@latest add sidebar-07`
  - Adapter la navigation (Dashboard, Apprendre, Reviser, Profil)
  - Integrer avatar user avec useAuth
  - Integrer search (Cmd+K)
  - Supprimer anciens: layout/sidebar.tsx, layout/mobile-nav.tsx
  - Mettre a jour app-shell.tsx
- VERIFY: npm run build + npm run lint + test navigation
- COMMIT: refactor(layout): replace custom layout with shadcn sidebar-07

### 2. Remplacer login par shadcn login-04 [ ]
- CODE:
  - `npx shadcn@latest add login-04`
  - Conserver la logique Firebase (signInWithEmail, signInAnonymously, etc.)
  - Adapter les 3 modes: login, signup, forgot-password
  - Garder les messages d'erreur en francais
  - Supprimer l'ancien login/page.tsx (285 lignes -> ~80)
- VERIFY: npm run build + npm run lint + test auth complet
- COMMIT: refactor(auth): replace custom login with shadcn login-04

### 3. Utiliser dashboard-01 pour la home [ ]
- CODE:
  - `npx shadcn@latest add dashboard-01`
  - Adapter les stats (activites, QCM, temps)
  - Adapter les quick actions
  - Adapter les modules recents
  - Remplacer (main)/page.tsx
- VERIFY: npm run build + npm run lint + test dashboard
- COMMIT: refactor(home): use shadcn dashboard-01 block

### 4. Inline patterns et supprimer sections [ ]
- CODE:
  - Inline module-card dans /apprendre
  - Inline activity-card dans /apprendre/[id]
  - Supprimer patterns/module-card.tsx
  - Supprimer patterns/activity-card.tsx
  - Supprimer patterns/search-bar.tsx
  - Supprimer sections/module-list.tsx (inline .map)
  - Supprimer sections/activity-list.tsx (inline .map)
  - Supprimer sections/header.tsx (doublon)
  - Supprimer sections/sidebar.tsx (doublon)
- VERIFY: npm run build + npm run lint
- COMMIT: refactor(ui): inline patterns and remove redundant sections

### 5. Cleanup final [ ]
- CODE:
  - Verifier tous les imports
  - Nettoyer index.ts exports
  - Supprimer fichiers orphelins
  - Mettre a jour CLAUDE.md si structure change
- VERIFY: npm run build + npm run lint + test TOUTES les pages
- COMMIT: chore: final cleanup after ui simplification

---

## Notes

- Pipeline 1-3 sont les shadcn blocks (gros impact)
- Pipeline 4 est le nettoyage des abstractions inutiles
- Pipeline 5 est la verification finale
- Toujours tester apres chaque pipeline
- Garder qcm/, command-menu, scan-upload intacts

## Ordre recommande

1 -> 2 -> 3 -> 4 -> 5 (sequentiel, chaque etape depend de la precedente pour le layout)
