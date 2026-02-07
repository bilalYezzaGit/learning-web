# Plan d'action UI/UX

**Date** : 2026-02-07
**Sources** : 3 audits (`docs/audits/01-web-interface-guidelines.md`, `02-ui-ux-pro-max.md`, `03-frontend-design.md`)

---

## Objectif

Amener l'application d'un prototype fonctionnel (4.5/10 design) a un produit fini : corriger les issues d'accessibilite et d'UX restantes (HIGH), unifier les couleurs dans le systeme de tokens, puis construire une identite visuelle memorable.

---

## Vue d'ensemble

| Lot | Titre | Severite | Effort | Remarques |
|-----|-------|----------|--------|-----------|
| A | Quick wins (1 ligne chacun) | HIGH-LOW | ~30 min total | 11 corrections atomiques |
| B | Accessibilite (aria-hidden sweep) | HIGH-MEDIUM | ~1h | ~60 icones dans ~25 fichiers |
| C | Interactions & formulaires | HIGH-MEDIUM | ~1h30 | Clavier, closures, nesting |
| D | Motion & animation | MEDIUM | ~2h | Countdown, stagger, skeletons |
| E | Typographie | MEDIUM | ~30 min | Tailles minimum, placeholders |
| F | Tokens couleur semantiques | MEDIUM | ~1h30 | 40+ couleurs hardcodees a migrer |
| G | Composants specifiques | HIGH-MEDIUM | ~2h | Timeline, QCM, admin, scan-upload |
| H | Identite visuelle | LOW | variable | Palette, atmosphere, branding |

**Totaux** : 0 CRITICAL, 12 HIGH, ~15 MEDIUM, ~15 LOW

Note : tous les CRITICAL du precedent audit (2026-02-06) ont ete corriges (InteractiveCard, Toaster, font-serif, aria-label logout, prefers-reduced-motion, role="alert").

---

## Lot A — Quick wins

Corrections atomiques, < 5 min chacune. Aucune dependance.

| # | Correction | Fichier | Audits |
|---|-----------|---------|--------|
| A1 | Remplacer `100vh` par `100svh` (4 occurrences) | `reviser/serie/[id]/layout.tsx:31`, `serie-player.tsx:53,151,193` | 2 |
| A2 | Ajouter `cursor-pointer` aux Cards navigation | `[parcours]/page.tsx:54,70` | 2 |
| A3 | Ajouter `<SheetDescription className="sr-only">` dans AuthenticatedContent | `profile-sheet.tsx:66` | 2 |
| A4 | Fixer les URLs du command-menu (prefixer `/{parcours}/`) | `command-menu.tsx:29-44` | 2 |
| A5 | Remplacer `"..."` par `"\u2026"` dans les textes de chargement | `moduleId/loading.tsx:4`, `serie/loading.tsx:4`, `scan-upload.tsx:173`, `profile-sheet.tsx:426` | 1 |
| A6 | Ajouter `color-scheme: dark` sur `<html>` en mode sombre | `layout.tsx:47` ou `globals.css` | 1 |
| A7 | Ajouter `touch-action: manipulation` globalement | `globals.css` | 1 |
| A8 | Ajouter `<link rel="preconnect">` pour les domaines Firebase | `layout.tsx` | 1 |
| A9 | Proteger `new Date().getFullYear()` contre mismatch hydratation | `(landing)/page.tsx:158` | 1 |
| A10 | Ajouter `min-h-[44px]` aux tag buttons admin | `atom-filters.tsx:98` | 2 |
| A11 | Ajouter `<Label className="sr-only">` pour l'input recherche admin | `atom-filters.tsx:72` | 2 |

---

## Lot B — Accessibilite (aria-hidden sweep)

**Probleme** : ~60 icones Lucide decoratives sans `aria-hidden="true"` dans ~25 fichiers. Les content/ components (lesson-parts, exercise-parts) le font correctement mais les pages app, sidebar, stats, et timeline ne le font pas.

| # | Tache | Fichiers concernes |
|---|-------|--------------------|
| B1 | Ajouter `aria-hidden="true"` sur toutes les icones decoratives | `(landing)/page.tsx`, `[parcours]/page.tsx`, `[moduleId]/page.tsx`, `activity-client.tsx`, `reviser-client.tsx`, `serie-player.tsx`, `serie-activity-client.tsx`, `result/page.tsx`, `app-sidebar.tsx`, `nav-user.tsx`, `profile-sheet.tsx`, `course-timeline.tsx`, `parcours-banner.tsx`, `activity-card.tsx`, `activity-content.tsx`, `module-card.tsx`, `command-menu.tsx`, `scan-upload.tsx`, `serie/[id]/page.tsx` |
| B2 | Ajouter `aria-pressed` sur les tag buttons de filtre admin | `atom-filters.tsx:98` |
| B3 | Corriger le conflit `<main>` imbrique (un seul `<main>` dans la hierarchie) | `[moduleId]/layout.tsx:50` + `[parcours]/layout.tsx:49` |
| B4 | Ajouter `aria-hidden="true"` sur les icones DropdownMenuItem | `nav-user.tsx:141-149` |

