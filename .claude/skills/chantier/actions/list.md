# Action: chantier list

Liste tous les chantiers actifs et archives.

## Instructions

1. **Lister les chantiers actifs** dans `chantiers/` (hors archive/)
   - Pour chaque chantier, lire CONTEXTE.md pour extraire :
     - Statut (En cours, En pause)
     - Objectif (premiere ligne)
     - Date de creation

2. **Lister les chantiers archives** dans `chantiers/archive/`
   - Afficher le nom et la date de completion

3. **Afficher sous forme de tableau**

## Format de sortie

```
## Chantiers actifs

| Chantier | Statut | Objectif | Cree le |
|----------|--------|----------|---------|
| add-feature | En cours | Ajouter la feature X | 2026-01-15 |

## Chantiers archives (N)

| Chantier | Complete le |
|----------|-------------|
| refactor-auth | 2026-01-08 |

---

Pour reprendre : `/chantier resume <nom>`
Pour creer : `/chantier new <nom>`
```

## Si aucun chantier

```
Aucun chantier actif.

Pour creer un nouveau chantier : `/chantier new <nom>`
```
