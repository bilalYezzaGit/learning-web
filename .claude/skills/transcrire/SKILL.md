---
name: transcrire
description: Transcrire des modules depuis les fichiers bruts indexes vers des fichiers Typst structures. Montre l'etat global du stock et propose quoi transcrire. Keywords - transcrire, transcription, typst, module, extraire.
argument-hint: "[module-name] (optionnel — sans argument, montre l'etat et propose)"
---

# Transcription des sources brutes

Transforme des fichiers bruts (PDF, images) en fichiers Typst structures et lisibles.
Phase independante — ne s'occupe ni de KB, ni de patterns, ni de livrets.

## Syntaxe

```
/transcrire                    # montre l'etat global, propose quoi transcrire
/transcrire continuite         # transcrit un module specifique
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
| continuite                       | 3/3     | 3 .typ    | complet      |
| nombre-derive                    | 3/3     | 3 .typ    | complet      |
| generalites-fonctions            | 3/3     | 3 .typ    | complet      |
| suites-reelles                   | 3/3     | 0 .typ    | non transcrit|
| fonctions-trigonometriques       | 3/3     | 0 .typ    | non transcrit|
| ...                              |         |           |              |

8 modules transcrits, 15 non transcrits.
Quel module veux-tu transcrire ?
```

Si un argument module est donne, passer directement a l'etape 2.

### Etape 2 — Identifier les sources pour le module

Lire les fiches sources dans `_raw/{programme}/sources/*.yaml` pour trouver le module demande.
Pour chaque fiche qui contient ce module, noter :
- Le fichier PDF source
- Les plages de pages
- Si une transcription .typ existe deja

Presenter :
```
Module : continuite
Sources disponibles :
- Manuel CNP (p.21-39)     → fondations/continuite/manuel.typ ✅ existe
- Parascolaire (p.26-41)   → fondations/continuite/parascolaire.typ ✅ existe
- XY Plus (p.15-25)        → fondations/continuite/xyplus.typ ✅ existe

Tout est deja transcrit. Rien a faire.
```

Ou :
```
Module : suites-reelles
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

Pour le Manuel + Corrige : les deux sont transcrits separement puis fusionnes en un seul `manuel.typ`.

### Etape 4 — Mettre a jour le status

Dans chaque fiche source concernee, mettre a jour le status du module :
```yaml
- slug: suites-reelles
  pages: "156-172"
  status: transcribed          # was: not-started
```

### Etape 5 — Resume

```
Transcription terminee : suites-reelles
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
- Pas de commentaires descriptifs `// [Figure : ...]`
- `#import "@preview/cetz:0.3.4"`

### 6. Nettoyage
- Supprimer les PNG apres chaque transcription
- Les PNG ne doivent jamais etre commites

## Conventions Typst

### Mathematiques
```typst
$frac(a, b)$          // fraction
$sqrt(x)$             // racine carree
$arrow(i)$            // vecteur i
$RR$                  // ensemble des reels
$infinity$            // infini
$cases(...)$          // systeme d'equations
```

### Blocs colores
```typst
#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt)[*Definition* ...]   // bleu
#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt)[*Theoreme* ...]     // vert
#block(fill: rgb("#fff7f0"), inset: 12pt, radius: 4pt)[*Remarque* ...]     // orange
```

### Figures cetz
```typst
#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (5, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -1), (0, 4), mark: (end: ">"), stroke: 0.8pt)
  bezier((0, 0), (4, 3), (1, 2), (3, 3.5), stroke: (paint: blue, thickness: 1pt))
})
```

## Prompt pour les agents paralleles

```
Tu dois transcrire fidelement les pages PNG en fichier Typst.

REGLES CRITIQUES :
1. pdftoppm -png -r 150 (JAMAIS plus, sinon erreur API images > 2000px)
2. Lire les images visuellement, par chunks de max 5 pages
3. Transcrire EXACTEMENT ce que tu vois (texte, formules, exercices)
4. Generer du vrai code cetz pour les figures (pas de descriptions)
5. Annoter chaque page : // Source: [Livre] p.X
6. Nettoyer les PNG apres usage (rm _raw/pages/prefix*)

SOURCE : [Nom du livre]
FICHIER PDF : _raw/{programme}/fondations/{fichier}.pdf
PAGES : [debut] a [fin]
SORTIE : _raw/{programme}/fondations/{module}/transcription-{source}.typ
```
