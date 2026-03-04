# Transcribe Module

Pipeline complet pour transcrire un module depuis les PDF sources vers des fichiers Typst.

---

## Regles d'or

### 1. Fidelite absolue au PDF

- Transcrire **exactement** ce qui est dans le PDF : texte, formules, enonces, numeros d'exercices.
- Ne pas reformuler, ne pas "ameliorer" le contenu, ne pas corriger les erreurs du livre.
- Garder la structure originale du livre (sections, sous-sections, rubriques).
- Chaque page source doit etre annotee avec un commentaire `// Source: [Livre] p.X`.

### 2. Lecture visuelle uniquement

- **INTERDIT** d'utiliser `pdftotext`, `pdfplumber`, `PyPDF`, ou tout outil d'extraction textuelle.
- Le contenu mathematique contient des figures, tableaux de variations, courbes, et notations spatiales qu'un simple extracteur de texte ne capture pas.
- Toujours extraire les pages en PNG et les lire visuellement (comme un humain lit la page imprimee).

### 3. Contrainte d'images : 150 DPI maximum

- **CRITIQUE** : Utiliser `-r 150` (pas 200, pas 300) pour garder les images sous 2000px par dimension.
- L'API rejette les images > 2000px dans les requetes multi-images.
- 150 DPI est suffisant pour la lecture visuelle.
- **Commande** :
  ```bash
  pdftoppm -png -r 150 -f START -l END source.pdf _raw/pages/prefix
  ```

### 4. Chunking : max 5 pages par lecture

- Ne jamais lire plus de **5 pages** en une seule requete visuelle.
- Battre les pages en lots de 5 (ou moins pour la derniere batch).
- Cela evite les timeouts et les depassements de limites de l'API.

### 5. Figures en cetz (pas de descriptions)

- Generer du **vrai code cetz** pour les figures mathematiques (courbes, axes, cercles, triangles...).
- Ne PAS laisser de simples commentaires descriptifs `// [Figure : ...]`.
- Imports necessaires : `#import "@preview/cetz:0.3.4"`.
- Pour les figures tres complexes uniquement : `// TODO: figure complexe -- [description precise]`.

### 6. Nettoyage apres extraction

- Supprimer les PNG de `_raw/pages/` apres chaque transcription.
- Les fichiers PNG ne doivent jamais etre commites.

---

## Pipeline

### Etape 1 : Identifier les plages de pages

Lire `_raw/CARTOGRAPHIE.md` pour le module demande. Chaque module a 4 sources :

| Source | Fichier PDF | Particularites |
|--------|-------------|----------------|
| Manuel scolaire (CNP) | `Manuel_scolaire_3_math_section_math_t1.pdf` ou `_t2.pdf` | T1 = modules 1-12, T2 = modules 13-23 |
| Corrige (CMS) | `Corrige_manuel_scolaire_3_math_section_math_t1.pdf` ou `_t2.pdf` | **ATTENTION** : les tomes ne correspondent PAS au Manuel ! Consulter la table de correspondance dans CARTOGRAPHIE.md |
| Parascolaire (Kounouz) | `Parascolaire_Analyse_...` ou `Parascolaire_Proba_Geo_...` | Analyse = modules 1-10, Geo&Proba = modules 11-23 |
| XY Plus (CAEU) | `xy_plus_3em_math_tome1.pdf` ou `_tome2.pdf` | T1 = modules 1-12, T2 = modules 13-23 (meme decoupage que Manuel) |

### Etape 2 : Lancer les agents en parallele

Lancer **3 agents** en parallele (un par source secondaire), pendant que le main thread travaille sur le Manuel :

```
Agent principal : Manuel scolaire → _raw/reference/XX-nom/transcription-manuel.typ
Agent 1         : Corrige         → _raw/reference/XX-nom/transcription-corrige.typ
Agent 2         : Parascolaire    → _raw/reference/XX-nom/transcription-parascolaire.typ
Agent 3         : XY Plus         → _raw/reference/XX-nom/transcription-xyplus.typ
```

