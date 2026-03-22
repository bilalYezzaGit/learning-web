# Action : Valider un module

## Regles

- Validation **semantique** par LLM — ne duplique PAS le pipeline `npm run generate`
- 3 grilles : A (structure subtile), B (mathematiques), C (pedagogie)
- Verdict par grille : **PASS** / **WARN** / **FAIL**
- Rapport ecrase a chaque re-execution
- Calculs maths verifies **etape par etape** (pas survoles)

## Pre-requis

1. Le module existe :
   ```
   Glob: content/**/{module}/*.mdx
   ```

2. Conventions chargees :
   ```
   Read: docs/CONTENT-CONVENTIONS.md
   ```

3. Contexte pedagogique (si disponible) :
   ```
   Read: _meta/modules/{module}/savoir.yaml
   Read: _meta/modules/{module}/praxeologies.yaml
   Read: _meta/modules/{module}/misconceptions.yaml
   Read: _meta/modules/{module}/lexique.yaml
   Read: _meta/modules/{module}/redaction.yaml
   Glob: content/{programme}/{module}/_molecules/*/_planning.yaml
   ```
   → Si fichiers KB/planning absents, Grille C sera notee **partielle**

## Pipeline

### Etape 1 — Decouvrir le module

```
Glob: content/**/{module}/*.mdx
```

- Detecter le programme parent (ex: `3eme-math`)
- Compter les atomes par type (lesson, exercise, qcm)
- Verifier l'existence de molecules : `Glob: content/{programme}/{module}/_molecules/*/molecule.yaml`

### Etape 2 — Charger les references

1. ```
   Read: docs/CONTENT-CONVENTIONS.md
   ```
2. ```
   Read: .claude/skills/content/references/templates.md
   ```
3. KB module (si existante) :
     ```
     Read: _meta/modules/{module}/savoir.yaml
     Read: _meta/modules/{module}/praxeologies.yaml
     Read: _meta/modules/{module}/misconceptions.yaml
     Read: _meta/modules/{module}/lexique.yaml
     Read: _meta/modules/{module}/redaction.yaml
     ```
   - Si les fichiers n'existent pas, noter que la Grille C sera partielle
4. Plannings per-molecule (si existants) :
     ```
     Glob: content/{programme}/{module}/_molecules/*/_planning.yaml
     ```

### Etape 3 — Analyser chaque atome (boucle principale)

Pour chaque fichier `.mdx` du module, mener une analyse en profondeur selon 3 grilles.

#### Grille A — Structure

- Frontmatter complet et conforme :
  - `type` est `lesson`, `exercise` ou `qcm`
  - `difficulty` est 0, 1, 2 ou 3
  - `timeMinutes` est un entier positif dans la fourchette du type (lesson: 3-10, exercise: 5-20, qcm: 1-2)
  - `tags` contient au moins 1 tag
  - `category` present ssi `type: exercise`
  - `praxeologies` present
- ID du fichier conforme `{type}-{topic}-{slug}.mdx` avec topic du vocabulaire controle
- Directives correctes pour le type :
  - exercise : `:::enonce` + `:::solution` obligatoires
  - qcm : `:::question` + 2-5 `:::option` (une seule `{correct}`) + `:::explanation`
  - lesson : directives pedagogiques optionnelles
- LaTeX equilibre (`$...$` inline, `$$...$$` bloc)
- Headings commencent a `###`
- Blocs Typst (` ```typst `) syntaxiquement corrects

#### Grille B — Mathematiques

- Calculs verifies **etape par etape** : derivees, limites, factorisations, simplifications
- Solutions correspondent aux enonces (coherence question ↔ reponse)
- Tableaux de variation coherents (signe f' ↔ sens de variation ↔ valeurs aux bornes)
- QCM : la reponse marquee correcte est mathematiquement juste
- QCM : les distracteurs ne sont pas accidentellement corrects
- Cas particuliers et domaines de definition traites correctement
- Notations mathematiques correctes et coherentes

#### Grille C — Pedagogie

- `difficulty` correspond au contenu reel :
  - 0 = rappel / prerequis
  - 1 = application directe
  - 2 = combinaison de notions
  - 3 = approfondissement / demonstration
- Enonce clair, sans ambiguite
- Solution complete et justifiee (pas de saut de raisonnement)
- `praxeologies` du frontmatter correspondent au contenu reel de l'atome
- QCM : distracteurs plausibles et pedagogiquement pertinents
- QCM : `:::explanation` apporte une valeur pedagogique
- `timeMinutes` realiste pour le contenu
- `category` (exercice) coherente avec la difficulte et le contenu
- Alignement avec le planning (si disponible) : le contenu correspond au champ `contenu` du planning
- Alignement avec la KB (si disponible) : les praxeologies referees existent dans la KB

#### Verdict par atome

- **FAIL** si ≥1 grille est FAIL
- **WARN** si ≥1 grille est WARN (et aucune FAIL)
- **PASS** sinon

### Etape 4 — Assembler le rapport

Ecrire un rapport par molecule dans `content/{programme}/{module}/_molecules/{slug}/_validation.md` :

```markdown
# Validation — {module}

**Date** : {YYYY-MM-DD}
**Module** : {programme}/{module}
**Atomes analyses** : {N}
**KB disponible** : oui/non
**Planning disponible** : oui/non

## Synthese

| Verdict | Nombre |
|---------|--------|
| PASS    | X      |
| WARN    | Y      |
| FAIL    | Z      |

### Problemes critiques (FAIL)

- `{atom-id}` — Grille {X} : {description du probleme}
- ...

### Avertissements (WARN)

- `{atom-id}` — Grille {X} : {description}
- ...

---

## Detail par atome

### `{atom-id}` — {VERDICT}

#### Grille A — Structure
{constatations}

#### Grille B — Mathematiques
{constatations avec calculs detailles si erreur}

#### Grille C — Pedagogie
{constatations}

**Synthese** : {verdict} — {resume en 1 phrase}

---

(repeter pour chaque atome)
```

### Etape 5 — Presenter le resultat

Afficher dans le terminal :

1. Resume : X PASS / Y WARN / Z FAIL
2. Top 3 FAIL (si existants) avec localisation precise
3. Chemin des rapports : `content/{programme}/{module}/_molecules/{slug}/_validation.md`

## Checklist

- [ ] Tous les atomes du module lus et analyses
- [ ] Calculs maths verifies etape par etape (pas survoles)
- [ ] Verdicts FAIL avec localisation precise (fichier, ligne, calcul fautif)
- [ ] Rapport ecrit par molecule dans `content/{programme}/{module}/_molecules/{slug}/_validation.md`
- [ ] Synthese avec compteurs PASS/WARN/FAIL en tete du rapport
- [ ] Si KB/planning absents, mentionne dans le rapport (Grille C partielle)
