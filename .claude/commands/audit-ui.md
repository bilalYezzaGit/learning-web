Audit UI/UX complet : lance 3 audits specialises en parallele puis compile un plan d'action unifie.

**Argument** : $ARGUMENTS

---

## Scope

- **Avec argument** (ex: `/audit-ui src/components/login-form.tsx`) : audite uniquement ce scope
- **Sans argument** (`/audit-ui`) : audite `src/app/` + `src/components/`

Determine le scope maintenant :
- Si `$ARGUMENTS` est vide ou absent → scope = `src/app/**/*.tsx` + `src/components/**/*.tsx`
- Sinon → scope = `$ARGUMENTS`

---

## Phase 1 — 3 audits en parallele

Lance **3 agents `general-purpose` via le Task tool dans un seul message** (pour le vrai parallelisme). Chaque agent recoit le scope determine ci-dessus.

### Agent 1 — Web Interface Guidelines

```
subagent_type: general-purpose
description: Audit Web Interface Guidelines
prompt: |
  Tu es un auditeur UI specialise dans les Web Interface Guidelines de Vercel.

  ## Ta mission

  Auditer les fichiers .tsx du scope suivant : {SCOPE}

  ## Etapes

  1. Utilise WebFetch pour recuperer les guidelines depuis :
     https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md

  2. Lis le fichier `.agents/skills/web-design-guidelines/SKILL.md` pour le contexte de ce skill.

  3. Utilise Glob pour lister tous les fichiers `.tsx` du scope.

  4. Lis chaque fichier et evalue-le contre TOUTES les regles des guidelines fetches.

  5. Ecris ton rapport dans `docs/audits/01-web-interface-guidelines.md`.

  ## Format du rapport

  ```markdown
  # Audit 1 — Web Interface Guidelines

  Date : {DATE}
  Source : vercel-labs/web-interface-guidelines

  ---

  ## Problemes transversaux (toute l'app)

  1. **{description}** — `{fichier}:{ligne}` — {detail}

  ---

  ## {fichier relatif}

  ```
  :{ligne} - {description du probleme}
  :{ligne} - {description du probleme}
  ```

  (repeter pour chaque fichier avec des issues)

  ## Fichiers OK

  ```
  {fichier}    ✓ pass
  ```

  ---

  ## Top 3 chantiers

  1. **{titre}** — {nb fichiers}, {description}
  ```

  ## Regles importantes
  - Format terse : `fichier:ligne - description`
  - Lister les problemes transversaux (qui touchent toute l'app) en premier
  - Lister les fichiers sans issue dans "Fichiers OK"
  - Finir par les 3 chantiers a plus fort impact
```

### Agent 2 — UI/UX Pro Max

```
subagent_type: general-purpose
description: Audit UI/UX Pro Max
prompt: |
  Tu es un auditeur UI/UX specialise.

  ## Ta mission

  Auditer les fichiers .tsx du scope suivant : {SCOPE}

  ## Etapes

  1. Lis le fichier `.agents/skills/ui-ux-pro-max/SKILL.md` pour recuperer les guidelines.
     Concentre-toi sur :
     - Quick Reference sections 1-8 (Accessibility, Touch & Interaction, Performance, Layout & Responsive, Typography & Color, Animation, Style Selection, Charts & Data)
     - Common Rules for Professional UI
     - Pre-Delivery Checklist

  2. Utilise Glob pour lister tous les fichiers `.tsx` du scope.

  3. Lis chaque fichier et evalue-le contre les criteres du skill.

  4. Ecris ton rapport dans `docs/audits/02-ui-ux-pro-max.md`.

  ## Format du rapport

  ```markdown
  # Audit 2 — UI/UX Pro Max

  Date : {DATE}
  Source : skill ui-ux-pro-max (design intelligence)

  ---

  ## Methodologie

  {nb} fichiers audites contre les criteres UI/UX Pro Max : accessibilite, touch & interaction, performance, layout & responsive, typographie & couleur, animation.

  ---

  ## Issues par fichier

  ### {fichier relatif}

  ```
  {SEVERITY}  :{ligne} - {description du probleme}
  ```

  (repeter pour chaque fichier avec des issues)

  ### Fichiers OK

  ```
  {fichier}    ✓ pass
  ```

  ---

  ## Resume par severite

  ### CRITICAL (a corriger immediatement)

  | # | Issue | Fichier(s) |
  |---|-------|------------|
  | 1 | {description} | `{fichier}:{ligne}` |

  ### HIGH (a corriger rapidement)

  | # | Issue | Fichier(s) |
  |---|-------|------------|

  ---

  ## Quick Wins (< 5 min chacun)

  1. **{titre}** — {description}

  ---

  ## Recommandations architecturales

  ### A. {titre}

  {description + code exemple si pertinent}
  ```

  ## Severites disponibles
  - CRITICAL : casse l'accessibilite ou l'UX de base
  - HIGH : probleme UX significatif
  - MEDIUM : amelioration notable
  - LOW : polish
```

### Agent 3 — Frontend Design

