# Action : Scan Site

Analyse approfondie d'un site web educatif. Genere une fiche detaillee "LLM-friendly" dans `docs/content-intelligence/sources/sites/`.

## Input

`$ARGUMENTS` apres "scan" : `<url-or-slug>`

- Si c'est une URL (contient `.`) : utiliser directement
- Si c'est un slug (ex: `sigmaths-net`) : chercher l'URL dans le registry

## Etape 0 — Identification

1. **Lire le registry** : `docs/content-intelligence/sources/registry.md`
2. **Identifier la source** :
   - Si l'URL/slug existe dans le registry : recuperer les infos connues
   - Si nouvelle : noter qu'on l'ajoutera au registry a la fin
3. **Determiner le slug** pour le fichier : domaine en kebab-case (ex: `sigmaths.net` → `sigmaths-net`)
4. **Verifier si une fiche existe deja** : `docs/content-intelligence/sources/sites/{slug}.md`
   - Si oui : on fait une mise a jour (re-scan)
   - Si non : creation

## Etape 1 — Reconnaissance du site

### 1.1 Fetch de la page d'accueil

```
WebFetch(url: "https://{domain}", prompt: "Analyse cette page d'accueil d'un site educatif.
Extrais :
1. Le titre et la description du site
2. La structure de navigation (menus, categories)
3. Les niveaux scolaires couverts
4. Les matieres couvertes
5. Les types de contenu (cours, exercices, series, devoirs, corrections, videos)
6. La langue principale et les langues secondaires
7. Si le contenu est gratuit ou payant
8. La structure des URLs visible dans les liens
Donne toutes les URLs de navigation trouvees.")
```

### 1.2 Exploration de la structure

A partir de la navigation trouvee, identifier les pages cles :
- Page listing par niveau (ex: /3eme-math/, /terminale/)
- Page listing par chapitre (ex: /continuite/, /derivation/)
- Sitemap si disponible (essayer /sitemap.xml)

Fetch 2-3 pages de navigation pour comprendre la hierarchie :

```
WebFetch(url: "{page-listing-niveau}", prompt: "Liste tous les chapitres/modules disponibles
a ce niveau. Pour chaque chapitre, donne le lien et les types de contenu visibles
(cours, exercices, series, etc.)")
```

### 1.3 Mapping vers nos modules

Pour chaque chapitre trouve sur le site, mapper vers notre vocabulaire controle :

| Topics du site | Notre topic | Notre module |
|----------------|-------------|-------------|
| "Continuite" | `cont` | Continuite |
| "Derivation", "Derivees" | `der` | Derivation |
| ... | ... | ... |

Si un chapitre du site ne correspond a aucun de nos modules, le noter quand meme
(il pourrait etre utile pour de futurs programmes).

## Etape 2 — Scan detaille par module

Pour CHAQUE module pertinent trouve sur le site (ceux qui matchent notre curriculum) :

### 2.1 Fetch de la page du module

```
WebFetch(url: "{page-chapitre}", prompt: "Analyse cette page de cours/exercices.
Pour CHAQUE ressource presente sur la page, extrais :
1. Type : cours, exercice, serie, devoir, correction, video, QCM
2. Titre exact
3. URL directe (lien de telechargement ou page)
4. Niveau de difficulte estime (si visible)
5. Si un corrige est disponible
6. Format : HTML, PDF, video
7. Resume du contenu en 1 ligne
Liste TOUTES les ressources sans exception.")
```

### 2.2 Classification

Pour chaque ressource trouvee, creer une entree :
```markdown
- [{type}] {url}
  {resume-1-ligne}. Diff ~{0-3}. Corrige: {oui/non}. Format: {html/pdf/video}.
```

Types normalises : `cours`, `exercice`, `serie`, `devoir`, `correction`, `video`, `qcm`, `fiche`, `animation`

## Etape 3 — Analyse technique du site

Pendant les etapes 1-2, noter systematiquement :

### 3.1 Structure technique

- **Pattern d'URL** : comment les URLs sont construites (ex: `/{niveau}/{chapitre}/{type}`)
- **Rendu** : HTML statique, SPA JavaScript, server-rendered
- **LaTeX** : MathJax, KaTeX, images, ou absent
- **Accessibilite** : contenu lisible sans JS ? PDFs parsables ?
- **Encodage** : UTF-8, problemes de caracteres arabes ?

### 3.2 Specificites d'extraction

