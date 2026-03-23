# Action : Integrer des sources (_raw/)

Commande unique pour integrer des fichiers fondation ou enrichissement.
Le dossier dans lequel se trouve le fichier determine l'intention :
- `fondations/` → creer ou mettre a jour la KB (batch, toutes les sources croisees)
- `enrichissements/` → confronter au modele existant (unitaire, rapport sans modification)

---

## Syntaxe

```
/content integrer                         # scanne tout, detecte les non-traites
/content integrer fichier.pdf             # integre un fichier specifique
/content integrer fichier1.pdf fichier2   # integre plusieurs fichiers
```

---

## Pipeline

### Etape 1 — Detection et classification

Scanner `_raw/{programme}/fondations/` et `_raw/{programme}/enrichissements/` :

Pour chaque fichier brut (PDF, image) trouve :
1. Chercher une fiche source correspondante dans `_raw/{programme}/sources/`
2. Classifier :
   - **Fondation non indexee** : fichier dans `fondations/` sans fiche source → Etape 2a
   - **Fondation indexee, modules non traites** : fiche source existe, certains modules en `not-started` ou `transcribed` → Etape 3
   - **Enrichissement non traite** : fichier dans `enrichissements/` pas dans `_processed.yaml` → Etape 4

Si un argument fichier est donne, chercher ce fichier dans les deux dossiers et classifier.

Presenter un resume a l'utilisateur :
```
Detection :
- fondations/ : 3 PDFs (2 non indexes, 1 avec modules non traites)
- enrichissements/ : 1 PDF (non traite)

Commencer par les fondations ? (oui/non)
```

### Etape 2a — Indexation des fondations (automatique)

Pour chaque PDF de fondation sans fiche source :

1. Deleguer a la logique de `transcription/actions/index-pdf.md` :
   - Extraire les pages cles (couverture + table des matieres)
   - Identifier programme, modules, plages de pages
   - Creer la fiche `_raw/{programme}/sources/{slug}.yaml` avec `status: not-started` pour chaque module
   - Nettoyer les PNG

2. Si plusieurs PDFs a indexer, les traiter en parallele.

### Etape 2b — Synthese croisee et choix interactif

Apres indexation, croiser toutes les fiches sources pour presenter la vue complete :

```
Modules disponibles (3 sources : manuel, parascolaire, xyplus) :

| Module              | Manuel  | Para    | XY Plus | Status      |
|---------------------|---------|---------|---------|-------------|
| continuite          | p.21-39 | p.26-41 | p.15-25 | not-started |
| nombre-derive       | p.80-99 | p.110   | p.63-80 | not-started |
| generalites-fonctions| p.5-20 | p.5-25  | p.5-14  | not-started |
| ...                 | ...     | ...     | ...     | ...         |

Quels modules veux-tu integrer ?
```

L'utilisateur choisit 1 ou plusieurs modules. Les non-choisis restent `not-started`.

### Etape 3 — Flux fondation (transcription + KB)

Pour chaque module choisi :

**3a. Transcription** : pour chaque source fondation qui couvre ce module :
- Si transcription .typ existe deja → la reutiliser
- Si pas de transcription → deleguer a `transcription/actions/transcribe-module.md`
  - Extraire les pages PNG (pdftoppm -r 150)
  - Transcrire en parallele (1 agent par source)
  - Ecrire dans `_raw/{programme}/fondations/{module}/{source}.typ`
  - Mettre `status: transcribed` dans la fiche source
  - Nettoyer les PNG

**3b. Creation KB** : deleguer a `content/actions/create-kb.md`
- Lire TOUTES les transcriptions fondation du module
- Croiser les sources → synthetiser
- Ecrire `_meta/{programme}/{module}/` (savoir.yaml + praxeologies.yaml + misconceptions.yaml)
- Mettre a jour `_meta/_interface.yaml`
- Mettre `status: kb-complete` dans les fiches sources

**3c. Resume** :
```
Module continuite integre :
- 3 sources transcrites (manuel, parascolaire, xyplus)
- KB creee : savoir.yaml (X lignes), praxeologies.yaml (Y lignes), misconceptions.yaml (Z lignes)
- Fiches sources mises a jour : status → kb-complete
```

### Etape 4 — Flux enrichissement (confrontation + rapport)

Pour chaque fichier d'enrichissement non traite :

**4a. Transcription** (si necessaire) :
- PDF → extraire pages, transcrire en Typst
- Image → lecture visuelle directe
- Typst/texte → utiliser directement
- Ecrire dans `_raw/{programme}/enrichissements/{module-detecte}/{nom}.typ` (si transcrit)

**4b. Identification du module** :
- Analyser le contenu pour identifier le(s) module(s) concernes
- Si ambiguite → demander a l'utilisateur

**4c. Confrontation** :
- Charger `_meta/{programme}/{module}/` (savoir + praxeologies + misconceptions + patterns)
- Pour chaque exercice/cours/element de la source :
  - Comparer aux praxeologies connues
  - Comparer aux patterns existants
  - Detecter les contradictions avec la KB
  - Detecter les misconceptions nouvelles

**4d. Rapport** (NE MODIFIE RIEN dans _meta/) :
```
## Rapport d'enrichissement
Source : serie-prof-ahmed.pdf (10 exercices)
Modules detectes : continuite (8 exos), nombre-derive (2 exos)

### continuite (8 exercices)

| # | Exercice | Effet | Detail |
|---|----------|-------|--------|
| 1 | Justifier sqrt(x²+1) | pattern connu | Prax1.v1 freq 6→7 |
| 3 | Morceaux 3 pieces | pattern connu | Prax3.v2 freq 4→5 |
| 5 | Morceaux parametre m | nouveau pattern | → Prax3.v4 propose |
| 8 | "continue ⇒ derivable" | contradiction | Erreur dans la source |

### nombre-derive (2 exercices)

| # | Exercice | Effet | Detail |
|---|----------|-------|--------|
| 9 | Derivee x.sqrt(x) | pattern connu | Prax2.v4 freq 3→4 |
| 10 | Tangente parallele | pattern connu | Prax4a.v2 freq 5→6 |

### Propositions
- patterns.yaml continuite : +2 freq, +1 nouveau (Prax3.v4)
- patterns.yaml nombre-derive : +2 freq
- Alerte : exercice 8 contient une erreur (continuite n'implique pas derivabilite)

Valider les propositions ? (oui / non / ajuster)
```

**4e. Validation humaine** :
- L'utilisateur valide, rejette ou ajuste chaque proposition
- Les modifications validees sont appliquees a `_meta/`
- Le fichier est marque comme traite dans `_processed.yaml`

---

## Regles

- **Fondation** : modifie `_meta/` directement (c'est une creation/re-synthese)
- **Enrichissement** : ne modifie JAMAIS `_meta/` sans validation humaine
- **Indexation** : automatique pour les fondations, pas necessaire pour les enrichissements
- **Fiches sources** : mises a jour a chaque etape (status tracking)
- **_processed.yaml** : tracking des enrichissements traites
- **Parallele** : indexation et transcription en parallele quand possible

## Checklist

- [ ] Tous les PDFs de fondation indexes (fiches sources creees)
- [ ] Modules choisis par l'utilisateur (pas de traitement force)
- [ ] Transcriptions ecrites dans le bon dossier (fondations/ ou enrichissements/)
- [ ] KB creee par synthese croisee de TOUTES les fondations du module
- [ ] Enrichissement : rapport produit AVANT toute modification
- [ ] Fiches sources et _processed.yaml mis a jour
- [ ] PNG nettoyes apres transcription
