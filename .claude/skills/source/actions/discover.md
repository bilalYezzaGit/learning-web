# Action : Discover Sources

Recherche de nouvelles sources pedagogiques sur le web. Ajoute les trouvailles au registry sans les scanner en detail.

## Input

`$ARGUMENTS` apres "discover" : `[scope]`

- Vide ou `all` : recherche generale toutes categories
- Un topic (ex: `continuite`, `derivation`) : recherche ciblee sur ce module
- `youtube` : recherche de chaines YouTube uniquement

## Workflow

### 1. Lire le registry

Lire `docs/content-intelligence/sources/registry.md` pour connaitre les sources deja repertoriees.

### 2. Lire le discovery log

En bas du registry, section "Discovery Log" — verifier quelles requetes ont deja ete faites pour ne pas les refaire.

### 3. Recherches web systematiques

Lancer des recherches par categorie. Adapter les requetes selon le scope.

#### Si scope = all ou vide :

```
# Sites tunisiens
WebSearch("cours maths lycee tunisie site educatif")
WebSearch("exercices corriges maths 3eme annee tunisie")
WebSearch("devoirs maths bac tunisien corriges")
WebSearch("series exercices maths tunisie lycee")

# Sites francophones
WebSearch("cours maths lycee terminale exercices corriges gratuit")
WebSearch("QCM maths lycee en ligne gratuit")

# YouTube
WebSearch("cours maths lycee youtube francais tunisie")
WebSearch("exercices corriges maths video youtube terminale")

# Forums / communautes
WebSearch("forum maths lycee tunisie aide exercices")
```

#### Si scope = un topic :

```
WebSearch("{topic} cours exercices corriges tunisie")
WebSearch("{topic} maths lycee exercices PDF")
WebSearch("{topic} QCM en ligne maths")
WebSearch("{topic} video cours youtube maths")
```

### 4. Filtrer les resultats

Pour chaque resultat de recherche :

1. **Verifier s'il est deja dans le registry** — si oui, ignorer
2. **Verifier la pertinence** — c'est bien un site educatif avec du contenu maths ?
3. **Verifier l'accessibilite** — le contenu est-il accessible (pas 100% payant, pas mort) ?
4. **Classifier** :
   - `site-tn` : site tunisien
   - `site-fr` : site francophone
   - `youtube` : chaine YouTube
   - `reference` : encyclopedie / reference mathematique
   - `annales` : annales d'examens
   - `forum` : forum / communaute
   - `outil` : outil interactif (GeoGebra, etc.)

### 5. Ajouter au registry

Pour chaque nouvelle source validee, ajouter une ligne dans la table appropriee du registry :

```markdown
| `{slug}` | {domain} | {niveaux} | {contenus} | ⬜ Pending | - |
```

### 6. Mettre a jour le discovery log

Ajouter une entree :

```markdown
| {YYYY-MM-DD} | {liste des requetes} | {N} nouvelles sources |
```

### 7. Mettre a jour les stats

Recalculer Total, Scannees, En attente en haut du registry.

### 8. Rapport

```
## Discovery complete

- Requetes effectuees : {N}
- Resultats analyses : {N}
- Nouvelles sources ajoutees : {N}
  {liste avec slug et URL}
- Sources deja connues : {N}
- Sources ecartees : {N} (raison)

### Prochaines etapes
Les nouvelles sources sont en statut "Pending".
Utiliser `/source scan {slug}` pour les analyser en detail.
```

## Regles

- **Ne pas scanner** les sites trouves — juste les ajouter au registry
- **Verifier les doublons** — un meme site peut apparaitre sous plusieurs URLs
- **Preferer les sources gratuites** mais noter aussi les freemium/payantes
- **Loguer les requetes** — pour ne pas les refaire la prochaine fois