**Signale par** : Audit 1, 2, 3

---

## Lot C — Interactions & formulaires

| # | Tache | Fichier | Audits |
|---|-------|---------|--------|
| C1 | Rendre la drop zone scan-upload accessible au clavier (`tabIndex`, `onKeyDown`) | `scan-upload.tsx:213` | 1, 2 |
| C2 | Corriger le nesting semantique bouton-dans-bouton (Button "Choisir" dans InteractiveCard) | `select-parcours/page.tsx:70` | 1 |
| C3 | Corriger la closure stale du `useEffect` keyboard handler (memoiser avec `useCallback`) | `qcm-player.tsx:77` | 2 |
| C4 | Ajouter un loading/disabled state pendant l'appel async `setParcours` | `select-parcours/page.tsx:39` | 2 |
| C5 | Ajouter `disabled` state pendant `completeExercise` async (prevenir double-click) | `activity-client.tsx:159`, `serie-activity-client.tsx:134` | 2 |

**Signale par** : Audit 1, 2

---

## Lot D — Motion & animation

| # | Tache | Fichier | Audits |
|---|-------|---------|--------|
| D1 | Ajouter un countdown visuel pour l'auto-advance 2s (au lieu de timeout invisible) | `serie-player.tsx:115` | 2 |
| D2 | Remplacer les 2 loading.tsx texte brut par des skeletons coherents | `moduleId/loading.tsx`, `serie/[id]/loading.tsx` | 2, 3 |
| D3 | Ajouter des animations d'entree staggerees sur les grilles de cards | `apprendre/page.tsx`, `reviser-client.tsx`, `landing/page.tsx` | 3 |
| D4 | Ajouter une animation de celebration sur la page result | `result/page.tsx` | 3 |

**Signale par** : Audit 2, 3

---

## Lot E — Typographie

| # | Tache | Fichier | Audits |
|---|-------|---------|--------|
| E1 | Augmenter `text-[11px]` et `text-[13px]` au minimum 14px pour mobile | `course-timeline.tsx:295,306` | 2 |
| E2 | Ajouter `"\u2026"` a la fin des placeholders de recherche | `login-form.tsx:84`, `signup-form.tsx:108`, `atom-filters.tsx:72` | 1 |
| E3 | Ajouter `text-balance` sur les headings restants | `[parcours]/page.tsx:34`, `[moduleId]/page.tsx` | 1, 3 |

**Signale par** : Audit 1, 2, 3

---

## Lot F — Tokens couleur semantiques

**Probleme** : 40+ instances de couleurs Tailwind hardcodees (`bg-green-100`, `text-green-600`, `bg-blue-50`, `bg-amber-100`, etc.). Les tokens `--success`, `--info`, `--warning` existent dans `globals.css:95-100` mais ne sont presque jamais utilises. Le theming global est impossible sans modifier chaque fichier.

**Solution** : Migrer les usages de couleurs hardcodees vers les tokens CSS existants.

| # | Tache | Fichier |
|---|-------|---------|
| F1 | Migrer les couleurs vert hardcodees vers `bg-success/10 text-success` | `activity-client.tsx`, `serie-activity-client.tsx`, `serie-player.tsx`, `result/page.tsx`, `reviser-client.tsx`, `profile-sheet.tsx` |
| F2 | Migrer les couleurs bleu hardcodees vers `bg-info/10 text-info` | `reviser-client.tsx`, `parcours-banner.tsx`, `qcm-player.tsx` |
| F3 | Migrer les couleurs ambre hardcodees vers `bg-warning/10 text-warning` | `profile-sheet.tsx` |
| F4 | Evaluer la migration pour exercise-parts et lesson-parts (couleurs multiples intentionnelles) | `exercise-parts.tsx`, `lesson-parts.tsx` |

**Signale par** : Audit 2, 3

---

## Lot G — Composants specifiques

### G1. Course Timeline

| # | Tache | Ligne |
|---|-------|-------|
| G1a | Corriger le chevauchement du bouton fixed mobile avec le SiteHeader | `:613` |
| G1b | Reduire la largeur du Sheet mobile sur ecrans < 375px (w-80 trop large) | `:623` |

### G2. QCM Player

| # | Tache | Ligne |
|---|-------|-------|
| G2a | Verifier le contraste du focus-visible ring sur les fonds vert/rouge apres validation | `:211` |

### G3. Scan Upload