```
subagent_type: general-purpose
description: Audit Frontend Design
prompt: |
  Tu es un auditeur de qualite design frontend.

  ## Ta mission

  Auditer les fichiers .tsx du scope suivant : {SCOPE}

  ## Etapes

  1. Lis le fichier `.agents/skills/frontend-design/SKILL.md` pour recuperer les guidelines de design.

  2. Lis `src/app/globals.css` pour comprendre le systeme de design (variables CSS, theme, tokens).

  3. Lis `src/app/layout.tsx` pour comprendre le setup fonts et le layout root.

  4. Utilise Glob pour lister tous les fichiers `.tsx` du scope.

  5. Lis chaque fichier et evalue-le sur ces axes :
     - **Typographie** : choix de polices, poids, hierarchie, text-balance, tabular-nums
     - **Couleur & Theme** : palette, tokens vs couleurs hardcodees, coherence light/dark
     - **Composition spatiale & Layout** : spacing, creativite, asymetrie, white space
     - **Motion & Animation** : transitions, entrees, reduced-motion
     - **Details visuels & Polish** : fonds, textures, ombres, bordures, atmosphere
     - **Qualite des composants** : etats (hover, focus, loading, empty, error), feedback
     - **Identite design** : memorabilite, lien avec le domaine, originalite vs template

  6. Ecris ton rapport dans `docs/audits/03-frontend-design.md`.

  ## Format du rapport

  ```markdown
  # Audit 3 — Frontend Design Quality

  Date : {DATE}
  Source : skill frontend-design (Anthropic)

  ---

  ## Score global : X / 10

  {Resume en 3-4 phrases de l'impression generale}

  ---

  ## 1. Typographie — X/10

  ### {sous-titre du probleme}
  - `{fichier}:{ligne}` — {description}

  ### Observations
  - {point}

  ---

  ## 2. Couleur & Theme — X/10

  {meme format}

  ## 3. Composition spatiale & Layout — X/10
  ## 4. Motion & Animation — X/10
  ## 5. Details visuels & Polish — X/10
  ## 6. Qualite des composants — X/10
  ## 7. Identite design — X/10

  ---

  ## Top 5 ameliorations a plus fort impact

  1. **{titre}** — {description actionnable}

  ---

  ## Ce que l'app fait bien

  - {point positif}

  ---

  ## Ce qui rendrait l'app memorable

  - **{titre}** {description}
  ```

  ## Important
  - Donner un score /10 pour chaque axe ET un score global
  - Etre specifique avec les fichiers et lignes
  - Distinguer les bugs (font-serif non mappee) des choix design (palette achromatique)
  - Terminer par le positif et les pistes inspirantes
```

---

## Phase 2 — Compilation du plan d'action

Une fois les 3 agents termines :

1. **Lis les 3 rapports** :
   - `docs/audits/01-web-interface-guidelines.md`
   - `docs/audits/02-ui-ux-pro-max.md`
   - `docs/audits/03-frontend-design.md`

2. **Deduplique** : les memes issues signalees par plusieurs audits doivent etre fusionnees (noter les audits sources).

3. **Groupe en lots thematiques** suivant ce schema :
   - **Lot A** — Quick wins (corrections < 5 min, 1 ligne chacune)
   - **Lot B** — Accessibility (skip link, aria-*, keyboard nav)
   - **Lot C** — Forms (autocomplete, validation, touch targets)
   - **Lot D** — Motion (reduced-motion, transitions, animations)
   - **Lot E** — Typography (fonts, text-balance, tabular-nums)
   - **Lot F** — Color tokens (tokens semantiques, migration couleurs hardcodees)
   - **Lot G** — Components (fixes specifiques par composant)
   - **Lot H** — Design identity (palette, atmosphere, branding)

   Note : adapte les lots selon les findings reels. Certains lots peuvent etre vides ou fusionnes.

4. **Ecris le plan dans `docs/audits/PLAN.md`** avec ce format :

```markdown
# Plan d'action UI/UX

**Date** : {DATE}
**Sources** : 3 audits (`docs/audits/01-web-interface-guidelines.md`, `02-ui-ux-pro-max.md`, `03-frontend-design.md`)

---

## Objectif

{1-2 phrases decrivant l'objectif global}

---

## Vue d'ensemble

| Lot | Titre | Severite | Effort | Remarques |
|-----|-------|----------|--------|-----------|
| A | Quick wins (1 ligne chacun) | CRITICAL-LOW | ~XX min total | {nb} corrections |
| B | ... | ... | ... | ... |

---

## Lot A — Quick wins

Corrections atomiques, < 5 min chacune. Aucune dependance.

| # | Correction | Fichier | Audits |
|---|-----------|---------|--------|
| A1 | {description} | `{fichier}` | {1, 2, 3} |

---

## Lot B — {Titre}

**Probleme** : {description du probleme commun}

**Solution** : {approche proposee}

| # | Tache | Fichier |
|---|-------|---------|
| B1 | {description} | `{fichier}:{ligne}` |

**Signale par** : Audit {X, Y}

---

(repeter pour chaque lot)

---

## Ordre d'execution recommande

```
Lot A (quick wins)          ~XX min
  ↓
Lot B (...)                 ~XX min
  ↓
...
```

---

## Ce que l'app fait bien (a preserver)

- {point positif issu des audits}
```

5. **Resume les resultats** a l'utilisateur dans le chat :
   - Nombre total d'issues par severite
   - Lots identifies avec effort estime
   - Lien vers `docs/audits/PLAN.md`
