# Claude Code only — Workflow agentique pour produire des modules de maths (Lycée Tunisien / 1ère année tronc commun)

Ce document décrit une **implémentation concrète dans ton repo** pour produire des ressources pédagogiques (cours + exercices + interactivité + pack final) **uniquement avec Claude Code**, en exploitant : **Skills (slash commands)**, **Subagents**, **Hooks**, **Permissions**, **Checkpointing (/rewind)**.

---

## 1) Objectif

- Tout se fait **dans le code source** : génération, structuration, QA, exports.
- Chaque module produit des artefacts versionnés et audités :
  - `Sources` → `Syllabus + CoverageMap` → `NotationPack` → `Cours` → `ExBank` → `InteractivitySpec` → `PackFinal` → `QA Report`

---

## 2) Structure de repo recommandée

```txt
.
├── CLAUDE.md
├── content/
│   └── tn/
│       └── lycee/
│           └── 1as-tronc-commun/
│               └── <module-slug>/
│                   ├── 00-sources.md
│                   ├── 01-syllabus.md
│                   ├── 02-notation-pack.md
│                   ├── 03-cours.mdx
│                   ├── 04-exercices.mdx
│                   ├── 05-interactivite.md
│                   └── 06-pack-final.md
├── schemas/
│   └── module.schema.json
├── scripts/
│   ├── qa-module.mjs
│   └── format-content.mjs
└── .claude/
    ├── settings.json
    ├── agents/
    │   ├── tn-program-architect.md
    │   ├── tn-math-rigor-auditor.md
    │   ├── tn-exercise-designer.md
    │   └── tn-exporter.md
    └── skills/
        ├── tn-init-module/
        │   └── SKILL.md
        ├── tn-architect/
        │   └── SKILL.md
        ├── tn-notation-pack/
        │   └── SKILL.md
        ├── tn-write-course/
        │   └── SKILL.md
        ├── tn-generate-exercises/
        │   └── SKILL.md
        ├── tn-design-interactivity/
        │   └── SKILL.md
        ├── tn-assemble-pack/
        │   └── SKILL.md
        └── tn-qa/
            └── SKILL.md
```

---

## 3) `CLAUDE.md` (mémoire projet)

Place ce fichier à la racine du repo.

```md
# Projet — Production contenus maths (Tunisie)

Mission :
- Produire des ressources pédagogiques alignées au programme tunisien.

Cible actuelle :
- Lycée — 1ère année tronc commun (math).

Règles :
- Contenu original (pas de copier-coller long de manuels).
- Anti-hallucination : toute info non sourcée = **NON CONFIRMÉ**.
- Sorties structurées et réutilisables (MDX/JSON si besoin).
- Toujours produire : Sources, Syllabus+CoverageMap, NotationPack, Cours, Exercices, Interactivité, Pack final, QA.

Chemins :
- Modules : content/tn/lycee/1as-tronc-commun/<module-slug>/
```

---

## 4) Subagents (spécialisation)

> À créer dans `.claude/agents/`.  
> Objectif : isoler les rôles, limiter outils, réduire erreurs, gagner en vitesse.

### 4.1 `tn-program-architect.md` (recherche + périmètre)

```md
---
name: tn-program-architect
description: Recherche/extraction programme tunisien + périmètre module (1AS)
model: sonnet
tools: Read, Glob, Grep, WebFetch
permissionMode: plan
---

Tu produis : Sources + Syllabus + Objectifs + Prérequis + Erreurs fréquentes + CoverageMap.
Règle : si non sourcé => NON CONFIRMÉ.
```

### 4.2 `tn-math-rigor-auditor.md` (audit rigueur — lecture seule)

```md
---
name: tn-math-rigor-auditor
description: Audite rigueur, notations, cohérence, couverture (lecture seule)
model: sonnet
tools: Read, Glob, Grep, Bash
disallowedTools: Write, Edit
permissionMode: plan
---

Tu détectes : incohérences de notations, hypothèses manquantes, trous CoverageMap, erreurs de preuve.
Tu proposes un patch minimal (liste d’actions).
```

### 4.3 `tn-exercise-designer.md` (exercices + barèmes + figures)