Chaque agent doit :
1. Creer le repertoire `_raw/reference/XX-nom/` si necessaire
2. Extraire les pages PNG (`pdftoppm -png -r 150`)
3. Lire visuellement par chunks de 5 pages
4. Ecrire le fichier .typ avec tout le contenu
5. Nettoyer les PNG

### Etape 3 : Merge Manuel + Corrige

Une fois le Manuel et le Corrige termines, fusionner en un seul fichier `manuel.typ` :

- Le Manuel est le squelette (cours, activites, QCM, exercices)
- Le Corrige s'insere apres chaque section corrigee :
  - `=== Corrige du QCM` apres la section QCM
  - `=== Corrige Vrai -- Faux` apres la section Vrai-Faux
  - `=== Corrige -- Mobiliser ses competences` apres Mobiliser
  - `==== Corrige` (level 4) apres chaque `=== Exercice N`

Script de merge : utiliser un script Python regex-based (voir Module 1 comme reference).

### Etape 4 : Renommer et nettoyer

```
_raw/reference/XX-nom/
  manuel.typ         # Manuel + Corrige fusionne
  parascolaire.typ   # Autonome
  xyplus.typ         # Autonome
```

Supprimer les fichiers intermediaires (`transcription-*.typ`).

---

## Conventions Typst

### Mathematiques

```typst
$frac(a, b)$          // fraction
$sqrt(x)$             // racine carree
$arrow(i)$            // vecteur i
$RR$                  // ensemble des reels
$infinity$            // infini
$forall$              // pour tout
$in$, $in.not$        // appartient, n'appartient pas
$lt.eq$, $gt.eq$      // <=, >=
$arrow.double$        // =>
$arrow.l.r.double$    // <=>
$mapsto$              // |->
$without$             // \ (sauf)
$emptyset$            // ensemble vide
$cases(...)$          // systeme d'equations
```

### Blocs colores

```typst
// Definition (bleu)
#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
  *Definition* ...
]

// Theoreme (vert)
#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#e8f5e9"))[
  *Theoreme* ...
]

// Remarque (orange)
#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#fff7f0"))[
  *Remarque* ...
]
```

### Figures cetz

```typst
#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1, 0), (5, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -1), (0, 4), mark: (end: ">"), stroke: 0.8pt)
  // Courbe
  bezier((0, 0), (4, 3), (1, 2), (3, 3.5), stroke: (paint: blue, thickness: 1pt))
  // Points
  circle((2, 1.5), radius: 0.06, fill: blue)
  // Labels
  content((2.3, 1.8), $M$)
})
```

### Tableaux de signes / variations

```typst
#table(
  columns: 5,
  [$x$], [$-infinity$], [$x_1$], [$x_2$], [$+infinity$],
  [$f(x)$], [$+$], [$0$], [$-$], [$0$], [$+$]
)
```

---

## Correspondance numeros de modules → noms de dossiers

| # | Dossier |
|---|---------|
| 1 | `01-generalites-fonctions` |
| 2 | `02-continuite` |
| 3 | `03-limites-continuite` |
| 4 | `04-limites-comportements-asymptotiques` |
| 5 | `05-nombre-derive` |
| 6 | `06-fonction-derivee` |
| 7 | `07-exemples-etude-fonctions` |
| 8 | `08-fonctions-trigonometriques` |
| 9 | `09-suites-reelles` |
| 10 | `10-limites-suites-reelles` |
| 11 | `11-statistiques` |
| 12 | `12-probabilites` |
| 13 | `13-produit-scalaire-plan` |
| 14 | `14-angles-orientes` |
| 15 | `15-trigonometrie` |
| 16 | `16-rotations` |
| 17 | `17-nombres-complexes` |
| 18 | `18-denombrement` |
| 19 | `19-divisibilite-N` |
| 20 | `20-nombres-premiers` |
| 21 | `21-vecteurs-espace` |
| 22 | `22-produit-scalaire-vectoriel-espace` |
| 23 | `23-equations-droites-plans-sphere` |

---

## Prompt pour les agents paralleles

Chaque agent recoit ce prompt (adapter source/pages) :

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
FICHIER PDF : _raw/[nom].pdf
PAGES : [debut] a [fin]
SORTIE : _raw/reference/[XX-nom]/transcription-[source].typ
```
