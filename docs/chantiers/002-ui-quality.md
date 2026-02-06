# Chantier 002 — Qualite UI/UX & Design

**Statut** : En cours
**Date** : 2026-02-06
**Sources** : 3 audits (`docs/audits/01-web-interface-guidelines.md`, `02-ui-ux-pro-max.md`, `03-frontend-design.md`)

---

## Objectif

Amener l'application d'un prototype fonctionnel a un produit fini : accessibilite, interactions clavier, feedback utilisateur, identite visuelle, polish.

---

## Vue d'ensemble

| Lot | Titre | Severite | Effort | Remarques |
|-----|-------|----------|--------|-----------|
| A | Quick wins (1 ligne chacun) | CRITICAL-LOW | ~30 min total | ✅ 8/8 corrections appliquees |
| B | Cards interactives accessibles | CRITICAL | ~1h | ✅ `InteractiveCard` cree, 3 fichiers migres |
| C | Formulaires auth | HIGH | ~2h | ✅ autocomplete, spellCheck, aria-hidden SVG, touch targets |
| D | Accessibilite globale | HIGH | ~1h30 | ✅ Skip link, aria-hidden ~15 icones, aria-live, aria-label |
| E | Motion & reduced-motion | HIGH | ~30 min | ✅ Media query + transition-all fixes |
| F | Typographie | MEDIUM | ~30 min | ✅ text-balance 7 headings, tabular-nums ~10 valeurs |
| G | Tokens couleur semantiques | MEDIUM | ~1h | ✅ G1 tokens definis (success/info/warning) — G2 migration partielle |
| H | Composants specifiques | MEDIUM | ~1h30 | ✅ QCM focus ring, overscroll-contain, scan-upload label |
| I | Identite visuelle | LOW | ~variable | Palette, atmosphere, branding (chantier design separe) |

---

## Lot A — Quick wins

Corrections atomiques, < 5 min chacune. Aucune dependance.

| # | Correction | Fichier | Audits |
|---|-----------|---------|--------|
| A1 | Ajouter `<Toaster />` au root layout | `src/app/layout.tsx` | 2 |
| A2 | Ajouter `--font-serif: var(--font-source-serif), ui-serif, Georgia, serif` dans `@theme inline` | `src/app/globals.css` | 2, 3 |
| A3 | Ajouter `aria-label="Se deconnecter"` au bouton logout | `src/components/profile-sheet.tsx:155` | 1, 2 |
| A4 | Ajouter `role="alert"` sur les divs erreur auth | `login-form.tsx:72`, `signup-form.tsx:96` | 1, 2 |
| A5 | Renommer "Dashboard" en "Tableau de bord" | `src/components/app-sidebar.tsx:68` | 2 |
| A6 | Ajouter `flex-wrap` sur la barre stats admin | `src/app/admin/content/page.tsx:118` | 2 |
| A7 | Remplacer `"..."` par `"…"` (ellipsis) | `login-form.tsx:102`, `signup-form.tsx:160`, `select-parcours/page.tsx:41` | 1 |
| A8 | Ajouter `suppressHydrationWarning` sur `<html>` | `src/app/layout.tsx:46` | 2 |

---

## Lot B — Cards interactives accessibles

**Probleme** : 3 composants utilisent `<Card onClick>` (un `<div>`) sans `role="button"`, `tabIndex`, ni `onKeyDown`. Les utilisateurs clavier ne peuvent pas interagir.

**Solution** : Creer un composant `InteractiveCard` reutilisable, puis migrer les 3 fichiers.

| # | Tache | Fichier |
|---|-------|---------|
| B1 | Creer `InteractiveCard` avec `role="button"`, `tabIndex={0}`, `onKeyDown`, `cursor-pointer`, `focus-visible:ring-*` | `src/components/ui/interactive-card.tsx` (nouveau) |
| B2 | Migrer select-parcours | `src/app/select-parcours/page.tsx:59` |
| B3 | Migrer module-card | `src/components/patterns/module-card.tsx:31` |
| B4 | Migrer activity-card + ajouter `aria-disabled="true"` sur etat locked | `src/components/patterns/activity-card.tsx:54` |

