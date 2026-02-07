# Action : Create Module

Pipeline complet pour creer un module pedagogique riche a partir de zero.
Enchaine automatiquement : **recherche web** -> **creation** -> **review** -> **nettoyage**.

## Input

`$ARGUMENTS` apres "create-module" : `<nom-module> [programme]`

- `<nom-module>` : nom lisible du module (ex: "Fonctions affines", "Thales", "Vecteurs et translations")
- `[programme]` : optionnel, ID du programme cible (defaut: determiner depuis le contexte)

## Etape 0 — Identification

1. **Identifier le module** dans le programme :
   - Lire le fichier programme YAML dans `content/molecules/programmes/`
   - Trouver le slug du cours correspondant dans la liste `cours:`
   - Lire le cours YAML existant dans `content/molecules/cours/{slug}.yaml`
   - Identifier le **topic** du vocabulaire controle (§7.1 de CONTENT-CONVENTIONS.md)

2. **Inventorier l'existant** :
   - `Glob: content/atoms/*-{topic}-*.mdx` pour les atomes avec le bon topic
   - `Glob: content/atoms/*-{ancien-pattern}-*.mdx` pour les atomes avec l'ancien nommage
   - Lister ce qui existe et ce qu'il faudra remplacer

3. **Afficher un resume** a l'utilisateur :
   ```
   Module: {nom}
   Programme: {programme-id}
   Cours slug: {slug}
   Topic: {topic}
   Atomes existants: {count} (a remplacer)
   ```

## Etape 1 — Recherche web exhaustive

Lancer le **content-researcher** avec le Task tool :

```
Task(subagent_type: "content-researcher", max_turns: 25)
```

Prompt pour le researcher :
```
Recherche exhaustive sur le web pour creer un module complet "{nom-module}"
pour {niveau} en Tunisie.

Couvrir :
1. Programme officiel tunisien : objectifs, prerequis, progression
2. Contenu mathematique detaille : definitions, theoremes, proprietes, formules
3. Exercices types par niveau de difficulte (0 a 3)
4. QCM types avec distracteurs bases sur erreurs frequentes
5. Erreurs frequentes des eleves
6. Approches pedagogiques efficaces

Chercher sur : devoir.tn, devoirat.net, sigmaths.net, maths-et-tiques.fr,
khan academy fr, geogebra, et autres sites pertinents.

Produire un rapport TRES DETAILLE.
```

Attendre la fin et conserver le rapport.

## Etape 2 — Planification du contenu

A partir du rapport de recherche, planifier :

### Lecons (4-7 fichiers)
Pour chaque lecon, definir :
- ID : `lesson-{topic}-{slug}.mdx`
- title, difficulty, timeMinutes, tags
- Contenu prevu (sections, composants a utiliser)

### Exercices (6-10 fichiers)
Pour chaque exercice, definir :
- ID : `ex-{topic}-{slug}.mdx`
- title, difficulty, timeMinutes, category, tags
- Type de probleme (application, approfondissement, synthese, probleme)

### QCMs (10-15 fichiers)
Pour chaque QCM, definir :
- ID : `qcm-{topic}-{slug}.mdx`
- title, difficulty, timeMinutes, tags
- Question prevue, bonne reponse, distracteurs

### Molecules
- Cours YAML avec sections (3-5 sections)
- 2 series thematiques

Afficher le plan a l'utilisateur et attendre confirmation.

## Etape 3 — Creation parallele

Lancer **3 content-creator** en parallele avec le Task tool :

```
# Agent 1 : Lecons
Task(subagent_type: "content-creator", mode: "bypassPermissions", run_in_background: true)
Prompt: instructions detaillees pour chaque lecon avec contenu mathematique precis

# Agent 2 : Exercices
Task(subagent_type: "content-creator", mode: "bypassPermissions", run_in_background: true)
Prompt: instructions detaillees pour chaque exercice avec enonces et solutions completes

# Agent 3 : QCMs
Task(subagent_type: "content-creator", mode: "bypassPermissions", run_in_background: true)
Prompt: instructions detaillees pour chaque QCM avec question, options, explanation
```

Les 3 doivent recevoir :
- Le rapport de recherche (resume)
- Les conventions MDX (rappel des regles essentielles)
- Le plan exact des fichiers a creer
- Les instructions de contenu mathematique detaillees

Attendre la fin des 3 agents.

## Etape 4 — Molecules YAML

Apres la creation des atomes :

1. **Mettre a jour** le cours YAML `content/molecules/cours/{slug}.yaml` avec :
   - Sections enrichies (3-5 sections)
   - Steps referencant les nouveaux atomes
   - Groupes quiz (2-5 QCMs par groupe)
   - Objectifs d'apprentissage

2. **Creer 2 series** dans `content/molecules/series/` :
   - Serie fondamentaux (difficulty 1)
   - Serie approfondissement (difficulty 2)

3. **Mettre a jour le programme** si necessaire (ajouter les series dans `series:`)

## Etape 5 — Nettoyage

1. **Supprimer les anciens atomes** qui ne suivent pas les conventions de nommage
   - Identifier via Glob les fichiers avec l'ancien pattern
   - Verifier qu'ils ne sont plus references
   - Supprimer avec Bash rm

2. **Verifier la coherence** :
   - Tous les IDs references dans les molecules existent
   - Pas d'atomes orphelins pour ce topic

## Etape 6 — Review qualite

Lancer le **content-reviewer** avec le Task tool :

```
Task(subagent_type: "content-reviewer", max_turns: 30)
```

Prompt incluant :
- Liste de TOUS les fichiers crees
- Criteres techniques (CONTENT-CONVENTIONS.md)
- Criteres pedagogiques (exactitude, progression, adaptation niveau)
- Criteres molecules (IDs valides, quiz groups, structure)

## Etape 7 — Rapport final

Afficher un resume :

```
## Module "{nom}" — {programme}

### Contenu cree
- {n} lecons
- {n} exercices
- {n} QCMs
- {n} molecules (1 cours + 2 series)

### Anciens fichiers supprimes
- {liste}

### Score qualite : {score}/100

### Statut : PRET POUR PUBLICATION
```

## Regles importantes

- **Toujours lire CONTENT-CONVENTIONS.md** avant de creer du contenu
- **Topic du vocabulaire controle** : utiliser le slug court (voir §7.1)
- **Ne jamais creer de fichiers placeholder** — tout le contenu doit etre complet
- **Progression pedagogique** : difficulty 0 -> 1 -> 2 -> 3
- **Exercices** : solutions COMPLETES et verifiables
- **QCMs** : distracteurs bases sur des erreurs REELLES d'eleves
- **LaTeX** : $...$ inline, $$...$$ bloc (avec lignes vides)