```md
---
name: tn-exercise-designer
description: Génère exercices gradés + corrigés + barèmes + figures reproductibles
model: sonnet
tools: Read, Glob, Grep, Write, Edit, Bash
permissionMode: acceptEdits
---

Tu produis des exercices alignés au Syllabus, en couvrant toutes notions.
Si figure : description + coordonnées (x,y) + ce qu’on doit observer.
```

### 4.4 `tn-exporter.md` (assemblage + export)

```md
---
name: tn-exporter
description: Assemble pack final + export MDX/JSON + normalisation frontmatter
model: sonnet
tools: Read, Glob, Grep, Write, Edit, Bash
permissionMode: acceptEdits
---

Tu compiles le module en timeline et déclines exports si demandé.
Tu lances les scripts format/QA si disponibles.
```

---

## 5) Skills = commandes reproductibles (slash commands)

> Chaque skill : `.claude/skills/<name>/SKILL.md`  
> Mets `disable-model-invocation: true` pour que Claude ne déclenche pas ça “tout seul”.

### 5.1 `/tn-init-module` — init dossier module

```md
---
name: tn-init-module
description: Initialise le dossier d’un module (1AS) avec tous les fichiers attendus
argument-hint: "<module-slug> <module-title>"
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Glob, Grep
---

Créer `content/tn/lycee/1as-tronc-commun/$0/` et les fichiers :
00-sources.md, 01-syllabus.md, 02-notation-pack.md, 03-cours.mdx,
04-exercices.mdx, 05-interactivite.md, 06-pack-final.md

- Ajouter dans 00-sources.md : section “Sources à compléter”.
- Ajouter dans 01-syllabus.md : squelette Syllabus + CoverageMap.
- Ajouter un mini footer “Next: /tn-architect $0”.

$ARGUMENTS
```

### 5.2 `/tn-architect` — étape 1 (programme + périmètre)

```md
---
name: tn-architect
description: Recherche programme + extrait périmètre + produit Syllabus/CoverageMap
argument-hint: "<module-slug>"
disable-model-invocation: true
context: fork
agent: tn-program-architect
---

Écris les livrables dans :
- content/tn/lycee/1as-tronc-commun/$0/00-sources.md
- content/tn/lycee/1as-tronc-commun/$0/01-syllabus.md

Livrables obligatoires :
- Sources: liens + justification (1 ligne), sans copier-coller long.
- Syllabus: notions exhaustives.
- Objectifs (8–15), Prérequis + mini-diagnostic (3 questions).
- Erreurs fréquentes (8–12).
- CoverageMap (table Notion ↔ Objectif ↔ Exemple ↔ Exercice).
Règle : non sourcé => NON CONFIRMÉ.

$ARGUMENTS
```

### 5.3 `/tn-notation-pack` — étape 2 (rigueur)

```md
---
name: tn-notation-pack
description: Construit NotationPack (LaTeX + conventions tunisiennes + checklist rigueur)
argument-hint: "<module-slug>"
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Glob, Grep
---

En te basant sur 01-syllabus.md, écris 02-notation-pack.md :
- Notations LaTeX + conventions
- Tournures de rédaction (style tunisien)
- Définitions formelles + variantes pédagogiques
- Checklist de rigueur (12–20 points)

$ARGUMENTS
```

### 5.4 `/tn-write-course` — étape 3 (cours MDX)

```md
---
name: tn-write-course
description: Rédige le cours complet (sections/leçons) + exemples + mini-quiz
argument-hint: "<module-slug>"
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Glob, Grep
---

Écris 03-cours.mdx :
- Plan “Udemy”: sections -> leçons + durée estimée
- Pour chaque leçon:
  1) intro vulgarisée
  2) définitions/propriétés (LaTeX) rigoureuses
  3) Astuce du Prof (piège)
  4) exemple résolu (style tunisien)
  5) mini-quiz (3 questions + réponses)
- Couvrir toutes notions du Syllabus.

$ARGUMENTS
```

### 5.5 `/tn-generate-exercises` — étape 4 (banque + corrigés)

```md
---
name: tn-generate-exercises
description: Génère exercices gradés + corrigés + barèmes + figures
argument-hint: "<module-slug>"
disable-model-invocation: true
context: fork
agent: tn-exercise-designer
---

Écris 04-exercices.mdx :
- Série Flash (5)
- Série Entraînement (8–12)
- Série Synthèse (4–6)
- Série “Bac style” (2–4)
Pour chaque exo:
- Énoncé, indications (optionnel), corrigé complet, barème, tags (notion/objectif/difficulté 1–5)
Figures:
- description + coordonnées (x,y) + “ce qu’on doit observer”.

$ARGUMENTS
```

