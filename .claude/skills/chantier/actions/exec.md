# Action: chantier exec

Execute le pipeline actuel du chantier en cours.

## IMPORTANT - REGLES D'EXECUTION

**TU DOIS EXECUTER REELLEMENT CHAQUE COMMANDE** - Ne pas simuler ou afficher des exemples.

- Tout se fait sur main (pas de branches)
- Suivre le pipeline sequentiellement : CODE -> VERIFY -> COMMIT

---

## Phase 0 : Chargement

1. **Extraire le nom** de `$ARGUMENTS` (apres "exec ")

2. Lire `chantiers/<nom>/CONTEXTE.md`
   - Si n'existe pas, lister les chantiers avec `ls chantiers/` et ARRETER

3. Lire `chantiers/<nom>/PLAN.md`

4. Identifier le prochain pipeline non coche (marque `[ ]`)
   - Si tous coches, informer que le chantier est termine -> suggerer `/chantier done`

---

## Phase 1 : Execution du pipeline

Pour le pipeline actuel, executer chaque etape presente :

### CODE (si presente)
- Implementer dans Next.js
- Components -> `src/components/` (ui, patterns, sections)
- Pages -> `src/app/` (routes)
- Logic -> `src/lib/` (services, hooks, stores)
- Types -> `src/types/`

### VERIFY (obligatoire)
Checklist fixe :
1. `npm run build` -> 0 erreurs
2. `npm run lint` -> 0 erreurs
3. Tests passent si applicable
4. App fonctionne (verification manuelle)

### COMMIT (obligatoire)
1. `git add` des fichiers modifies
2. `git commit -m "<message du pipeline>"`
3. Cocher le pipeline dans PLAN.md -> `[x]`

---

## Phase 2 : Sync GitHub

Apres le COMMIT reussi :

1. **Lire le numero d'issue** depuis CONTEXTE.md (ligne `> **GitHub Issue** : #XXX`)
   - Si pas d'issue liee (ligne contient `-`), passer cette phase

2. **Ajouter un commentaire sur l'Issue** :
   ```bash
   gh issue comment <NUM> --body "✅ **Pipeline <N> termine**: <DESCRIPTION>

   - Commit: <COMMIT_HASH>
   - Pipelines restants: <PENDING_COUNT>"
   ```

3. **Mettre a jour le body de l'Issue** avec la progression :
   - Lire PLAN.md pour extraire la liste des pipelines et leur statut
   - Lire CONTEXTE.md pour extraire la DoD
   - Mettre a jour l'issue avec `gh issue edit <NUM> --body "..."`
   - Inclure : objectif, progression pipelines, DoD avec checkboxes

4. Si erreur `gh`, afficher un warning mais continuer

---

## Phase 3 : Rapport

Format :
```
## Fait

- [1 ligne par fichier/action]
- GitHub: Commentaire ajoute sur l'issue #XX (ou "Pas d'issue liee")

## A noter

- [uniquement si attention necessaire]

Pipeline suivant : [description] ou "Chantier termine"
```
