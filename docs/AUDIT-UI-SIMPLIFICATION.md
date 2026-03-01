# Audit UI/UX : Simplification du codebase

> Analyse exhaustive du 01/03/2026 — 130 fichiers TypeScript, 13 297 LOC total dans `src/`

---

## Sommaire

- [A. Code mort et composants inutilises](#a-code-mort-et-composants-inutilises)
- [B. Duplication de code](#b-duplication-de-code)
- [C. Over-engineering et complexite excessive](#c-over-engineering-et-complexite-excessive)
- [D. Violations des regles du projet](#d-violations-des-regles-du-projet)
- [E. Documentation obsolete](#e-documentation-obsolete)
- [F. Plan d'action classe par impact/importance](#f-plan-daction-classe-par-impactimportance)

---

## A. Code mort et composants inutilises

### A1. Composants shadcn/ui installes mais jamais importes

| Composant | LOC | Importe par | Verdict |
|-----------|-----|-------------|---------|
| `ui/alert.tsx` | 66 | **Aucun fichier** | SUPPRIMER |
| `ui/dialog.tsx` | 158 | **Aucun fichier** | SUPPRIMER |

**Total supprimable : 224 LOC**

### A2. Composants shadcn/ui utilises par un seul fichier (candidats a surveiller)

| Composant | LOC | Seul consommateur |
|-----------|-----|-------------------|
| `ui/scroll-area.tsx` | 58 | `profile-sheet.tsx` |
| `ui/radio-group.tsx` | 48 | `signup-form.tsx` |
| `ui/tooltip.tsx` | 57 | `ui/sidebar.tsx` (usage interne shadcn) |
| `ui/select.tsx` | 190 | `reviser-client.tsx` |
| `ui/interactive-card.tsx` | 47 | `select-parcours/page.tsx` |
| `ui/accordion.tsx` | 75 | `course-timeline.tsx` |
| `ui/dropdown-menu.tsx` | 257 | `nav-user.tsx` |

> Ce ne sont pas des suppressions a faire. C'est un signal que certains composants complexes (dropdown-menu 257 LOC, select 190 LOC) servent tres peu. A garder en tete si on veut reduire le bundle.

### A3. Exports de fonctions/methodes jamais appeles

| Export | Fichier | LOC | Verdict |
|--------|---------|-----|---------|
| `logWarning()` | `lib/services/error-logger.ts` | 10 | SUPPRIMER |
| `resetAllProgress()` | `lib/services/progress-service.ts` | 15 | SUPPRIMER |
| `resetProgress()` + `isResetting` | exposes par `use-progress.ts` | ~25 | SUPPRIMER (jamais consomme par aucun composant) |

**Total supprimable : ~50 LOC**

### A4. Zustand : mentionne mais inexistant

- Mentionne dans `CLAUDE.md` ligne "State | Zustand"
- **Aucun** fichier `src/lib/stores/`, **aucun** import de `zustand`, **pas installe** dans `package.json`
- Le state management reel : React Query + React Context + Firestore listeners

---

## B. Duplication de code

### B1. Routes serie dupliquees (~600 LOC)

Les routes `apprendre/[moduleId]/serie/[serieId]/` et `reviser/serie/[id]/` contiennent des fichiers quasi-identiques :

| Fichier | apprendre/serie | reviser/serie | Diff |
|---------|-----------------|---------------|------|
| `page.tsx` (welcome) | 84 LOC | 84 LOC | Seul `baseUrl` change |
| `layout.tsx` | 45 LOC | 45 LOC | Identique |
| `play/page.tsx` | 67 LOC | 66 LOC | Identique |
| `result/page.tsx` | 154 LOC | 164 LOC | Quasi-identique |

**~350 LOC dupliquees** qui pourraient etre des composants partages dans `components/patterns/`.

### B2. Calcul de progression module repete 3 fois

La logique `useMemo(() => calcul done/total/percentage)` est repetee dans :
- `accueil-client.tsx` (335 LOC)
- `apprendre-client.tsx` (242 LOC)
- `module-accueil-client.tsx` (293 LOC)

Chaque fichier recalcule les memes stats de progression sur les memes donnees. Un hook `useModuleProgress(activityIds)` suffirait.

### B3. Composant ModuleListItem duplique

Le rendu d'un module (Card avec icone + titre + badge + progress bar) est code 2 fois :
- dans `accueil-client.tsx` (~100 LOC)
- dans `apprendre-client.tsx` (~100 LOC)

**~100 LOC dupliquees** a extraire dans `components/patterns/module-list-item.tsx`.

### B4. Formulaires auth : structure identique

Les 3 formulaires (login 169, signup 219, reset 129 = **517 LOC**) partagent :
- Meme Card layout (overflow-hidden, grid 2 colonnes, panneau droit colore)
- Meme pattern error/loading state
- Meme FieldGroup structure

Un composant `<AuthFormCard>` (~80 LOC) eliminerait ~150 LOC de duplication.

### B5. Bannieres dismissible : meme pattern 3 fois

`onboarding-banner.tsx`, `email-verification-banner.tsx`, `pwa-install-prompt.tsx` ont la meme structure :
- Card avec icone + texte + bouton dismiss
- localStorage pour persistance

Un composant `<DismissibleBanner>` eliminerait ~60 LOC de duplication.

### B6. local-progress.ts : 2 fonctions quasi-identiques

`setLocalExerciseComplete()` et `setLocalQCMComplete()` different uniquement par le champ `activityType` et le calcul de `status`. Fusionnables en une seule `setLocalComplete()`.

---

## C. Over-engineering et complexite excessive

### C1. `course-timeline.tsx` — 732 LOC (plus gros fichier du projet)

Un seul fichier qui contient :
- 7 interfaces/types
- 6 sous-composants (StepIndicator, ActivityItem, SectionAccordion, FlatActivityList, TimelineHeader, CourseTimeline)
- Logique de groupement par sections (218 LOC pour `groupActivitiesBySections`)
- State management complexe (openSections array, auto-open, auto-scroll)
- Gestion mobile/desktop avec Sheet
- TimelineProvider externe

**Devrait etre** : 4-5 fichiers dans un dossier `course-timeline/` de ~150 LOC chacun.

### C2. `reviser-client.tsx` — 503 LOC

Contient 4 composants dans 1 fichier :
- `ReviserStats`
- `ReviserContent`
- `SeriesList`
- `SeriesListItem`

Plus la logique de filtrage, tri, groupement et recherche. Devrait etre 3-4 fichiers separes.

### C3. `profile-sheet.tsx` — 415 LOC

Contient 5 sous-composants :
- `GuestContent`
- `AuthenticatedContent`
- `StatsTab`
- `ProfilTab`
- `SettingsTab`

Devrait etre 2-3 fichiers separes (les tabs en composants individuels).

### C4. `ui/sidebar.tsx` — 728 LOC (shadcn)

C'est le composant shadcn sidebar generique avec :
- Gestion cookies
- Keyboard shortcuts (Ctrl+B)
- Mobile/desktop responsive
- 20+ sous-composants exportes

**Surdimensionne** pour le projet actuel qui n'utilise qu'une sidebar simple. Un sidebar custom de ~200 LOC ferait le meme travail.

### C5. `timeline-wrapper.tsx` — 136 LOC d'abstraction inutile

Ne fait que mapper des props d'un format a un autre avant de les passer a `CourseTimeline`. Cette couche de transformation pourrait etre integree directement dans `CourseTimeline` ou dans les pages consommatrices.

### C6. `ui/field.tsx` — 248 LOC systeme de formulaire complexe

10 composants exportes (Field, FieldLabel, FieldDescription, FieldError, FieldGroup, etc.) pour un systeme de formulaire surtout utilise dans les 3 pages auth. La complexite du systeme de variants/orientation depasse largement les besoins actuels.

### C7. Landing page inline — 392 LOC

La page `(landing)/page.tsx` contient 5 sections inline + constantes de donnees (MATH_FORMULAS, FEATURES, STATS) dans un seul fichier. Les sections devraient etre des composants separes.

### C8. React Query sous-utilise — 95 LOC d'infra pour 3 mutations

- `query/keys.ts` : 1 seule query key definie
- `query/get-query-client.ts` : Factory 53 LOC
- `query/provider.tsx` : Wrapper 29 LOC
- **Aucun** `useQuery` dans tout le projet, seulement des `useMutation`

Pas un probleme critique (bon investissement futur), mais notable.

---

## D. Violations des regles du projet

### D1. Imports Firebase SDK directs dans les composants

La regle dit : *"All Firebase SDK imports in `src/lib/` only (services encapsulate all calls)"*

**3 violations :**

| Fichier | Import Firebase |
|---------|-----------------|
| `components/login-form.tsx:17` | `import { doc, getDoc } from 'firebase/firestore'` |
| `components/signup-form.tsx:21` | `import { doc, setDoc } from 'firebase/firestore'` |
| `components/email-verification-banner.tsx:5` | `import { sendEmailVerification } from 'firebase/auth'` |

Ces appels Firebase doivent etre deplaces dans `lib/services/auth-service.ts`.

### D2. Barrel exports incoherents

`src/lib/services/index.ts` n'exporte que 2 des 7 services (ProgressService, auth-service). Les 5 autres (error-logger, scan-service, analytics-service, local-progress, content-loader) sont importes directement.

---

## E. Documentation obsolete

| Element | Probleme | Correction |
|---------|----------|------------|
| `CLAUDE.md` "State \| Zustand" | Zustand n'est ni installe ni utilise | Remplacer par "React Query + Context" |
| `CLAUDE.md` "stores/" dans la structure | Le dossier n'existe pas | Retirer la mention |
| `.claude/rules/index.md` | Mentionne indirectement Zustand via CLAUDE.md | Rien a changer (pas de mention directe) |

---

## F. Plan d'action classe par impact/importance

### Tier 1 — Gains immediats, zero risque (30 min)

| # | Action | LOC gagnees | Risque |
|---|--------|-------------|--------|
| 1 | Supprimer `ui/alert.tsx` (0 imports) | -66 | Nul |
| 2 | Supprimer `ui/dialog.tsx` (0 imports) | -158 | Nul |
| 3 | Supprimer `logWarning()` de error-logger.ts | -10 | Nul |
| 4 | Supprimer `resetAllProgress()` de progress-service.ts | -15 | Nul |
| 5 | Supprimer `resetProgress` + `isResetting` de use-progress.ts (+ methode dans service) | -25 | Nul |
| 6 | Corriger CLAUDE.md (Zustand -> React Query + Context, retirer stores/) | 0 | Nul |

**Total : ~274 LOC supprimees, 0 risque de regression**

### Tier 2 — Correction de violations, important (1-2h)

| # | Action | LOC gagnees | Risque |
|---|--------|-------------|--------|
| 7 | Deplacer les 3 imports Firebase des composants vers `lib/services/auth-service.ts` | ~-20 (net) | Faible |
| 8 | Fusionner `setLocalExerciseComplete` + `setLocalQCMComplete` en une seule fonction | ~-30 | Faible |
| 9 | Unifier barrel exports de `lib/services/index.ts` (tout exporter ou tout supprimer) | 0 | Faible |

### Tier 3 — Reduire la duplication, fort impact (4-6h)

| # | Action | LOC gagnees | Risque |
|---|--------|-------------|--------|
| 10 | Extraire hook `useModuleProgress(activityIds)` (remplace 3 useMemo identiques) | ~-80 | Moyen |
| 11 | Extraire `<ModuleListItem>` (composant partage accueil + apprendre) | ~-100 | Moyen |
| 12 | Factoriser les routes serie : composants partages (welcome, result, layout) | ~-350 | Moyen |
| 13 | Creer `<AuthFormCard>` generique pour les 3 formulaires auth | ~-150 | Moyen |

**Total Tier 3 : ~680 LOC de duplication eliminee**

### Tier 4 — Refactoring structurel, complexite reduite (8-12h)

| # | Action | LOC gagnees | Risque |
|---|--------|-------------|--------|
| 14 | Splitter `course-timeline.tsx` (732 LOC) en 4-5 fichiers | 0 (reorganisation) | Moyen |
| 15 | Splitter `reviser-client.tsx` (503 LOC) en 3-4 fichiers | 0 (reorganisation) | Moyen |
| 16 | Splitter `profile-sheet.tsx` (415 LOC) en 2-3 fichiers | 0 (reorganisation) | Faible |
| 17 | Extraire les sections de la landing page (392 LOC) en composants | 0 (reorganisation) | Faible |
| 18 | Supprimer `timeline-wrapper.tsx` (integrer la logique dans course-timeline) | ~-136 | Moyen |

### Tier 5 — Nice to have, peu urgent

| # | Action | LOC gagnees | Risque |
|---|--------|-------------|--------|
| 19 | Creer `<DismissibleBanner>` generique (3 bannieres) | ~-60 | Faible |
| 20 | Creer hook `useLocalStorageState` (centraliser 4+ usages de localStorage) | ~-40 | Faible |
| 21 | Simplifier `ui/field.tsx` (retirer les variants non utilisees) | ~-50 | Faible |
| 22 | Remplacer `ui/sidebar.tsx` (728 LOC shadcn) par un sidebar custom plus leger | ~-500 | Eleve |
| 23 | Evaluer si React Query justifie ses 95 LOC d'infra pour 3 mutations | 0 | - |

---

## Resume chiffre

| Categorie | LOC actuelles | LOC supprimables | Gain % |
|-----------|---------------|------------------|--------|
| Code mort (Tier 1) | 274 | 274 | 100% |
| Violations (Tier 2) | ~50 | ~50 | 100% |
| Duplication (Tier 3) | ~680 | ~680 | 100% |
| Reorganisation (Tier 4) | ~2178 | ~136 | 6% (mais lisibilite x2) |
| Nice to have (Tier 5) | ~650 | ~650 | Optionnel |
| **Total potentiel** | | **~1790 LOC** | **13.4% du codebase** |

---

## Fichiers les plus volumineux (top 10)

| Rang | Fichier | LOC | Statut |
|------|---------|-----|--------|
| 1 | `course-timeline.tsx` | 732 | Trop complexe, splitter |
| 2 | `ui/sidebar.tsx` | 728 | shadcn, surdimensionne |
| 3 | `reviser-client.tsx` | 503 | Trop complexe, splitter |
| 4 | `profile-sheet.tsx` | 415 | Trop complexe, splitter |
| 5 | `(landing)/page.tsx` | 392 | Sections a extraire |
| 6 | `accueil-client.tsx` | 334 | Duplication, extraire |
| 7 | `progress-service.ts` | 318 | Justifie (real-time) |
| 8 | `qcm-player.tsx` | 305 | OK (logique metier) |
| 9 | `module-accueil-client.tsx` | 292 | Duplication, extraire |
| 10 | `serie-player.tsx` | 279 | OK (logique metier) |

---

## Points forts du codebase (a preserver)

1. **Server Components first** : separation propre server/client avec suffixe `-client.tsx`
2. **Pre-compilation du contenu** : zero MDX runtime, build-time HTML/JSON
3. **TypeScript strict** : 0 `any`, 0 `@ts-ignore`, 0 `console.log`
4. **Loading states** : tous les parcours ont des skeletons
5. **Error boundaries** : pages critiques protegees
6. **Accessibilite** : aria-labels, role, focus management
7. **React Cache** : `content-loader.ts` optimise avec `cache()` de React
