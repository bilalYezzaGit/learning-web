---
name: index
description: Indexer des fichiers bruts (PDF, images) pour identifier leur contenu (modules, pages, type). Produit des fiches source YAML. Keywords - index, indexer, indexation, fiche, source, pdf, identifier, cartographier.
argument-hint: "[fichier.pdf] (optionnel — sans argument, indexe tous les non-indexes)"
---

# Indexation des sources brutes

Lit un fichier brut en surface (couverture, table des matieres) sans transcrire le contenu.
Produit une fiche de metadonnees YAML qui decrit ce que le fichier contient.

## Syntaxe

```
/index                        # indexe tous les fichiers non indexes dans fondations/ et enrichissements/
/index Manuel_t1.pdf          # indexe un fichier specifique
/index fichier1.pdf fichier2  # indexe plusieurs fichiers
```

## Pipeline

### Etape 1 — Detection des fichiers non indexes

Scanner `_raw/{programme}/fondations/` et `_raw/{programme}/enrichissements/` pour trouver les fichiers bruts (PDF, images) qui n'ont pas de fiche source correspondante dans `_raw/{programme}/sources/`.

Pour chaque fichier brut, verifier si une fiche source existe deja :
```
Glob: _raw/{programme}/sources/*.yaml
```

Lire chaque fiche, comparer le champ `fichier:` avec les fichiers bruts trouves.

Si un argument est donne, ne traiter que ce fichier.

Presenter un resume :
```
Fichiers non indexes :
- fondations/ : Manuel_t1.pdf, Parascolaire_Analyse.pdf
- enrichissements/ : serie-prof-ahmed.pdf

Indexer tout ? (oui / non / choisir)
```

### Etape 2 — Indexation (par fichier)

Pour chaque fichier a indexer :

1. **Extraire les pages cles** (couverture + table des matieres) :
   ```bash
   pdftoppm -png -r 150 -f 1 -l 5 _raw/{programme}/fondations/{fichier}.pdf _raw/pages/index
   pdfinfo _raw/{programme}/fondations/{fichier}.pdf | grep Pages
   ```

2. **Lire visuellement** les PNG pour identifier :
   - Titre du livre
   - Editeur
   - Programme (3eme-math, 2nde-math, etc.)
   - Type : `manuel` | `corrige` | `parascolaire` | `exercices` | `serie` | `examen`
   - Structure des chapitres (rubriques recurrentes)
   - Table des matieres : liste des modules/chapitres avec pages

3. **Mapper les modules aux slugs** existants.

4. **Ecrire la fiche source** dans `_raw/{programme}/sources/{slug}.yaml`.

5. **Nettoyer les PNG** : `rm _raw/pages/index*`

### Etape 3 — Resume

Presenter pour chaque fichier indexe :
- Type detecte (manuel, serie, examen...)
- Nombre de modules identifies
- Plages de pages par module
- Status initial : `not-started` pour chaque module

## Schema YAML de la fiche source

```yaml
titre: "Titre complet"
editeur: "Nom de l'editeur"
edition: 2023
programme: "3eme-math"
fichier: "nom-exact.pdf"
pages_total: 238
type: manuel                    # manuel | corrige | parascolaire | exercices | serie | examen
location: fondations            # fondations | enrichissements

structure:                      # optionnel — rubriques recurrentes
  - "Rubrique 1 — Description"

notes:                          # optionnel
  - "PDF scanne, lecture visuelle uniquement"

modules:
  - slug: continuite
    pages: "21-39"
    status: not-started         # not-started | transcribed | kb-complete
```

## Regles

- **Lecture en surface uniquement** — ne pas transcrire le contenu
- **Respecter les slugs existants** — voir la table ci-dessous
- **Nettoyer les PNG** apres chaque indexation
- **Un fichier = une fiche** — meme si le fichier contient 12 modules

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
