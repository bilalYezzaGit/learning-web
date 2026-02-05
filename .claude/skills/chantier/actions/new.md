# Action: chantier new

Cree un nouveau chantier avec sa structure de fichiers.

## Instructions

1. **Extraire le nom** de `$ARGUMENTS` (apres "new ")
   - Si pas de nom, demander a l'utilisateur
   - Format : kebab-case (ex: `add-feature`, `fix-auth`)

2. **Creer le dossier** `chantiers/<nom>/`

3. **Creer CONTEXTE.md** en utilisant le template [templates/CONTEXTE.md](../templates/CONTEXTE.md)
   - Remplacer `{{NOM_CHANTIER}}` par le nom
   - Remplacer `{{DATE}}` par la date du jour

4. **Creer PLAN.md** en utilisant le template [templates/PLAN.md](../templates/PLAN.md)
   - Remplacer `{{NOM_CHANTIER}}` par le nom

5. **Confirmer la creation** avec le chemin du dossier

6. **Proposer** de commencer a remplir le contexte (recherche + inventaire)

## Exemple

```
User: /chantier new add-stats-screen
Assistant: Chantier cree : chantiers/add-stats-screen/
- CONTEXTE.md (decisions et contraintes)
- PLAN.md (pipelines sequentiels)

Quel est l'objectif de ce chantier ?
```