**Signale par** : Audit 1, 2

---

## Lot C — Formulaires auth

**Probleme** : Les formulaires login/signup utilisent un `<form>` brut avec `useState`. Pas de `autocomplete`, pas de `spellCheck={false}`, erreurs non associees aux champs, pas de focus sur le premier champ en erreur.

| # | Tache | Fichier |
|---|-------|---------|
| C1 | Ajouter `autocomplete="email"` + `spellCheck={false}` sur l'input email | `login-form.tsx:80`, `signup-form.tsx:104` |
| C2 | Ajouter `autocomplete="current-password"` sur password login | `login-form.tsx:93` |
| C3 | Ajouter `autocomplete="new-password"` sur password + confirm signup | `signup-form.tsx:117,128` |
| C4 | Ajouter `aria-hidden="true"` sur le SVG Google | `login-form.tsx:119`, `signup-form.tsx:176` |
| C5 | Afficher les erreurs inline par champ + focus premier champ en erreur au submit | `signup-form.tsx:45-58` |
| C6 | Ajouter loading spinner a cote du texte submit | `login-form.tsx:102`, `signup-form.tsx:160` |
| C7 | Augmenter la touch target des RadioGroup items (min 44x44px) | `signup-form.tsx:148` |

**Option avancee** : Migrer vers shadcn `<Form>` + `react-hook-form` (fournit auto `aria-describedby`, validation par champ). A evaluer si le scope justifie la migration.

**Signale par** : Audit 1, 2

---

## Lot D — Accessibilite globale

### D1. Skip link

Ajouter un `<a href="#main-content" className="sr-only focus:not-sr-only ...">` dans le root layout et un `id="main-content"` sur le `<main>` principal.

| Fichier | Action |
|---------|--------|
| `src/app/layout.tsx` | Ajouter le skip link |
| `src/app/(parcours)/[parcours]/apprendre/[moduleId]/layout.tsx:50` | Ajouter `id="main-content"` + `aria-label` sur `<main>` |

**Signale par** : Audit 1, 2

### D2. `aria-hidden="true"` sur les icones Lucide decoratives

Les icones SVG Lucide sont annoncees par les lecteurs d'ecran quand elles sont purement decoratives. Ajouter `aria-hidden="true"` sur toutes les icones qui ne portent pas de sens semantique.

**Fichiers concernes** (~15 fichiers, ~30 icones) :
- `(landing)/page.tsx` — BookOpen, Brain, BarChart3
- `exercise-parts.tsx` — CheckCircle, BookOpen, Lightbulb, AlertTriangle
- `course-timeline.tsx` — Check
- `activity-card.tsx` — icones decoratives
- `select-parcours/page.tsx` — GraduationCap
- `apprendre/page.tsx` — BookOpen, ChevronRight
- `reviser/page.tsx` — BookOpen
- `[parcours]/page.tsx` — BookOpen, Brain
- Et tous les autres fichiers avec des icones decoratives

**Signale par** : Audit 1, 2

### D3. `aria-live` pour le contenu dynamique

Ajouter `aria-live="polite"` sur les zones qui changent dynamiquement :

| Fichier | Zone |
|---------|------|
| `qcm-player.tsx:274` | Score display |
| `qcm-player.tsx:262` | Explication apres validation |
| `scan-upload.tsx:161` | Etat d'analyse |

**Signale par** : Audit 1, 2

### D4. `aria-label` sur les boutons icon-only

| Fichier | Bouton |
|---------|--------|
| `nav-apprendre.tsx:48` | ChevronRight — `aria-label="Ouvrir"` |

Note : `profile-sheet.tsx:155` (logout) est dans le Lot A (A3).

**Signale par** : Audit 1

---

