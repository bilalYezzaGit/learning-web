# Chantier 006 — Systeme d'integration des sources (_raw/)

Status: PHASE 1 TERMINEE, PHASE 2 VISION DOCUMENTEE
Date: 2026-03-23

---

## Phase 1 — Restructuration _raw/ (terminee)

```
_raw/
└── {programme}/                    # Ex: 3eme-math/
    ├── fondations/                 # Sources de reference → creent la KB
    │   ├── Manuel_scolaire_t1.pdf  # PDFs, images, n'importe quel format
    │   ├── Parascolaire.pdf
    │   └── {module}/               # Transcriptions .typ produites
    │       ├── manuel.typ
    │       └── parascolaire.typ
    │
    ├── enrichissements/            # Sources iteratives → confrontent la KB
    │   ├── serie-prof-ahmed.pdf    # PDFs, images, photos, n'importe quoi
    │   ├── synthese-t3-2024.pdf
    │   └── {module}/               # Transcriptions .typ produites
    │       └── serie-prof-ahmed.typ
    │
    ├── sources/                    # Fiches d'indexation (1 YAML par PDF fondation)
    └── pages/                      # PNG temporaires (gitignore)
```

**Le dossier dans lequel tu mets le fichier EST l'intention** :
- `fondations/` = ce fichier fait autorite, il definit le savoir
- `enrichissements/` = ce fichier est a confronter au modele existant

**Tout type de fichier accepte** : PDF, images, photos — le systeme transcrit ce qu'il faut.

---

## Phase 2 — Vision : commande unique `/content integrer`

### Principe

Une seule commande pour tout :

```
/content integrer
```

Le systeme scanne `fondations/` et `enrichissements/`, detecte les fichiers non traites, et agit selon le dossier.

On peut aussi cibler un fichier :

```
/content integrer serie-prof-ahmed.pdf
/content integrer Manuel_t1.pdf Parascolaire.pdf
```

Le systeme trouve le fichier dans fondations/ ou enrichissements/ et agit en consequence.

### Flux fondation (batch, interactif)

Declenche quand des fichiers non traites sont dans `fondations/`.

**Caracteristiques** :
- On a besoin de TOUTES les sources fondation pour produire la KB (synthese croisee)
- Un PDF de fondation (ex: Manuel 238 pages) contient potentiellement 12 modules
- Le systeme ne traite PAS tout d'un coup — il demande quels modules integrer
- L'indexation est un prerequis automatique (pas declenchee manuellement)
- La fiche source (`sources/*.yaml`) est le registre central de l'etat de chaque module

**Exemple realiste : 3 PDFs non indexes**

```
/content integrer

→ Etape 1 : Detection
  Scanne fondations/ : 3 PDFs detectes sans fiche source
  - Manuel_scolaire_t1.pdf
  - Parascolaire_Analyse.pdf
  - xy_plus_tome1.pdf

→ Etape 2 : Indexation automatique (3 agents en parallele)
  Lecture couverture + table des matieres de chaque PDF
  → Cree sources/manuel-3eme-t1.yaml (12 modules)
  → Cree sources/parascolaire-analyse-3eme.yaml (10 modules)
  → Cree sources/xyplus-3eme-t1.yaml (12 modules)

→ Etape 3 : Synthese croisee des fiches + choix interactif
  "Voici les modules couverts par les 3 sources :

  | Module              | Manuel  | Parascolaire | XY Plus | Status      |
  |---------------------|---------|-------------|---------|-------------|
  | continuite          | p.21-39 | p.26-41     | p.15-25 | not-started |
  | nombre-derive       | p.80-99 | p.110-130   | p.63-80 | not-started |
  | fonction-derivee    | p.100   | p.131       | p.81    | not-started |
  | ... (9 autres)      | ...     | ...         | ...     | not-started |

  Quels modules veux-tu integrer ?"

→ continuite

→ Etape 4 : Transcription (3 agents en parallele pour le module choisi)
  - Manuel p.21-39 → fondations/continuite/manuel.typ
  - Parascolaire p.26-41 → fondations/continuite/parascolaire.typ
  - XY Plus p.15-25 → fondations/continuite/xyplus.typ

→ Etape 5 : Creation KB
  - Croise les 3 transcriptions → _meta/3eme-math/continuite/
    (savoir.yaml + praxeologies.yaml + misconceptions.yaml)
  - Met a jour les 3 fiches sources : continuite → status: kb-complete
```

**Ajout d'une nouvelle source fondation plus tard** :

```
(Utilisateur copie nouveau-parascolaire.pdf dans fondations/)

/content integrer
→ Detecte 1 nouveau PDF sans fiche source
→ Indexe → 10 modules
→ "continuite a deja une KB (3 fondations). Nouvelle source detectee.
   Ajouter et re-synthetiser ?"
→ oui, juste continuite
→ Transcrit le nouveau parascolaire pour continuite
→ Relit TOUTES les fondations de continuite (4 sources)
→ Re-synthese → Met a jour _meta/ et les fiches sources
```

### Flux enrichissement (unitaire)

Declenche quand des fichiers non traites sont dans `enrichissements/`.

