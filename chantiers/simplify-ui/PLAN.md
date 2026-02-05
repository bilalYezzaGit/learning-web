# Plan : simplify-ui

> Statut : En cours
> Pipeline actuel : 0/4

## Pipelines

### 1. Installer shadcn dashboard-01 (layout + home) [ ]
- CODE:
  - `npx shadcn@latest add dashboard-01`
  - Adapter AppSidebar: navigation (Dashboard, Apprendre, Reviser, Profil)
  - Adapter SiteHeader: avatar user avec useAuth, search (Cmd+K)
  - Adapter contenu home: stats, quick actions, modules recents
  - Supprimer anciens: layout/sidebar.tsx, layout/mobile-nav.tsx, layout/header.tsx
  - Mettre a jour app-shell.tsx pour utiliser SidebarProvider
- VERIFY: npm run build + npm run lint + test navigation + test home
- COMMIT: refactor(layout): replace custom layout with shadcn dashboard-01

### 2. Remplacer login par shadcn login-04 [ ]
- CODE:
  - `npx shadcn@latest add login-04`
  - Conserver la logique Firebase (signInWithEmail, signInAnonymously, etc.)
  - Adapter les 3 modes: login, signup, forgot-password
  - Garder les messages d'erreur en francais
  - Supprimer l'ancien login/page.tsx (285 lignes -> ~80)
- VERIFY: npm run build + npm run lint + test auth complet
- COMMIT: refactor(auth): replace custom login with shadcn login-04

### 3. Inline patterns et supprimer sections [ ]
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

### 4. Cleanup final [ ]
- CODE:
  - Verifier tous les imports
  - Nettoyer index.ts exports
  - Supprimer fichiers orphelins
  - Mettre a jour CLAUDE.md si structure change
- VERIFY: npm run build + npm run lint + test TOUTES les pages
- COMMIT: chore: final cleanup after ui simplification

---

## Notes

- Pipeline 1 est le plus gros (layout complet + home)
- Pipeline 2 est independant (page auth separee)
- Pipeline 3-4 sont le nettoyage
- Toujours tester apres chaque pipeline
- Garder qcm/, command-menu, scan-upload intacts

## Blocks utilises

| Block | Contenu |
|-------|---------|
| `dashboard-01` | AppSidebar + SiteHeader + Charts + DataTable |
| `login-04` | Form + Image (standalone, pas de sidebar) |

> sidebar-07 n'est PAS necessaire car dashboard-01 inclut deja la sidebar.
