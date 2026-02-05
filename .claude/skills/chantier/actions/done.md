# Action: chantier done

Archive un chantier termine apres verification de la Definition of Done.

## Instructions

1. **Extraire le nom** de `$ARGUMENTS` (apres "done ")
   - Si pas de nom, lister les chantiers actifs

2. **Verifier la Definition of Done** dans CONTEXTE.md :
   - [ ] Pipelines executes et valides
   - [ ] VERIFY checklist OK (npm run build + npm run lint)
   - [ ] Chantier archive

3. **Si DoD incomplete** :
   - Lister les elements manquants
   - Demander confirmation pour forcer l'archivage ou completer

4. **Si DoD complete** :
   - Mettre a jour le statut dans CONTEXTE.md -> "Termine"
   - Ajouter la date de completion

5. **Fermer l'Issue GitHub** :
   - Lire le numero d'issue depuis CONTEXTE.md (ligne `> **GitHub Issue** : #XXX`)
   - Si pas d'issue liee (ligne contient `-`), passer cette etape
   - Fermer l'Issue avec commentaire :
     ```bash
     gh issue close <NUM> --comment "🎉 Chantier termine!

     Tous les pipelines executes et valides.
     Archive dans chantiers/archive/<nom>/"
     ```
   - Si erreur `gh`, afficher un warning mais continuer l'archivage

6. **Archiver localement** :
   - Deplacer le dossier vers `chantiers/archive/`
   - Confirmer l'archivage

## Format de sortie

### DoD incomplete
```
## Verification Definition of Done

- [x] Pipelines executes et valides
- [ ] VERIFY checklist OK

**1 element manquant.**

Options :
1. Completer maintenant
2. Forcer l'archivage (non recommande)
```

### DoD complete
```
## Chantier termine : <nom>

Definition of Done : 3/3

GitHub...
- Issue #XX fermee avec commentaire

Archivage...
- Statut mis a jour : Termine
- Date completion : 2026-01-16
- Deplace vers : chantiers/archive/<nom>/

Le chantier "<nom>" est maintenant archive.
```
