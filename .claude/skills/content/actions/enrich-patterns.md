# Action : Enrichir les patterns d'examen (WF1+)

## Declencheur

`/content patterns {module}` — L'utilisateur fournit des exercices en contexte (Typst, MDX, texte, images, PDF).

## Pre-requis

1. **KB module obligatoire** : verifier que `_meta/{programme}/{module}/praxeologies.yaml` existe.
   Si absent → arreter et informer : "Cree d'abord la KB avec `/content kb {module}`."

2. **Identifier le programme** : parcourir `content/*/` pour trouver le module demande.

## Etapes

### 1. Charger le contexte

```
Read: _meta/{programme}/{module}/praxeologies.yaml
      → Liste des Prax avec T, tau, theta, difficulte
```

```
Read: .claude/skills/content/references/patterns-template.yaml
      → Template de reference pour le format
```

```
Read: _meta/{programme}/{module}/patterns.yaml  (si existe)
      → Patterns existants a enrichir
      → Si n'existe pas : on creera le fichier a l'etape 5
```

### 2. Identifier les exercices a analyser

Les exercices viennent du contexte de l'utilisateur. Sources possibles :

| Source | Comment la lire |
|--------|----------------|
| Transcriptions Typst (`_raw/{prog}/fondations/{mod}/*.typ`) | Read direct — extraire les exercices (blocs "Exercice N", "QCM", "Vrai ou Faux") |
| Fichiers MDX existants | Read direct — parser l'enonce |
| Texte libre dans le prompt | Analyser directement |
| Images (photos de series, BAC) | Lecture visuelle — decrire l'exercice |

Si l'utilisateur ne fournit pas de source explicite, proposer :
```
Je peux enrichir les patterns a partir de :
1. Les transcriptions Typst existantes (_raw/{prog}/fondations/{mod}/)
2. Des exercices que tu me donnes (texte, image, PDF)

Quelle source veux-tu utiliser ?
```

### 3. Analyser chaque exercice

Pour chaque exercice identifie :

**a) Identifier la praxeologie**
- Lire l'enonce et la solution/methode
- Comparer avec les praxeologies de la KB (T = type de tache, tau = technique)
- Rattacher a la praxeologie la plus specifique
- Si un exercice mobilise PLUSIEURS praxeologies → le classer sous la praxeologie PRINCIPALE (celle qui definit le coeur de l'exercice)

**b) Extraire le pattern**
- **method** : les etapes de resolution (methode, pas solution)
- **variables** : qu'est-ce qui change entre exercices du meme type ? (fonction, intervalle, parametre, type de question...)
- **difficulty** : 0-3, coherent avec la KB

**c) Comparer avec les patterns existants**

Critere de "meme variante" : meme praxeologie + meme methode de resolution + meme structure d'enonce. Seules les valeurs numeriques/fonctions changent.

- **Si variante connue** :
  - Incrementer `frequency`
  - Ajouter la source dans `sources[]`
  - Si l'exercice est un bon exemple representatif, l'ajouter dans `examples[]`
  - Enrichir `variables` si l'exercice montre de nouvelles valeurs possibles

- **Si nouvelle variante** (meme praxeologie, methode differente) :
  - Creer un nouveau pattern avec ID `PraxN.vM` (M = prochain numero)
  - Remplir tous les champs : name, description, method, variables, difficulty
  - `frequency: 1`
  - Ajouter la source et l'exemple

- **Si praxeologie inconnue** (pas dans la KB) :
  - **NE PAS creer de pattern**
  - **NE PAS modifier la KB**
  - Ajouter a une liste "non classifies" pour le rapport final
  - Signaler : "Exercice X ne correspond a aucune praxeologie de la KB. Praxeologie a ajouter ?"

### 4. Construire le rapport

Avant d'ecrire, afficher un resume :

```
## Rapport d'enrichissement — {module}

**Source** : {description de la source analysee}
**Exercices analyses** : N
**Nouveaux patterns** : M
**Variantes enrichies** : K (frequency incrementee)
**Non classifies** : J

### Nouveaux patterns
- Prax3.v2 : "TVI + encadrement successif" (1 occurrence)
- Prax5.v1 : "Derivee et approximation lineaire" (1 occurrence)

### Variantes enrichies
- Prax1.v1 : frequency 3 → 4 (+1 source: "BAC 2024 ex.1")
- Prax3.v1 : frequency 5 → 7 (+2 sources)

### Non classifies (a traiter manuellement)
- Exercice 12 p.45 : "Probleme ouvert sur les suites" — aucune praxeologie correspondante
```

Demander validation avant d'ecrire.

### 5. Ecrire le fichier

Si `_meta/{programme}/{module}/patterns.yaml` existe → mettre a jour (ajouter les nouveaux patterns, incrementer les frequencies).
Si n'existe pas → creer depuis le template.

```
Write: _meta/{programme}/{module}/patterns.yaml
```

**Toujours** incrementer `version` de 1.

### 6. Confirmer

```
_patterns.yaml enrichi (version {N} → {N+1}).
{M} nouveaux patterns, {K} variantes enrichies, {J} non classifies.
Prochaine etape : /content plan {module} pour planifier les livrets.
```

## Gardes

- **KB obligatoire** — pas de patterns sans KB
- **Ne jamais modifier la KB** — si une praxeologie manque, signaler seulement
- **Exemples reels uniquement** — les `examples` doivent etre des exercices reels avec source
- **Pas d'enonces inventes** — le champ `enonce` dans les exemples est le texte original
- **Seuil de variantes** — au-dela de ~10 variantes pour une meme praxeologie, signaler et proposer de regrouper les variantes trop proches
- **Idempotence** — si la meme source est feedee deux fois, ne pas doubler les patterns/frequencies. Verifier les sources existantes avant d'incrementer.

## Anti-patterns

- Ne pas creer un pattern par exercice — des exercices similaires = meme pattern
- Ne pas copier la praxeologie de la KB dans le pattern — le pattern REFERENCE la praxeologie, il ne la remplace pas
- Ne pas remplir `method` avec la solution — c'est la METHODE (etapes generiques), pas la solution (calculs specifiques)