| # | Tache | Ligne |
|---|-------|-------|
| G3a | Migrer `<img>` vers `next/image` (ou ajouter width/height explicites) | `:166` |

### G4. Admin

| # | Tache | Ligne |
|---|-------|-------|
| G4a | Rendre la page responsive sous md breakpoint (stack vertical + Sheet/Drawer pour preview) | `admin/content/page.tsx:130` |
| G4b | Augmenter les touch targets de la liste d'atomes | `atom-list.tsx:50` |

### G5. Exercise & Activity Content

| # | Tache | Ligne |
|---|-------|-------|
| G5a | Ameliorer la visibilite du focus ring des `<summary>` sur fonds colores | `exercise-parts.tsx:27`, `activity-content.tsx:39` |

### G6. Landing Page

| # | Tache | Ligne |
|---|-------|-------|
| G6a | Rendre les Parcours cards entierement cliquables (pas seulement le Button interne) | `(landing)/page.tsx:111` |
| G6b | Clarifier les feature cards : si non cliquables, retirer l'apparence interactive | `(landing)/page.tsx:54` |

### G7. Profile Sheet

| # | Tache | Ligne |
|---|-------|-------|
| G7a | Ajouter un feedback visuel pour le theme "system" dans le toggle | `profile-sheet.tsx:396` |

**Signale par** : Audit 1, 2, 3

---

## Lot H — Identite visuelle (chantier design)

Ce lot est un chantier design a part entiere. Score actuel : 4.5/10 (design) avec identite a 2/10.

### Constats

- Palette 100% achromatique (`oklch(X 0 0)` partout) — aucune couleur de marque
- `viewport.themeColor: '#9F6B53'` (terracotta) jamais utilise dans l'UI
- Inter = police la plus generique ("AI slop font")
- Fonds plats partout : zero gradient, texture, motif, atmosphere
- Panneau auth = rectangle quasi-noir plat avec texte blanc
- Landing = template SaaS standard (Hero centre > Features > Parcours > CTA)
- Aucun lien visuel avec les mathematiques ou l'education

### Pistes d'amelioration

| # | Piste | Impact | Effort |
|---|-------|--------|--------|
| H1 | Palette terracotta/chaude comme couleur primaire (`oklch(0.55 0.08 55)`) | Fort | Moyen |
| H2 | Remplacer Inter par une sans-serif distinctive (Plus Jakarta Sans, Outfit, Manrope) | Fort | Faible |
| H3 | Atmosphere sur les surfaces cles : gradient auth panel, hero landing, result page | Fort | Moyen |
| H4 | Motifs geometriques CSS (zellige) en fond de surfaces decoratives | Fort | Moyen |
| H5 | Animations d'entree staggerees + celebrations (confetti, scores animes) | Moyen | Moyen |
| H6 | Elements mathematiques decoratifs (KaTeX dans le hero, symboles flottants) | Moyen | Moyen |
| H7 | Wordmark "Learning OS" avec serif + couleur de marque | Moyen | Faible |

---

## Ordre d'execution recommande

```
Lot A (quick wins)               ~30 min   — debloquer les HIGH sans risque
  ↓
Lot B (aria-hidden sweep)        ~1h       — accessibilite mecanique
  ↓
Lot C (interactions)             ~1h30     — clavier, closures, double-click
  ↓
Lot E (typographie)              ~30 min   — tailles min, placeholders, text-balance
  ↓
Lot G (composants specifiques)   ~2h       — timeline, admin, scan-upload, landing
  ↓
Lot F (tokens couleur)           ~1h30     — migrer couleurs hardcodees
  ↓
Lot D (motion & animation)       ~2h       — countdown, skeletons, stagger, celebrations
  ↓
Lot H (identite visuelle)        variable  — chantier design separe
```

---

## Ce que l'app fait bien (a preserver)

- Architecture technique exemplaire (Server Components par defaut, separation claire des responsabilites)
- Lesson-parts : 6 composants color-codes avec icones, fonds et bordures assorties, dark mode — le meilleur design de l'app
- Exercise-parts collapsibles avec `<details>` natifs — zero JS supplementaire
- QCM Player avec raccourcis clavier (1-4, Enter, Space), machine a etats, et feedback immediat
- CourseTimeline robuste : accordion par section, indicateurs multi-etats, responsive mobile/desktop
- InteractiveCard avec accessibilite clavier complete (role, tabIndex, onKeyDown, focus-visible)
- `prefers-reduced-motion` gere globalement dans globals.css
- `tabular-nums` correctement utilise pour les scores et compteurs
- `text-balance` applique sur les headings importants
- Skeletons de chargement pour les pages principales (apprendre, reviser)
- `aria-live="polite"` sur les zones de feedback QCM
- Skip-to-content link accessible
- Dark mode structurellement complet
- Responsive correct sur tous les breakpoints
