---
name: transcrire
description: Transcrire des modules depuis les fichiers bruts indexes vers des fichiers Typst structures. Montre l'etat global du stock et propose quoi transcrire. Keywords - transcrire, transcription, typst, module, extraire.
argument-hint: "[path] (optionnel — ex: 3eme-math/continuite. Sans argument, montre l'etat et propose)"
---

# Transcription des sources brutes

Transforme des fichiers bruts (PDF, images) en fichiers Typst structures et lisibles.
Phase independante — ne s'occupe ni de _meta/, ni de content/.

## Notion de path

Le **path** identifie un element dans le systeme : `{programme}/{module}`.

Exemples :
- `3eme-math/continuite` — module continuite
- `continuite` — raccourci si un seul programme existe (resolu en `3eme-math/continuite`)

Le path est commun entre `_raw/` et `_meta/` :
- `_raw/3eme-math/fondations/continuite/` ← transcriptions
- `_meta/3eme-math/continuite/` ← modele academique

## Syntaxe

```
/transcrire                          # montre l'etat global, propose quoi transcrire
/transcrire 3eme-math/continuite     # transcrit un module specifique (path complet)
/transcrire continuite               # raccourci si un seul programme
```

## Pipeline

### Etape 1 — Etat global

Lire toutes les fiches sources dans `_raw/{programme}/sources/*.yaml`.
Pour chaque module de chaque fiche, verifier si une transcription .typ existe dans `fondations/` ou `enrichissements/`.

Presenter un resume :

```
Etat des transcriptions (3eme-math) :

| Module                           | Sources | Transcrit | Status       |
|----------------------------------|---------|-----------|--------------|
| 3eme-math/continuite             | 3/3     | 3 .typ    | complet      |
| 3eme-math/nombre-derive          | 3/3     | 3 .typ    | complet      |
| 3eme-math/suites-reelles         | 3/3     | 0 .typ    | non transcrit|
| ...                              |         |           |              |

8 modules transcrits, 15 non transcrits.
Quel module veux-tu transcrire ?
```

Si un argument path est donne, passer directement a l'etape 2.

### Etape 2 — Identifier les sources pour le module

Lire les fiches sources dans `_raw/{programme}/sources/*.yaml` pour trouver le module demande.
Pour chaque fiche qui contient ce module, noter :
- Le fichier PDF source
- Les plages de pages
- Si une transcription .typ existe deja

Presenter :
```
Module : 3eme-math/continuite
Sources disponibles :
- Manuel CNP (p.21-39)     → fondations/continuite/manuel.typ ✅
- Parascolaire (p.26-41)   → fondations/continuite/parascolaire.typ ✅
- XY Plus (p.15-25)        → fondations/continuite/xyplus.typ ✅

Tout est deja transcrit.
```

Ou :
```
Module : 3eme-math/suites-reelles
Sources disponibles :
- Manuel CNP (p.156-172)   → a transcrire
- Parascolaire (p.XXX)     → a transcrire
- XY Plus (p.XXX)          → a transcrire

Transcrire les 3 sources ? (oui / non / choisir)
```

### Etape 3 — Transcrire (agents en parallele)

Pour chaque source a transcrire, lancer un agent en parallele :

```
Agent 1 : Manuel + Corrige → fondations/{module}/manuel.typ
Agent 2 : Parascolaire     → fondations/{module}/parascolaire.typ
Agent 3 : XY Plus          → fondations/{module}/xyplus.typ
```

Chaque agent :
1. Cree le repertoire `_raw/{programme}/fondations/{module}/` si necessaire
2. Extrait les pages PNG : `pdftoppm -png -r 150 -f START -l END source.pdf _raw/pages/prefix`
3. Lit visuellement par chunks de 5 pages
4. Ecrit le fichier .typ
5. Nettoie les PNG

Pour le Manuel + Corrige : transcrits separement puis fusionnes en un seul `manuel.typ`.

### Etape 4 — Mettre a jour le status

Dans chaque fiche source concernee, mettre a jour le status du module :
```yaml
- slug: suites-reelles
  pages: "156-172"
  status: transcribed
```

### Etape 5 — Resume

```
Transcription terminee : 3eme-math/suites-reelles
- manuel.typ (350 lignes)
- parascolaire.typ (280 lignes)
- xyplus.typ (200 lignes)
Fiches sources mises a jour.
```

## Regles d'or

### 1. Fidelite absolue au PDF
- Transcrire **exactement** ce qui est dans le PDF
- Ne pas reformuler, ne pas ameliorer, ne pas corriger les erreurs du livre
- Chaque page annotee : `// Source: [Livre] p.X`

### 2. Lecture visuelle uniquement
- **INTERDIT** : `pdftotext`, `pdfplumber`, `PyPDF`
- Toujours extraire en PNG et lire visuellement

### 3. Resolution 150 DPI
- **CRITIQUE** : `pdftoppm -png -r 150` (jamais plus)
- Les images > 2000px sont rejetees par l'API

### 4. Chunks de 5 pages max
- Ne jamais lire plus de 5 pages en une requete

### 5. Figures en cetz
- Generer du vrai code `cetz` pour les figures mathematiques
- `#import "@preview/cetz:0.3.4"`

### 6. Nettoyage
- Supprimer les PNG apres chaque transcription

## Conventions Typst

### Mathematiques
```typst
$frac(a, b)$, $sqrt(x)$, $arrow(i)$, $RR$, $infinity$, $cases(...)$
```

### Blocs colores
```typst
#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt)[*Definition* ...]   // bleu
#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt)[*Theoreme* ...]     // vert
```

### Figures cetz
```typst
#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (5, 0), mark: (end: ">"))
  bezier((0, 0), (4, 3), (1, 2), (3, 3.5), stroke: blue + 1pt)
})
```

## Prompt pour les agents paralleles

```
Tu dois transcrire fidelement les pages PNG en fichier Typst.

REGLES CRITIQUES :
1. pdftoppm -png -r 150 (JAMAIS plus)
2. Lire les images visuellement, par chunks de max 5 pages
3. Transcrire EXACTEMENT ce que tu vois
4. Generer du vrai code cetz pour les figures
5. Annoter chaque page : // Source: [Livre] p.X
6. Nettoyer les PNG apres usage

SOURCE : [Nom du livre]
FICHIER PDF : _raw/{programme}/fondations/{fichier}.pdf
PAGES : [debut] a [fin]
SORTIE : _raw/{programme}/fondations/{module}/transcription-{source}.typ
```
