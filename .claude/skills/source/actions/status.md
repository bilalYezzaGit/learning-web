# Action : Status

Affiche l'etat du registre de sources.

## Workflow

### 1. Lire le registry

Lire `docs/content-intelligence/sources/registry.md`.

### 2. Compter les stats

- Total des sources
- Sources scannees (statut ✅)
- Sources en attente (statut ⬜)
- Sources par categorie (site-tn, site-fr, youtube, etc.)

### 3. Lister les fiches existantes

```
Glob: docs/content-intelligence/sources/sites/*.md
```

Pour chaque fiche, lire la date de derniere mise a jour.

### 4. Afficher le dashboard

```markdown
## Source Intelligence — Dashboard

### Stats globales
- **{N}** sources dans le registry
- **{N}** scannees ({%}%)
- **{N}** en attente

### Par categorie
| Categorie | Total | Scannees | En attente |
|-----------|-------|----------|------------|
| Sites TN | {N} | {N} | {N} |
| Sites FR | {N} | {N} | {N} |
| YouTube | {N} | {N} | {N} |
| Internationaux | {N} | {N} | {N} |
| Annales | {N} | {N} | {N} |

### Fiches les plus recentes
- {slug} — scanne le {date}
- ...

### Sources a scanner en priorite
{Top 5 des sources les plus prometteuses encore en attente,
basees sur le type et la couverture attendue}

### Commandes suggerees
- `/source scan {slug}` — Scanner la source la plus prioritaire
- `/source discover` — Chercher de nouvelles sources
```
