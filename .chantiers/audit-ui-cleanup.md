# Audit UI — Rapport de nettoyage pre-production

Date : 2026-03-01
Branche : `chantier/006-parcours-accueil-matiere`

---

## TIER 1 — Code mort (suppression sans risque)

### 1.1 Dependance `zustand` completement inutilisee

- **Fichier** : `package.json`
- **Detail** : Installe (v5.0.11) mais 0 imports dans tout `src/`. Aucun store n'existe.
- **Action** : `npm uninstall zustand`

### 1.2 Composants UI shadcn jamais importes (6 fichiers, ~500 lignes)

| Fichier | Verifie |
|---------|---------|
| `src/components/ui/checkbox.tsx` | 0 imports |
| `src/components/ui/command.tsx` | 0 imports (son seul consommateur `search-command.tsx` a ete supprime) |
| `src/components/ui/alert-dialog.tsx` | 0 imports |
| `src/components/ui/table.tsx` | 0 imports |
| `src/components/ui/toggle.tsx` | 0 imports (importe uniquement par toggle-group) |
| `src/components/ui/toggle-group.tsx` | 0 imports |

**Action** : Supprimer les 6 fichiers.

### 1.3 Pattern components morts (2 fichiers, ~195 lignes)

| Fichier | Verifie |
|---------|---------|
| `src/components/patterns/activity-card.tsx` | 0 imports |
| `src/components/patterns/module-card.tsx` | 0 imports |

Note : `scan-upload.tsx`, `diagnostic-orientation.tsx`, `result-details.tsx` sont bien utilises (verifies).

**Action** : Supprimer les 2 fichiers.

### 1.4 Hook mort : `useMediaQuery` (~38 lignes)

- **Fichier** : `src/lib/hooks/use-media-query.ts`
- **Detail** : Jamais importe, pas meme exporte par le barrel `index.ts`
- **Action** : Supprimer le fichier

### 1.5 Type mort : `UserProfile` (~37 lignes)

- **Fichier** : `src/types/user.ts`
- **Detail** : Interface jamais importee. Re-exportee par `src/types/index.ts` mais jamais consommee.
- **Action** : Supprimer le fichier + retirer du barrel `index.ts`

### 1.6 Fonction Firebase morte : `getFunctionsInstance`

- **Fichier** : `src/lib/firebase/client.ts`
- **Detail** : Exporte mais 0 appels. Cloud Functions non utilisees dans le projet.
- **Action** : Supprimer la fonction + ses imports Firebase Functions

### 1.7 Fonction analytics morte : `trackSerieCompleted`

- **Fichier** : `src/lib/services/analytics-service.ts`
- **Detail** : Definie mais jamais appelee (0 imports)
- **Action** : Supprimer la fonction

### 1.8 Layouts pass-through vides (2 fichiers)

| Fichier | Contenu |
|---------|---------|
| `src/app/(landing)/layout.tsx` | `return children` — 7 lignes |
| `src/app/(parcours)/[parcours]/apprendre/[moduleId]/layout.tsx` | `return <>{children}</>` — 14 lignes |

Aucun effet sur le routing Next.js. Les layouts parents s'appliquent directement sans eux.

**Action** : Supprimer les 2 fichiers.

### 1.9 Fichiers `.gitkeep` dans dossiers peuples (4 fichiers)

| Fichier |
|---------|
| `src/types/.gitkeep` |
| `src/content/.gitkeep` |
| `src/lib/hooks/.gitkeep` |
| `src/lib/services/.gitkeep` |

**Action** : Supprimer les 4 fichiers.

---

## TIER 2 — Logique exotique (simplifier/supprimer)

### 2.1 Viewer dev-tool — a ne pas livrer en prod (2 pages + 2 API routes)

| Fichier | Role |
|---------|------|
| `src/app/viewer/page.tsx` | Page dev pour visualiser les molecules |
| `src/app/viewer/viewer-client.tsx` | Client component du viewer |
| `src/app/api/content/atom/[id]/route.ts` | API pour le viewer |
| `src/app/api/content/toggle-visible/route.ts` | API pour le viewer |

**Detail** : Route accessible en prod sans guard. Expose la structure du contenu.
**Action** : Supprimer les 4 fichiers, ou ajouter un guard `NODE_ENV === 'development'`.

### 2.2 `recharts` fantome dans `next.config.ts`

- **Fichier** : `next.config.ts:55`
- **Detail** : `recharts` est dans `optimizePackageImports` mais n'est pas installe et n'est importe nulle part
- **Action** : Retirer `'recharts'` de la liste

### 2.3 `shadcn` CLI en dependance runtime

- **Fichier** : `package.json`
- **Detail** : `shadcn` (v3.8.3) est un outil CLI de generation. Il n'est jamais importe a runtime.
- **Action** : `npm uninstall shadcn && npm install -D shadcn`

### 2.4 `queryKeys` sur-ingenierie

- **Fichier** : `src/lib/query/keys.ts`
- **Detail** : Definit 3 namespaces (`progress`, `user`, `auth`) avec ~8 cles. Seule `queryKeys.progress.user()` est utilisee. Le type `QueryKeys` est aussi exporte mais jamais importe.
- **Action** : Simplifier a une seule cle utilisee

---

## TIER 3 — Qualite code (nettoyage pour prod)

### 3.1 `console.error` hors du logger (2 occurrences)

| Fichier | Ligne | Code |
|---------|-------|------|
| `src/components/profile-sheet.tsx` | 377 | `console.error('Failed to change parcours:', e)` |
| `src/app/api/scan/route.ts` | 190 | `console.error('Scan analysis error:', e)` |

Les 2 occurrences dans `error-logger.ts` sont legitimes (c'est le logger lui-meme).

**Action** : Remplacer par `logError(...)` du error-logger.

### 3.2 Fonctions utilitaires dupliquees dans 4+ fichiers

| Fonction | Fichiers |
|----------|----------|
| `formatDuration(minutes)` | `accueil-client.tsx`, `apprendre-client.tsx`, `module-accueil-client.tsx`, `course-timeline.tsx` |
| `getDifficultyLabel(d)` | `module-accueil-client.tsx`, `accueil-client.tsx`, `reviser-client.tsx` |
| `getSerieTypeLabel(type)` | `accueil-client.tsx` (1 seul fichier) |

**Action** : Extraire `formatDuration` et `getDifficultyLabel` dans `src/lib/utils/format.ts` et importer partout.

### 3.3 `transition-all` a remplacer (4 occurrences pertinentes)

| Fichier | Ligne | Remplacement |
|---------|-------|-------------|
| `src/components/course-timeline.tsx` | 561 | `transition-colors` |
| `src/components/ui/accordion.tsx` | 38 | `transition-[height]` |
| `src/components/ui/progress.tsx` | 27 | `transition-transform` |
| `src/components/ui/sidebar.tsx` | 294 | `transition-[width]` |

(`tabs.tsx` sera supprime au Tier 1, pas besoin de le fixer.)

---

## Resume chiffre

| Categorie | Fichiers | Lignes estimees |
|-----------|----------|-----------------|
| **Tier 1** — Code mort | ~18 fichiers a supprimer | ~850 lignes |
| **Tier 2** — Exotica | ~5 fichiers a supprimer/modifier | ~400 lignes |
| **Tier 3** — Qualite | ~8 fichiers a modifier | ~30 lignes modifiees |
| **Total** | ~31 fichiers touches | ~1250 lignes nettoyees |
