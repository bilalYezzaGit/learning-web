---
name: chantier
description: Gestion des chantiers de developpement. Use when starting work, checking progress, resuming work, or completing a task. Keywords - chantier, pipeline, task, travail, projet.
argument-hint: "[new|list|resume|exec|sync|done] [nom]"
disable-model-invocation: true
---

# Chantier Management

Systeme de gestion des taches de developpement par "chantiers" - unites de travail avec contexte, plan, et pipelines sequentiels.

## Commands

| Command | Usage | Description |
|---------|-------|-------------|
| `/chantier new <nom>` | Nouveau chantier | Cree CONTEXTE.md + PLAN.md + Issue GitHub |
| `/chantier list` | Voir tous | Liste actifs + archives |
| `/chantier resume <nom>` | Reprendre | Charge contexte et plan |
| `/chantier exec <nom>` | Executer | Lance le pipeline actuel + sync GitHub |
| `/chantier sync <nom>` | Synchroniser | Sync local <-> GitHub Issue |
| `/chantier done <nom>` | Terminer | Verifie DoD, ferme Issue, archive |

## Routing

Based on `$ARGUMENTS`:

- **Starts with "new"**: See [actions/new.md](actions/new.md)
- **Starts with "list"** or empty: See [actions/list.md](actions/list.md)
- **Starts with "resume"**: See [actions/resume.md](actions/resume.md)
- **Starts with "exec"**: See [actions/exec.md](actions/exec.md)
- **Starts with "sync"**: See [actions/sync.md](actions/sync.md)
- **Starts with "done"**: See [actions/done.md](actions/done.md)

## Templates

- [templates/CONTEXTE.md](templates/CONTEXTE.md) - Structure du fichier contexte
- [templates/PLAN.md](templates/PLAN.md) - Structure du fichier plan

## Storage

Chantiers are stored in `chantiers/<nom>/`:
- `CONTEXTE.md` - Objectif, recherche, decisions, contraintes, DoD
- `PLAN.md` - Pipelines sequentiels avec checkboxes

Archives in `chantiers/archive/<nom>/`.

## Pipeline Workflow

Each pipeline follows: **CODE** -> **VERIFY** -> **COMMIT**

- CODE: Implementation Next.js (components, pages, lib)
- VERIFY: `npm run build` + `npm run lint` + tests si applicable
- COMMIT: Git commit avec message conventionnel

## GitHub Sync

Chaque chantier est lie a une Issue GitHub dans le projet MVP.

| Moment | Action GitHub |
|--------|---------------|
| `/chantier new` | Cree Issue + ajoute au projet |
| `/chantier exec` | Commentaire + maj body Issue |
| `/chantier sync` | Sync manuel bidirectionnel |
| `/chantier done` | Ferme Issue avec resume |

Options sync :
- `--pull` : GitHub -> Local (met a jour CONTEXTE.md)
- Par defaut : Local -> GitHub (met a jour Issue)
