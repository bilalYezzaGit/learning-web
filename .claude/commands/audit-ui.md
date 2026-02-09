Audit UI/UX complet : verification des rules + exploration via skills pour decouvrir de nouvelles rules.

**Argument** : $ARGUMENTS

---

## Scope

- **Avec argument** (ex: `/audit-ui src/components/login-form.tsx`) : audite uniquement ce scope
- **Sans argument** (`/audit-ui`) : audite `src/app/` + `src/components/`

## Step 1 — Verification Level 1

Lance `/check` : tests automatises + tests manuels.

Affiche le resume des resultats.

## Step 2 — Exploration Level 2

Lance un agent `general-purpose` via Task tool :

```
subagent_type: general-purpose
description: Audit UI/UX exploration
prompt: |
  Tu es un auditeur UI/UX. Ton role est de trouver des NOUVELLES ameliorations
  qui ne sont pas encore dans les rules existantes.

  ## Context
  Lis d'abord les rules existantes dans docs/specs/rules/*.md pour savoir
  ce qui est DEJA verifie.

  ## Tes references
  1. Lis .agents/skills/ui-ux-pro-max/SKILL.md pour les guidelines UI/UX
  2. Lis .agents/skills/frontend-design/SKILL.md pour l'inspiration design

  ## Scope
  {SCOPE}

  ## Mission
  Lis les fichiers .tsx du scope et cherche des problemes ou ameliorations
  qui NE SONT PAS deja couverts par les rules existantes.

  ## Format de sortie
  Pour chaque trouvaille :
  - Description du probleme/amelioration
  - Fichier(s) concernes
  - Proposition de nouvelle rule (ID, [auto] ou [manual], description)
  - Severite : CRITICAL / HIGH / MEDIUM / LOW
```

## Step 3 — Propositions de nouvelles rules

Compile les trouvailles de l'agent et presente-les a l'utilisateur :

```
Nouvelles rules proposees :

1. [SEVERITY] ID — Description
   Fichier(s): ...
   Rule proposee: - XXX-NNN [auto/manual] description

2. ...
```

Demande confirmation avant d'ajouter chaque rule dans le bon fichier `docs/specs/rules/*.md`.

Si une rule est [auto], propose aussi d'ajouter le test dans `scripts/specs/*.mjs`.
