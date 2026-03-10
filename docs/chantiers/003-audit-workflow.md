# Chantier 003 — Audit workflow de contenu

Status: TERMINE (2026-03-10)
Date: 2026-03-10

---

## CRITIQUE (bloque le workflow)

### ~~C1. `scripts/validate-content.mjs` — chemins totalement obsoletes~~ FAIT

Script supprime. La validation est integree dans le pipeline (`validate.ts`).

### ~~C2. `CONTENT-CONVENTIONS.md` — syntaxe vartable obsolete~~ FAIT

L'exemple vartable dans `CONTENT-CONVENTIONS.md:561-567` utilisait la syntaxe `init:` + `arr()` qui ne correspondait a aucun fichier reel. Les 31 fichiers de contenu et `typst-snippets.md` utilisent tous la syntaxe `variable:`, `label:`, `domain:`, `contents:`. L'exemple dans CONTENT-CONVENTIONS.md a ete mis a jour pour correspondre a la realite.

### ~~C3. Atomes manquants = WARNING au lieu de ERROR~~ FAIT

Severity changee en `error` dans `validate.ts:82,87`. Le pipeline echouera maintenant si un livret reference un atome inexistant.

---

## HAUTE (impact fonctionnel)

### ~~H1. QR codes — URL de base hardcodee~~ FAIT

`BASE_URL` lit maintenant `process.env.QR_BASE_URL` avec fallback sur la valeur actuelle.

### ~~H2. Validation QCM incomplete~~ FAIT

`validate.ts` verifie maintenant pour chaque QCM : presence de `:::question` (error), nombre d'options 2-5 (error), exactement 1 `:::option{correct}` (error), presence de `:::explanation` (warning). Les 63 QCM existants passent.

### ~~H3. `compile-all.ts` — 1 atome casse = build entier casse~~ FAIT

Compile maintenant TOUS les atomes, collecte les erreurs, puis affiche un rapport complet avant de throw. La concurrence est aussi configurable via `COMPILE_CONCURRENCY` env var (L2 corrige en meme temps).

### ~~H4. Chantier 002 — statut jamais mis a jour~~ FAIT

Statut mis a jour vers TERMINE (2026-03-10).

---

## MOYENNE (dette technique / clarte)

### ~~M1. `resume-continuite.mdx` — atome orphelin~~ BY DESIGN

L'atome est charge directement par la page resume (`getAtomHtml('resume-' + livretSlug)`) — il n'appartient a aucun livret par design. L'orphan warning est attendu et non bloquant.

### M2. QCM Loader — scan filesystem redondant (DIFFERE)

Scanne le filesystem `content/` pour trouver les `qcm-*.mdx`, puis lit les `.json` pre-compiles dans `src/generated/`. Necessite un refactoring plus profond (pas de mapping module → QCM IDs dans les donnees resolues).

- **Fichier :** `src/lib/qcm-loader.ts:13-39`
- **Action :** Refactorer pour lire depuis le livret resolu (quand un mapping module sera disponible).

### ~~M3. Template de planning — structure hybride non documentee~~ FAIT

Commentaire explicatif ajoute dans `template.yaml` (note #6) : `atoms:` = spec pour la generation, `steps:` = IDs dans la molecule finale.

### ~~M4. `compile-typst.ts` — echec curl silencieux~~ FAIT

Le catch log maintenant le nom du package et le message d'erreur avant de retourner `undefined`.

### ~~M5. `livret-template.ts` — naming "LivretSerie" obsolete~~ FAIT

Interface `LivretSerie`, fonction `difficultyStars()`, section SERIES du template, et `series: []` dans `generate-pdfs.ts` supprimes.

### M6. Couleurs HTML hardcodees dans `compile-mdx.ts` (DIFFERE)

8 directives avec des classes Tailwind hardcodees + SVG inline. Pas de possibilite de theme. Faible priorite — fonctionne correctement, juste pas configurable.

- **Fichier :** `tools/pipeline/src/stages/compile-mdx.ts:32-79`

### ~~M7. Workflow doc — phases resolve/write non documentees~~ FAIT

Sous-diagramme mermaid des 6 phases pipeline (read → validate → compile → resolve → write → generate-pdfs) ajoute dans `content-agentic-workflow.md` section WF4.

---

## BASSE (cosmetique / ameliorations)

### ~~L1. Orphan list tronquee a 5~~ FAIT

Affiche maintenant la liste complete des orphelins (plus de `.slice(0, 5)`).

### ~~L2. Concurrence hardcodee~~ FAIT

Corrige avec H3 — `COMPILE_CONCURRENCY` env var avec fallback a 20.

### ~~L3. Type `AtomType` duplique~~ FAIT

`AtomType` exporte depuis `types.ts`, importe dans `mdx-to-typst.ts`. Les interfaces `RawAtom` et `ResolvedActivity` utilisent `AtomType` au lieu de l'union inline.

### L4. Progress tracking — extraction heuristique du module (DIFFERE)

Extrait le "module" depuis l'ID de l'activite par split sur `-`. Fonctionne mais fragile. Necessite une propriete explicite dans le livret resolu.

- **Fichier :** `src/app/app/_components/use-booklet-progress.ts:84-86`

### ~~L5. Commentaire stale "series" dans progress hook~~ FAIT

Deja nettoye lors du chantier 002 (migration livret unifie).

### ~~L6. KB template — id `module_xxx` pas assez explicite~~ FAIT

Mis a jour vers `id: module_{slug}` dans `meta_system/kb/template.md`.

---

## Resume executif

| Severite | Count | Statut |
|----------|-------|--------|
| Critique | 3 | 3/3 FAIT |
| Haute | 4 | 4/4 FAIT |
| Moyenne | 7 | 5/7 FAIT (M2, M6 differes) |
| Basse | 6 | 5/6 FAIT (L4 differe) |

**Total : 17/20 corriges, 3 differes (necessitent refactoring ou reflexion architecturale).**