**Caractéristique** : chaque fichier est traite independamment. Le systeme ne modifie JAMAIS _meta/ sans validation humaine.

```
/content integrer serie-prof-ahmed.pdf
→ Trouve le fichier dans enrichissements/
→ Transcrit (PDF → Typst)
→ Identifie les modules concernes automatiquement
→ Confronte chaque exercice/cours au modele _meta/ existant
→ Produit un rapport :

  ## Rapport d'enrichissement
  Source : serie-prof-ahmed.pdf (10 exercices)
  Modules : continuite (8 exos), nombre-derive (2 exos)

  | # | Exercice | Module | Effet | Detail |
  |---|----------|--------|-------|--------|
  | 1 | sqrt(x²+1) | continuite | pattern connu | Prax1.v1 freq 6→7 |
  | 5 | morceaux param m | continuite | nouveau pattern | → Prax3.v4 propose |
  | 8 | "continue ⇒ derivable" | continuite | contradiction | Erreur dans la source |
  | 9 | derivee de x.sqrt(x) | nombre-derive | pattern connu | Prax2.v4 freq 3→4 |

  Propositions :
  - patterns.yaml continuite : +1 freq Prax1.v1, +1 nouveau Prax3.v4
  - patterns.yaml nombre-derive : +1 freq Prax2.v4
  - Alerte : exercice 8 contient une erreur mathematique

  Valider ? (oui / non / ajuster)

→ L'humain valide, ajuste ou rejette chaque proposition
→ Les modifications validees sont appliquees a _meta/
→ Le fichier est marque comme traite
```

### Effets possibles d'un enrichissement

| Effet | Action proposee | Cible |
|-------|----------------|-------|
| Pattern connu | Incrementer frequency, ajouter source | patterns.yaml |
| Nouveau pattern | Proposer un nouveau pattern avec description + example | patterns.yaml |
| Praxeologie manquante | Alerter — type de tache non identifie | praxeologies.yaml |
| Contradiction | Alerter — la source dit X, la KB dit Y | rapport uniquement |
| Nouvelle misconception | Proposer un ajout | misconceptions.yaml |
| Confirmation | Rien a modifier | marquer comme traite |

### Tracking des fichiers traites

Un fichier `_processed.yaml` par dossier d'enrichissement :

```yaml
# _raw/3eme-math/enrichissements/_processed.yaml
processed:
  - file: serie-prof-ahmed.pdf
    date: 2026-03-25
    modules: [continuite, nombre-derive]
    effects:
      - "continuite/patterns.yaml : +1 freq Prax1.v1, +1 nouveau Prax3.v4"
      - "nombre-derive/patterns.yaml : +1 freq Prax2.v4"
      - "alerte : exercice 8 erreur mathematique (non integre)"
  - file: synthese-t3-2024.pdf
    date: 2026-03-26
    modules: [continuite, fonction-derivee, denombrement]
    effects:
      - "examens/synthese-t3/patterns.yaml : +1 freq EP1, +1 nouveau EP7"
```

### Parcours utilisateur complets

**"J'ai un nouveau manuel a integrer"**
```
1. Copier le PDF dans _raw/3eme-math/fondations/
2. /content integrer
3. Le systeme detecte le PDF, l'indexe si necessaire, liste les modules
4. "Quels modules ?" → je choisis continuite et nombre-derive
5. Transcrit les modules choisis + croise avec les fondations existantes
6. KB creees/mises a jour → fiches sources mises a jour (status: kb-complete)
7. Les autres modules restent not-started pour plus tard
```

**"J'ai une serie d'exercices d'un prof"**
```
1. Copier le PDF dans _raw/3eme-math/enrichissements/
2. /content integrer serie-prof.pdf
3. Le systeme transcrit, identifie les modules, confronte au modele
4. Rapport avec propositions → Valider/rejeter chaque proposition
```

**"J'ai un sujet d'examen"**
```
1. Copier le PDF dans _raw/3eme-math/enrichissements/
2. /content integrer synthese-t3-2024.pdf
3. Le systeme transcrit, detecte les patterns cross-module
4. Rapport → enrichit les patterns d'examen si valide
```

**"J'ai juste une photo d'un exercice"**
```
1. Copier la photo dans _raw/3eme-math/enrichissements/
2. /content integrer photo-exo.jpg
3. Le systeme lit l'image, identifie le module, confronte
4. Rapport unitaire
```

---

## Implementation

### Prerequis

- [ ] Avoir au moins 1 fichier d'enrichissement reel pour tester
- [ ] Implementer `/content integrer` comme orchestrateur des skills existants
- [ ] Adapter `/transcription` pour ecrire dans fondations/ ou enrichissements/ selon le contexte

### Complexite estimee

| Composant | Effort | Existe deja ? |
|-----------|--------|--------------|
| Transcription PDF → Typst | faible | ✅ `/transcription` existe |
| Detection du module depuis le contenu | moyen | partiellement (fiches sources) |
| Confrontation enrichissement vs _meta/ | moyen | `/content patterns` fait une partie |
| Rapport structure | faible | format defini ci-dessus |
| Tracking _processed.yaml | faible | schema defini ci-dessus |
| Orchestrateur `/content integrer` | moyen | a creer |
