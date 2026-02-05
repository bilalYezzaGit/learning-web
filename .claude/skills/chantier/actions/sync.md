# Action: chantier sync

Synchronise le chantier local avec l'issue GitHub associee.

## Instructions

1. **Extraire le nom** de `$ARGUMENTS` (apres "sync ")
   - Si pas de nom, utiliser le chantier actif (dernier ouvert)

2. **Lire le CONTEXTE.md** du chantier :
   - Extraire le numero d'issue depuis `> **GitHub Issue** : #XXX`
   - Si pas d'issue liee, proposer de creer une issue

3. **Lire le PLAN.md** du chantier :
   - Compter les pipelines termines vs total

4. **Mettre a jour l'issue GitHub** :
   ```bash
   gh issue edit <NUM> --body "$(cat <<'EOF'
   ## Objectif

   [Copier depuis CONTEXTE.md]

   ## Progression

   **Pipelines:** X/Y termines

   [Liste des pipelines avec statut]

   ## Definition of Done

   [Copier les checkboxes depuis CONTEXTE.md]

   ---
   _Chantier local: chantiers/<nom>/_
   _Derniere sync: <DATE>_
   EOF
   )"
   ```

5. **Mettre a jour le statut du projet** (si applicable) :
   - Si tous pipelines termines : mettre "Done"
   - Sinon : mettre "In Progress"

6. **Confirmer** la synchronisation

## Sync bidirectionnel (GitHub -> Local)

Si l'option `--pull` est specifiee :
1. Lire l'issue GitHub
2. Extraire les checkboxes cochees
3. Mettre a jour le CONTEXTE.md local

## Exemples

```
/chantier sync fix-auth
# Sync local -> GitHub

/chantier sync fix-auth --pull
# Sync GitHub -> local

/chantier sync
# Sync le chantier actif
```

## Format de sortie

```
## Sync: <nom> -> GitHub #XX

Pipelines: 3/5 termines
DoD: 5/8 complete

GitHub Issue #XX mise a jour.
Derniere sync: 2026-02-05 21:30
```
