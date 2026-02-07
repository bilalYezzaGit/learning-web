# Action : Create Programme

Pipeline complet pour creer TOUS les modules d'un programme en une seule fois.
Mutualise la recherche web et cree les modules par batch.

## Input

`$ARGUMENTS` apres "create-programme" : `<programme-id>`

Exemple : `/content create-programme 1ere-tc`

## Etape 0 — Inventaire du programme

1. **Lire le programme** : `content/molecules/programmes/{programme-id}.yaml`
2. **Lister tous les cours** references dans `cours:`
3. **Pour chaque cours**, lire `content/molecules/cours/{slug}.yaml`
4. **Identifier le topic** de chaque cours (vocabulaire controle §7.1)
5. **Inventorier les atomes existants** pour chaque topic
6. **Determiner quels modules sont deja complets** (>= 4 lecons, >= 5 exercices, >= 8 QCMs avec nommage conforme) vs squelettes minimaux

Afficher :

```
Programme : {label} ({programme-id})
Modules : {total}
- {slug} ({topic}) : {n} atomes existants — {COMPLET|A CREER}
- ...

Modules a creer : {count}
```

Demander confirmation a l'utilisateur avant de continuer.

## Etape 1 — Recherche web globale

Lancer UN SEUL **content-researcher** pour l'ensemble du programme :

```
Task(subagent_type: "content-researcher", max_turns: 30)
```

Prompt :
```
Recherche exhaustive sur le web pour le programme complet de mathematiques
{label} ({niveau}) en Tunisie.

Couvrir les {n} chapitres suivants :
1. {module-1} — {description}
2. {module-2} — {description}
...

Pour CHAQUE chapitre, trouver :
- Contenu mathematique detaille (definitions, theoremes, proprietes, formules)
- Exercices types par niveau de difficulte
- Erreurs frequentes des eleves
- Approches pedagogiques

Et globalement :
- Programme officiel tunisien : repartition annuelle, objectifs par trimestre
- Ressources generales (manuels, sites de reference)
- Progression pedagogique recommandee

IMPORTANT : organiser le rapport PAR CHAPITRE avec des sections claires.
Chercher sur : devoir.tn, devoirat.net, sigmaths.net, mathinfo.tn,
maths-et-tiques.fr, khan academy fr, geogebra, cnp.com.tn
```

Stocker le rapport complet pour les etapes suivantes.

## Etape 2 — Planification globale

Pour chaque module a creer, planifier :
- Nombre de lecons (4-7), exercices (6-10), QCMs (10-15)
- IDs de tous les fichiers (conformes au nommage)
- Structure du cours YAML (sections)
- Series thematiques (2 par module)

Presenter le plan COMPLET a l'utilisateur :

```
## Plan de creation — {programme}

### Module 1 : {nom} (topic: {topic})
- {n} lecons, {n} exercices, {n} QCMs
- Sections : [liste]
- Series : [liste]

### Module 2 : {nom} (topic: {topic})
...

Total : {n} lecons, {n} exercices, {n} QCMs, {n} molecules
```

Attendre confirmation.

## Etape 3 — Creation par batch

Grouper les modules par batch de 3-4 (en respectant l'ordre du programme).
Pour chaque batch, lancer la creation en parallele.

### Pour chaque module du batch

Lancer 3 agents content-creator en parallele :

```
# Agent Lecons
Task(subagent_type: "content-creator", mode: "bypassPermissions", run_in_background: true)
Prompt: [extrait du rapport de recherche pour ce module] + [plan des lecons] + [conventions]

# Agent Exercices
Task(subagent_type: "content-creator", mode: "bypassPermissions", run_in_background: true)
Prompt: [extrait du rapport de recherche pour ce module] + [plan des exercices] + [conventions]

# Agent QCMs
Task(subagent_type: "content-creator", mode: "bypassPermissions", run_in_background: true)
Prompt: [extrait du rapport de recherche pour ce module] + [plan des QCMs] + [conventions]
```

Attendre la fin des 3 agents avant de passer au batch suivant.
Entre chaque batch : creer les molecules YAML du batch (cours + series).

### Ordonnancement des batchs

Exemple pour 14 modules :
- Batch 1 : modules 1-3 (9 agents paralleles)
- Batch 2 : modules 4-6 (9 agents paralleles)
- Batch 3 : modules 7-9 (9 agents paralleles)
- Batch 4 : modules 10-12 (9 agents paralleles)
- Batch 5 : modules 13-14 (6 agents paralleles)

**IMPORTANT** : pour chaque batch, les 3 agents de chaque module sont independants
et peuvent tourner en background. Mais attendre la fin du batch avant le suivant
pour eviter de surcharger.

## Etape 4 — Molecules YAML (apres chaque batch)

Pour chaque module du batch termine :

1. **Creer/mettre a jour** le cours YAML avec sections enrichies
2. **Creer 2 series** thematiques
3. **Mettre a jour le programme** YAML (ajouter les series)

## Etape 5 — Nettoyage global

Apres tous les batchs :

1. **Lister les anciens atomes** avec nommage non conforme
2. **Verifier** qu'ils ne sont plus references par aucune molecule
3. **Supprimer** les anciens fichiers
4. **Verification de coherence** : tous les IDs dans les molecules existent

## Etape 6 — Review globale

Lancer le **content-reviewer** :

```
Task(subagent_type: "content-reviewer", max_turns: 40)
```

Scope : TOUS les nouveaux fichiers crees.
Verifier la coherence inter-modules (pas de duplication, progression logique).

## Etape 7 — Rapport final

```
## Programme "{label}" — Creation complete

### Statistiques
- Modules crees : {n}/{total}
- Lecons : {n}
- Exercices : {n}
- QCMs : {n}
- Molecules : {n} cours + {n} series
- Anciens fichiers supprimes : {n}

### Score qualite global : {score}/100

### Modules par trimestre
T1 : {liste}
T2 : {liste}
T3 : {liste}

### Statut : PROGRAMME PRET POUR PUBLICATION
```

## Notes

- Si un module est deja COMPLET (detecte en etape 0), le SAUTER
- Si la conversation approche des limites de contexte, proposer de continuer dans une nouvelle conversation en indiquant les batchs restants
- Le rapport de recherche est le document CLE — il doit etre suffisamment detaille pour que les content-creator puissent travailler sans acces web
- Privilegier la QUALITE sur la vitesse : mieux vaut 10 modules excellents que 14 mediocres
