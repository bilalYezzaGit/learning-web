# Index PDF

Indexer un nouveau PDF source : parcourir sa structure, identifier les modules et plages de pages, produire une fiche source YAML.

---

## Regles

1. **Lecture visuelle uniquement** — extraire quelques pages cles (couverture, table des matieres, debut de chaque chapitre) en PNG avec `pdftoppm -png -r 150`.
2. **Ne pas transcrire** — l'objectif est la cartographie, pas la transcription du contenu.
3. **Respecter le schema YAML** — tous les champs obligatoires doivent etre remplis.
4. **Slugs conformes** — reutiliser les slugs existants (voir table ci-dessous). Si c'est un nouveau programme, definir les slugs en kebab-case.
5. **Nettoyer les PNG** apres indexation.

---

## Pipeline

### Etape 1 : Identifier le PDF

Verifier que le fichier PDF existe dans `_raw/`. Si non, demander a l'utilisateur de le placer dans `_raw/`.

### Etape 2 : Extraire les pages cles

```bash
# Couverture + table des matieres (generalement les 5 premieres pages)
pdftoppm -png -r 150 -f 1 -l 5 _raw/{fichier}.pdf _raw/pages/index

# Compter le nombre total de pages
pdfinfo _raw/{fichier}.pdf | grep Pages
```

### Etape 3 : Lire visuellement

Lire les pages PNG pour identifier :
- **Titre** du livre
- **Editeur**
- **Programme** (niveau scolaire : 3eme-math, 2nde-math, etc.)
- **Type** : `manuel`, `corrige`, `parascolaire`, `exercices`
- **Structure** des chapitres (rubriques recurrentes)
- **Table des matieres** : liste des chapitres avec pages de debut

### Etape 4 : Determiner les plages de pages

Pour chaque chapitre/module, noter la page de debut et la page de fin.
Si la table des matieres ne donne pas les pages de fin, les deduire de la page de debut du chapitre suivant - 1.

### Etape 5 : Mapper les modules aux slugs

Pour chaque chapitre, trouver le slug correspondant dans les fiches existantes (`_raw/sources/*.yaml`).
Si c'est un nouveau programme, creer des slugs en kebab-case.

### Etape 6 : Ecrire la fiche source

Ecrire le fichier `_raw/sources/{slug}.yaml` en suivant le schema ci-dessous.

Convention de nommage du slug de la fiche :
- Manuel : `manuel-{programme}-t{tome}`
- Corrige : `corrige-{programme}-t{tome}`
- Parascolaire : `parascolaire-{theme}-{programme}`
- Exercices : `{editeur}-{programme}-t{tome}`

### Etape 7 : Nettoyer

```bash
rm _raw/pages/index*
```

### Etape 8 : Confirmer

Presenter a l'utilisateur un resume de la fiche :
- Nombre de modules identifies
- Plages de pages
- Slug du fichier YAML cree

---

## Schema YAML

```yaml
# Champs obligatoires
titre: "Titre complet du livre"
editeur: "Nom de l'editeur"
edition: 2023                          # Annee si connue, sinon omettre
programme: "3eme-math"                 # Slug du programme
fichier: "nom-exact-du-fichier.pdf"    # Nom du fichier dans _raw/
pages_total: 238                       # Nombre total de pages
type: manuel                           # manuel | corrige | parascolaire | exercices

# Champs optionnels
structure:                             # Rubriques recurrentes de chaque chapitre
  - "Rubrique 1 — Description"
  - "Rubrique 2 — Description"

notes:                                 # Informations importantes
  - "PDF image (scanne), lecture visuelle uniquement"

# Mapping modules -> pages (obligatoire)
modules:
  - slug: generalites-fonctions        # Slug kebab-case du module
    pages: "5-20"                      # Plage de pages (premiere-derniere)
```

---

## Slugs des modules connus

### 3eme-math (23 modules)

| # | Slug |
|---|------|
| 1 | `generalites-fonctions` |
| 2 | `continuite` |
| 3 | `limites-continuite` |
| 4 | `limites-comportements-asymptotiques` |
| 5 | `nombre-derive` |
| 6 | `fonction-derivee` |
| 7 | `exemples-etude-fonctions` |
| 8 | `fonctions-trigonometriques` |
| 9 | `suites-reelles` |
| 10 | `limites-suites-reelles` |
| 11 | `statistiques` |
| 12 | `probabilites` |
| 13 | `produit-scalaire-plan` |
| 14 | `angles-orientes` |
| 15 | `trigonometrie` |
| 16 | `rotations` |
| 17 | `nombres-complexes` |
| 18 | `denombrement` |
| 19 | `divisibilite-N` |
| 20 | `nombres-premiers` |
| 21 | `vecteurs-espace` |
| 22 | `produit-scalaire-vectoriel-espace` |
| 23 | `equations-droites-plans-sphere` |
