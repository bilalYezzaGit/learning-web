# Chantier 004 — Decouplage META : Vision

Status: EN COURS
Date: 2026-03-22

---

## Probleme

Le systeme de contenu actuel est un pipeline lineaire couple :

```
_raw → KB (dans content/) → planning → generation → validation
```

Trois problemes concrets :

1. **Melange domaine / implementation.** La KB (`_kb.md`) contient a la fois le savoir mathematique (theoremes, praxeologies) et des specifications de contenu (profondeur d'explication, style de redaction). Modifier l'un risque de casser l'autre.

2. **Pas de contenu cross-module.** Un livret de preparation BAC pioche dans 5+ modules, a ses propres contraintes de temps et difficulte, et suit un format different. Le systeme actuel est cable "1 module = 3 livrets" sans possibilite de composition.

3. **Livrets couples au pipeline.** Les atomes et molecules produits restent lies au systeme de generation. Modifier le pipeline ou la KB peut impacter du contenu deja livre.

---

## Vision cible

Trois couches decouples, chacune avec une responsabilite claire :

```
_raw/          Ressources brutes (PDFs, transcriptions Typst)
               Input du systeme. Stable.

_meta/         Modele academique des mathematiques tunisiennes
               Savoir pur. Enrichissable independamment.

content/       Systeme de production de livrets
               Plans (ephemeres) → atomes + molecules (produits finis)
```

### Couche 1 : `_raw/` (inchangee)

PDFs sources, fiches d'indexation YAML, transcriptions Typst. Pas de changement.

### Couche 2 : `_meta/` (nouveau)

Contient **tout ce qui releve de l'academique et des mathematiques**, independamment de l'implementation (pas de Typst, pas de MDX, pas de conventions de fichiers).

#### Ce qui va dans `_meta/`

| Categorie | Description | Granularite |
|-----------|-------------|-------------|
| Savoir structure | Axiomes, theoremes, definitions, proprietes | Par module |
| Praxeologies | Types de taches, techniques, technologies didactiques | Par module |
| Patterns d'exercices | Variantes observees dans les examens, frequences, sources | Par module, utilisable cross-module |
| Lexique academique | Vocabulaire mathematique, conventions de langage | Par module + global |
| Misconceptions | Erreurs frequentes, diagnostics, remediations | Par module |
| Specifications d'examen | Structure BAC/devoirs, distribution des patterns, durees, niveaux | Par examen / par niveau |
| Metriques de complexite | Echelle de difficulte, profondeur d'explication par niveau | Global + par niveau |
| Prerequis et liens | Dependances entre modules, progressions | Cross-module |

#### Ce qui n'y va PAS

- Conventions Typst, templates MDX, snippets → `docs/` et skills
- Conventions de nommage de fichiers → `docs/CONTENT-CONVENTIONS.md`
- Regles du pipeline → `tools/pipeline/`

#### Evolution de la KB actuelle

La KB actuelle (`content/{prog}/{mod}/_kb.md`) migre dans `_meta/`. Elle ne conserve pas forcement sa forme monolithique : elle peut etre eclatee en fichiers cibles (savoir, praxeologies, misconceptions, lexique) tant que chaque fichier a une responsabilite claire.

Les `_patterns.yaml` actuels (1 existant pour `nombre-derive`) migrent aussi dans `_meta/`.

### Couche 3 : `content/` (evolue)

Reste le systeme de production, mais avec deux changements majeurs :

**3a. Plans libres.** Un plan n'est plus contraint a "1 module, 1 des 3 livrets". Il peut :
- Couvrir un module (3 livrets, comme aujourd'hui)
- Couvrir un examen (cross-module, contraintes de temps)
- Couvrir un sous-ensemble d'un module
- Combiner des elements de plusieurs modules

Le plan **pointe vers `_meta/`** pour ses specifications (praxeologies, patterns, metriques).

**3b. Plans ephemeres.** Un plan sert a generer les atomes et la molecule. Une fois la production terminee, le plan peut rester pour tracabilite mais n'est pas perenne. Il ne conditionne pas le fonctionnement du contenu produit.

**3c. Livrables decouplables.** A terme, les atomes et molecules produits doivent pouvoir sortir du systeme de generation pour vivre independamment dans l'application. Modifier `_meta/` ou le pipeline ne doit pas impacter les livrables deja produits. (Chantier futur, hors scope de ce document.)

---

## L'interface META ↔ CONTENT

Point critique du systeme. Les plans referencent des elements de `_meta/` via des identifiants stables.

### Principes

1. **Contrat explicite.** L'interface definit quels identifiants de `_meta/` sont referencables par les plans (IDs de praxeologies, IDs de patterns, IDs de modules, etc.).

2. **Maintenance obligatoire.** Si on restructure `_meta/`, on met a jour l'interface. Un plan qui pointe vers un ID supprime doit etre detecte.

3. **Sens unique.** `content/` depend de `_meta/`. `_meta/` ne depend jamais de `content/`. Les livrables produits ne dependent de rien (une fois generes, ils sont autonomes).

### Ce que l'interface expose

- Identifiants de modules (`nombre-derive`, `continuite`, ...)
- Identifiants de praxeologies (`Prax1`, `Prax2`, ...)
- Identifiants de patterns (`Prax1.v1`, `Prax1.v2`, ...)
- Identifiants de specifications d'examen (`bac-3eme-t3`, ...)
- Metriques de reference (echelle de difficulte, durees cibles)

---

## Ce qui change par rapport a aujourd'hui

| Aspect | Aujourd'hui | Cible |
|--------|-------------|-------|
| KB | 1 `_kb.md` monolithique dans `content/{prog}/{mod}/` | Eclatee dans `_meta/`, fichiers cibles |
| Patterns | `_patterns.yaml` dans `content/`, 1 seul existe | Dans `_meta/`, par module, enrichissable |
| Specs examen | N'existe pas | Dans `_meta/`, par examen/niveau |
| Plans | Lies a 1 module, 3 par module | Libres : par module, cross-module, par examen |
| Referentiel redaction | `docs/referentiels/` | Reste dans `docs/` (implementation, pas domaine) |
| Conventions Typst | Dans les skills | Restent dans les skills |

---

## Perimetre et hors-scope

### Dans ce chantier

- Definir la structure de `_meta/`
- Migrer les KB existantes (3 modules)
- Migrer les patterns existants (1 module)
- Definir l'interface META ↔ CONTENT
- Adapter les skills et workflows pour lire depuis `_meta/`
- Adapter les templates de planning pour pointer vers `_meta/`
- Mettre a jour la documentation (content-agentic-workflow.md, CONTENT-CONVENTIONS.md)

### Hors scope (chantiers futurs)

- Decouplage des livrables produits du pipeline de build
- Creation effective de livrets cross-module / prepa examen (necessite d'abord ce chantier)
- Enrichissement massif de `_meta/` (specs examen, metriques globales)
