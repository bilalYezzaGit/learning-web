# Contexte : simplify-ui

> **Cree** : 2025-02-05
> **Statut** : En cours
> **GitHub Issue** : #2 (https://github.com/bilalYezzaGit/learning-web/issues/2)
> **Objectif** : Simplifier le frontend en utilisant shadcn blocks et en inlinant les patterns inutiles

---

## Objectif detaille

Reduire le nombre de fichiers et la complexite en :
1. Remplacant les layouts custom par des shadcn blocks
2. Inlinant les patterns simples directement dans les pages
3. Gardant uniquement les composants metier necessaires

---

## Recherche et inventaire

### Analyse des composants actuels

| Fichier | Lignes | Decision | Raison |
|---------|--------|----------|--------|
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
| `bottom-nav.tsx` | 50 | SHADCN BLOCK | Mobile nav |
| **layout/** | | | |
| `app-shell.tsx` | 47 | SHADCN BLOCK | sidebar-07 |
| `header.tsx` | 90 | SHADCN BLOCK | Simplifier |
| `sidebar.tsx` | 80 | SHADCN BLOCK | sidebar-07 |
| `mobile-nav.tsx` | 80 | SHADCN BLOCK | Sheet nav |
| **qcm/** | | | |
| Tous | ~350 | GARDER | Logique metier |

### Shadcn Blocks a utiliser

| Block | Usage | URL |
|-------|-------|-----|
| sidebar-07 | Layout principal | ui.shadcn.com/blocks#sidebar-07 |
| login-01 | Page login | ui.shadcn.com/blocks#login-01 |

### Estimation impact

| Metrique | Avant | Apres | Delta |
|----------|-------|-------|-------|
| Fichiers components | 32 | ~24 | -8 |
| Lignes patterns/ | ~900 | ~600 | -300 |
| Lignes sections/ | ~400 | ~100 | -300 |
| Lignes layout/ | ~300 | ~200 | -100 |

**Total estime : -700 lignes, -8 fichiers**

---

## Contraintes

- Ne pas casser les fonctionnalites existantes
- Garder le meme look & feel global
- Les composants metier (QCM, scan) restent intacts
- Tester chaque page apres modification

---

## Definition of Done

- [ ] Layout remplace par shadcn block (sidebar-07)
- [ ] patterns/module-card inline dans pages
- [ ] patterns/activity-card inline dans pages
- [ ] sections/module-list supprime (inline)
- [ ] sections/activity-list supprime (inline)
- [ ] Doublons supprimes (sections/header, sections/sidebar)
- [ ] npm run build OK
- [ ] npm run lint OK
- [ ] Test manuel de toutes les pages
