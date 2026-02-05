# Contexte : simplify-ui

> **Cree** : 2025-02-05
> **Statut** : En cours
> **GitHub Issue** : #2 (https://github.com/bilalYezzaGit/learning-web/issues/2)
> **Objectif** : Simplifier le frontend en utilisant shadcn blocks et en inlinant les patterns inutiles

---

## Objectif detaille

Reduire le nombre de fichiers et la complexite en :
1. Remplacant les layouts custom par des shadcn blocks
2. Remplacant la page auth par un block login shadcn
3. Utilisant le dashboard block pour la home
4. Inlinant les patterns simples directement dans les pages
5. Gardant uniquement les composants metier necessaires

---

## Recherche et inventaire

### Shadcn Blocks a utiliser

| Block | Usage | Remplace |
|-------|-------|----------|
| `sidebar-07` | Layout principal (collapsible) | layout/*, sections/sidebar |
| `login-04` | Page auth (form + image) | login/page.tsx (285 lignes) |
| `dashboard-01` | Home avec stats + charts | page.tsx custom |

### Analyse des composants actuels

| Fichier | Lignes | Decision | Raison |
|---------|--------|----------|--------|
| **pages/** | | | |
| `login/page.tsx` | 285 | SHADCN BLOCK | login-04 |
| `(main)/page.tsx` | 149 | SHADCN BLOCK | dashboard-01 |
| **patterns/** | | | |
| `module-card.tsx` | 85 | INLINE | Simple Card, utilise 1x |
| `activity-card.tsx` | ~80 | INLINE | Simple Card, utilise 1x |
| `search-bar.tsx` | ~70 | SUPPRIMER | Utiliser Command directement |
| `command-menu.tsx` | ~90 | GARDER | Cmd+K global |
| `qcm-player.tsx` | 350 | GARDER | Logique metier complexe |
| `scan-upload.tsx` | 250 | GARDER | Camera/upload logic |
| **sections/** | | | |
| `module-list.tsx` | 50 | INLINE | Juste un .map() |
| `activity-list.tsx` | 35 | INLINE | Juste un .map() |
| `header.tsx` | 136 | SUPPRIMER | Doublon avec layout/header |
| `sidebar.tsx` | 85 | SUPPRIMER | Doublon avec layout/sidebar |
| `bottom-nav.tsx` | 50 | INTEGRER | Dans sidebar-07 mobile |
| **layout/** | | | |
| `app-shell.tsx` | 47 | SHADCN BLOCK | sidebar-07 |
| `header.tsx` | 90 | SHADCN BLOCK | Integre dans sidebar-07 |
| `sidebar.tsx` | 80 | SHADCN BLOCK | sidebar-07 |
| `mobile-nav.tsx` | 80 | SHADCN BLOCK | sidebar-07 mobile |
| **qcm/** | | | |
| Tous | ~350 | GARDER | Logique metier |

### Estimation impact (revisee)

| Metrique | Avant | Apres | Delta |
|----------|-------|-------|-------|
| Fichiers components | 32 | ~22 | **-10** |
| Lignes login | 285 | ~50 | **-235** |
| Lignes dashboard | 149 | ~80 | **-69** |
| Lignes patterns/ | ~900 | ~600 | **-300** |
| Lignes sections/ | ~400 | ~50 | **-350** |
| Lignes layout/ | ~300 | ~150 | **-150** |

**Total estime : ~1100 lignes en moins, -10 fichiers**

---

## Contraintes

- Ne pas casser les fonctionnalites existantes
- Garder le meme look & feel global
- Les composants metier (QCM, scan) restent intacts
- Conserver la logique auth Firebase (juste changer l'UI)
- Tester chaque page apres modification

---

## Definition of Done

- [ ] Layout remplace par shadcn sidebar-07
- [ ] Page login remplacee par shadcn login-04
- [ ] Dashboard utilise shadcn dashboard-01
- [ ] patterns/module-card inline dans pages
- [ ] patterns/activity-card inline dans pages
- [ ] sections/ nettoye (doublons supprimes)
- [ ] npm run build OK
- [ ] npm run lint OK
- [ ] Test manuel de toutes les pages
- [ ] Chantier archive