- **Comment acceder au contenu** : liens directs, navigation requise, accordeons, onglets
- **Contenu payant/protege** : quelles sections sont reservees
- **Telechargements** : PDFs disponibles, liens directs ou redirections
- **Rate limiting** : le site est-il rapide ou lent ? Faut-il espacer les requetes ?

### 3.3 Qualite du contenu

- **Precision mathematique** : erreurs reperees, rigueur des demonstrations
- **Niveau pedagogique** : adapte au curriculum tunisien ? trop simple / trop avance ?
- **Completude** : corrections detaillees ou juste les reponses ?
- **Note de qualite** : ★☆☆☆☆ a ★★★★★ avec justification

## Etape 4 — Generation de la fiche

Ecrire le fichier `docs/content-intelligence/sources/sites/{slug}.md` avec cette structure EXACTE :

```markdown
# {Nom du site}

> Derniere mise a jour : {date}

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://{domain} |
| Type | {site-tn / site-fr / youtube / reference / annales} |
| Niveaux | {1ere, 2nde, 3eme, Term} |
| Langues | {fr, ar, en} |
| Acces | {gratuit / freemium / payant} |
| Qualite | {★★★★★} |
| Derniere verification | {YYYY-MM-DD} |

## Description

{2-3 phrases decrivant le site, son public cible, sa specialite}

## Instructions LLM

### Navigation
{Comment naviguer sur le site programmatiquement}
- URL de base : ...
- Pattern de navigation : ...
- Sitemap : {oui/non, URL si oui}

### Extraction de contenu
- Format principal : {HTML / PDF / Video}
- LaTeX : {MathJax / KaTeX / images / aucun}
- Methode d'extraction : {direct fetch / navigation requise / PDF download}
- Contenu protege : {description des limitations}

### Patterns d'URL
- Cours : `https://{domain}/{pattern}`
- Exercices : `https://{domain}/{pattern}`
- Series : `https://{domain}/{pattern}`
- {autres types}

### Limites et precautions
- {Rate limiting, pages lentes, etc.}
- {Contenus inaccessibles}
- {Problemes d'encodage}

## Ressources par module

### {topic} — {Nom du module}

#### Cours
- [cours] {url}
  {resume}. Format: {html/pdf}.

#### Exercices
- [exercice] {url}
  {resume}. Diff ~{N}. Corrige: {oui/non}. Format: {html/pdf}.
- [exercice] {url}
  ...

#### Series
- [serie] {url}
  {resume}. {N} exercices. Diff {range}. Corriges: {oui/non}.

#### QCM
- [qcm] {url}
  {resume}. {N} questions.

#### Videos
- [video] {url}
  {resume}. Duree: {Xmin}.

#### Devoirs / Annales
- [devoir] {url}
  {resume}. {annee}. Corrige: {oui/non}.

### {topic2} — {Nom du module 2}
...

## Modules non-mappes

{Chapitres du site qui ne correspondent a aucun de nos modules actuels}

- {nom-chapitre} : {url} — {description courte}

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| {YYYY-MM-DD} | Scan initial | {notes} |
```

## Etape 5 — Mise a jour du registry

1. **Lire** `docs/content-intelligence/sources/registry.md`
2. **Mettre a jour** la ligne de la source :
   - Statut : `⬜ Pending` → `✅ Scanned`
   - Fiche : ajouter le lien `[fiche](sites/{slug}.md)`
3. Si source nouvelle : **ajouter** une ligne dans la table appropriee
4. **Mettre a jour** les stats en haut du fichier (Total, Scannees, En attente)

## Etape 6 — Rapport

Afficher un resume a l'utilisateur :

```
## Scan complete : {nom du site}

- Modules couverts : {N} ({liste})
- Ressources cataloguees : {N total}
  - {N} cours, {N} exercices, {N} series, {N} QCM, {N} videos, {N} devoirs
- Qualite : {★★★★★}
- Fiche : docs/content-intelligence/sources/sites/{slug}.md

### Points forts
- {liste}

### Limites
- {liste}
```

## Regles importantes

- **Etre exhaustif** : lister TOUTES les ressources trouvees, pas juste les meilleures
- **Etre factuel** : decrire ce qui est present, ne pas inventer ou extrapoler
- **URLs directes** : toujours donner le lien vers la page/ressource specifique, pas juste le domaine
- **Mapping module** : toujours essayer de mapper vers notre vocabulaire controle de topics
- **Ne pas juger trop vite** : un site de faible qualite peut avoir 1-2 exercices excellents
- **Re-scan** : si la fiche existe deja, mettre a jour (pas ecraser) — ajouter les nouvelles ressources, garder l'historique