## Lot E — Motion & reduced-motion

### E1. Media query globale `prefers-reduced-motion`

Ajouter dans `globals.css` :

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### E2. Remplacer `transition-all` par des transitions explicites

| Fichier | Ligne | Remplacement |
|---------|-------|-------------|
| `course-timeline.tsx:280` | `transition-all` | `transition-colors` ou `transition-[color,background-color]` |
| `activity-card.tsx:56` | `transition-all` | `transition-[shadow,border-color]` |
| `select-parcours/page.tsx:61` | `transition-all` | `transition-[shadow,border-color]` |

**Signale par** : Audit 1, 2, 3

---

## Lot F — Typographie

### F1. `text-balance` sur les headings

Ajouter `text-balance` sur tous les `<h1>` et `<h2>` :

| Fichier | Ligne |
|---------|-------|
| `(landing)/page.tsx` | `:29` (h1), `:54`, `:104`, `:135` (h2) |
| `select-parcours/page.tsx` | `:52` (h1) |
| `apprendre/page.tsx` | `:48` (h1) |
| `reviser/page.tsx` | `:58` (h1) |
| `result/page.tsx` | `:38` (h1) |

**Signale par** : Audit 1, 3

### F2. `tabular-nums` sur les valeurs numeriques

| Fichier | Valeurs |
|---------|---------|
| `module-card.tsx:71` | Pourcentage de progression |
| `qcm-player.tsx:191,275` | Fraction progression, score |
| `profile-sheet.tsx:249` | Statistiques utilisateur |
| `reviser-client.tsx:71,82,93` | Stats series |

**Signale par** : Audit 1

---

## Lot G — Tokens couleur semantiques

**Probleme** : 30+ instances de couleurs Tailwind hardcodees (`bg-green-100`, `text-green-600`, `bg-blue-50`, etc.) dans les composants pour success/info/warning/error. Non integrees au dark mode system.

**Solution** : Definir des tokens dans `globals.css`, puis migrer les usages.

### G1. Definir les tokens

```css
:root {
  --success: oklch(...);
  --success-foreground: oklch(...);
  --info: oklch(...);
  --info-foreground: oklch(...);
  --warning: oklch(...);
  --warning-foreground: oklch(...);
}
.dark {
  --success: oklch(...);
  /* etc. */
}
```

### G2. Migrer les fichiers

| Fichier | Couleurs hardcodees |
|---------|-------------------|
| `exercise-parts.tsx` | green-200/50/600, blue-200/50/600, amber-200/50/600, red-200/50/600 |
| `profile-sheet.tsx:245-296` | green-100/600, blue-100/600 |
| `result/page.tsx:35` | green-100/600/900 |
| `qcm-player.tsx` | green/red pour correct/incorrect |
| `activity-card.tsx` | success/primary tokens (partiellement fait) |

**Signale par** : Audit 2, 3

---

## Lot H — Composants specifiques

### H1. QCM Player

| # | Tache | Ligne |
|---|-------|-------|
| H1a | Ajouter `focus-visible:ring-2 focus-visible:ring-ring` sur les boutons option | `:211` |
| H1b | Verifier la closure stale du `useEffect` keyboard handler | `:77` |
| H1c | Ajouter `aria-live="polite"` sur le score | `:274` |

**Signale par** : Audit 1, 2

### H2. Course Timeline

| # | Tache | Ligne |
|---|-------|-------|
| H2a | Corriger le chevauchement du bouton fixed mobile avec le header | `:613` |
| H2b | Ajouter `overscroll-behavior: contain` sur le SheetContent | `:623` |
| H2c | Remplacer les child selectors `[&>svg]` fragiles | `:355` |
| H2d | Verifier que `text-[13px]` est lisible sur mobile | `:295` |

**Signale par** : Audit 1, 2

### H3. Scan Upload