### 5.6 `/tn-design-interactivity` — étape 5 (interactivité)

```md
---
name: tn-design-interactivity
description: Spécifie interactivité (agnostique tech) + feedback + validation
argument-hint: "<module-slug>"
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Glob, Grep
---

Écris 05-interactivite.md :
Pour chaque notion clé :
- objectif pédagogique
- scénario “déplace X -> Y -> observe Z”
- feedback erreurs (3) + hints (2)
- critères de réussite
Bonus: “solution animée” pour 2 exercices de synthèse.

$ARGUMENTS
```

### 5.7 `/tn-assemble-pack` — étape 6 (pack final)

```md
---
name: tn-assemble-pack
description: Compile timeline finale + annexes + exports si besoin
argument-hint: "<module-slug>"
disable-model-invocation: true
context: fork
agent: tn-exporter
---

Écris 06-pack-final.md :
- Timeline: section -> leçon + interaction + activité pratique
- Annexes: banque synthèse + bac, glossaire, checklist examen
Option: exporter JSON/MDX index si le repo le demande.

$ARGUMENTS
```

### 5.8 `/tn-qa` — QA systématique

```md
---
name: tn-qa
description: Lance QA + audit rigueur + rapport de couverture
argument-hint: "<module-slug>"
disable-model-invocation: true
context: fork
agent: tn-math-rigor-auditor
---

1) Lire les fichiers du module.
2) Vérifier :
- couverture Syllabus (chaque notion apparaît dans cours + exercices)
- cohérence notations (NotationPack vs cours vs exos)
- hypothèses explicitement posées
3) Si scripts disponibles:
- lancer `node scripts/qa-module.mjs <module-slug>`
4) Écrire un `QA Report` (dans 06-pack-final.md ou un 07-qa-report.md si tu préfères).

$ARGUMENTS
```

---

## 6) Permissions & sécurité (`.claude/settings.json`)

Exemple : **autonomie d’édition** sur le contenu, protection des fichiers sensibles, Bash sous contrôle.

```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./secrets/**)",
      "Bash(rm *)",
      "Bash(rm -rf *)",
      "Bash(curl *)",
      "Bash(wget *)"
    ],
    "ask": ["Bash", "WebFetch"],
    "allow": [
      "Write(content/**)",
      "Edit(content/**)",
      "Write(.claude/**)",
      "Edit(.claude/**)"
    ]
  }
}
```

---

## 7) Hooks (optionnels mais très utiles)

Objectif :
- auto-format après write/edit
- empêcher actions dangereuses
- normaliser MDX

À configurer via `/hooks` (ou dans `.claude/settings.json` selon ton setup).

Idée simple :
- PostToolUse(Edit|Write) -> lancer `node scripts/format-content.mjs`

---

## 8) Runbook (utilisation au quotidien)

1) Une fois : `/init` puis créer/compléter `CLAUDE.md`.
2) Pour un nouveau module :

```txt
/tn-init-module fonctions "Fonctions et courbes"
/tn-architect fonctions
/tn-notation-pack fonctions
/tn-write-course fonctions
/tn-generate-exercises fonctions
/tn-design-interactivity fonctions
/tn-assemble-pack fonctions
/tn-qa fonctions
```

3) Si une étape casse du contenu : `/rewind` (checkpoint).
4) Commit git quand QA OK.

---

## 9) Conseils “pro” (fiabilité + vitesse)

- Utilise `context: fork` sur les étapes lourdes (architect/exercices/qa) pour éviter l’encombrement de contexte.
- Garde `tn-math-rigor-auditor` en lecture seule : il te protège des “corrections destructrices”.
- Bloque Bash destructif (deny) ; préfère scripts maison safe.
- Exige une CoverageMap : c’est ton garde-fou anti-trous.

---

## 10) Prochain upgrade (quand tu voudras scaler)

- Ajouter un `module.schema.json` + validation automatique dans `qa-module.mjs`.
- Générer des exports `index.json` pour ta plateforme.
- Ajouter un skill `/tn-new-batch` pour créer 5 modules d’un coup + QA.
