# Action: chantier resume

Reprend un chantier existant en chargeant son contexte et son plan.

## Instructions

1. **Extraire le nom** de `$ARGUMENTS` (apres "resume ")
   - Si pas de nom, lister les chantiers actifs et demander lequel reprendre

2. **Verifier que le chantier existe** dans `chantiers/<nom>/`
   - Si non trouve, suggerer les chantiers existants

3. **Lire les fichiers du chantier** :
   - `CONTEXTE.md` : objectif, recherche, decisions, contraintes
   - `PLAN.md` : pipelines et progression

4. **Afficher un resume** :

```
# Reprise : <Nom du Chantier>

**Objectif** : [objectif]
**Pipeline actuel** : X/Y - [description du pipeline]

## Prochain pipeline

### N. [Description]
- CODE: ...
- VERIFY: ...
- COMMIT: ...

Pret a continuer. On lance ce pipeline ?
```

5. **Attendre le "go"** avant d'executer

## Exemple sans argument

```
User: /chantier resume
Assistant: Quel chantier veux-tu reprendre ?

| # | Chantier | Pipeline actuel |
|---|----------|-----------------|
| 1 | add-feature | 3/5 - Ajouter les tests |

Reponds avec le numero ou le nom.
```