| # | Tache | Ligne |
|---|-------|-------|
| H3a | Ajouter un label accessible au `<input type="file">` | `:202` |
| H3b | Ajouter `width`/`height` explicites sur l'`<img>` preview (ou migrer vers `next/image`) | `:167` |
| H3c | Rendre la drop zone accessible au clavier (`tabIndex`, `onKeyDown`) | `:212` |

**Signale par** : Audit 1, 2

### H4. Exercise Parts

| # | Tache | Ligne |
|---|-------|-------|
| H4a | Ameliorer la visibilite du focus ring des `<summary>` sur les fonds colores | `:27,41,55,69` |

**Signale par** : Audit 2

### H5. Profile Sheet

| # | Tache | Ligne |
|---|-------|-------|
| H5a | Ajouter `overscroll-behavior: contain` sur le SheetContent | `:66` |

**Signale par** : Audit 1

---

## Lot I — Identite visuelle (chantier design)

Ce lot est un chantier design a part entiere. Les remarques sont issues de l'audit 3 (frontend-design) et concernent l'identite visuelle du produit, pas des bugs techniques.

### Constats

- Palette 100% achromatique (gris purs, zero couleur)
- `viewport.themeColor` est `#9F6B53` (terracotta) mais jamais utilise dans l'UI
- Inter est generique. Source Serif 4 n'est pas rendu (bug font-serif, corrige au Lot F)
- Fonds plats partout, aucune atmosphere (gradient, texture, motif)
- Panneau lateral auth = rectangle noir plat
- Landing page layout generique (hero centre, sections separees par Separator)
- Aucun lien visuel avec le domaine math/education ou la culture marocaine
- Pas de logo ou wordmark distinctif

### Pistes

| Piste | Impact | Effort |
|-------|--------|--------|
| Palette terracotta/chaude inspiree de la culture marocaine | Fort | Moyen |
| Motifs geometriques CSS (zellige) en fond de surfaces cles | Fort | Moyen |
| Gradient ou radial-gradient sur le panneau auth | Moyen | Faible |
| Animations d'entree staggerees sur les grilles de cards | Moyen | Faible |
| Animation de celebration sur la page result | Moyen | Faible |
| Layout landing asymetrique avec elements math decoratifs | Fort | Eleve |
| Wordmark "Learning OS" avec le serif + couleur de marque | Moyen | Faible |

Ce lot sera detaille dans un chantier separe quand les lots A-H seront traites.

---

## Ordre d'execution recommande

```
Lot A (quick wins)          ~30 min    — debloquer les CRITICAL sans risque
  ↓
Lot B (cards interactives)  ~1h        — CRITICAL accessibilite
  ↓
Lot E (motion)              ~30 min    — media query globale + transition-all
  ↓
Lot D (a11y globale)        ~1h30      — skip link, aria-hidden, aria-live
  ↓
Lot F (typographie)         ~30 min    — text-balance, tabular-nums
  ↓
Lot C (formulaires auth)    ~2h        — autocomplete, erreurs, touch targets
  ↓
Lot G (tokens couleur)      ~1h        — extraire les couleurs hardcodees
  ↓
Lot H (composants)          ~1h30      — QCM, timeline, scan-upload, exercise-parts
  ↓
Lot I (identite visuelle)   variable   — chantier design separe
```

---

## Ce que l'app fait bien (a preserver)

- Architecture code excellente (Server Components par defaut, separation claire des responsabilites)
- Skeletons de loading implementes pour Apprendre et Reviser
- Course Timeline bien engineer avec UX reflechie (accordion, progress, responsive)
- Exercise parts avec langage visuel color-code clair (vert/bleu/ambre/rouge)
- QCM Player avec raccourcis clavier (1-4, Enter, Space)
- `tabular-nums` utilise dans le course-timeline
- Responsive correct sur tous les breakpoints
- Dark mode structurellement complet
- Etats vides geres (empty state avec icones et messages)
- Spacing consistant avec l'echelle Tailwind
- Icones 100% Lucide, tailles coherentes
