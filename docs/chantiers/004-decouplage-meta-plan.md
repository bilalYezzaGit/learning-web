# Chantier 004 — Decouplage META : Plan d'execution

Status: TERMINE
Date: 2026-03-22
Vision: `docs/chantiers/004-decouplage-meta-vision.md`

---

## Phase 0 — Concevoir la structure `_meta/` ✅

> Objectif : definir l'arborescence, les formats de fichiers, et l'interface avant de toucher au code.

### 0.1 Definir l'arborescence de `_meta/` ✅

Structure implementee :

```
_meta/
├── _interface.yaml              # Contrat : IDs exposes, regles de referencement
├── global/                      # Cross-module
│   ├── lexique.md               # Vocabulaire mathematique partage (tous niveaux)
│   ├── complexite.md            # Echelle de difficulte, profondeur d'explication
│   └── prerequis-graph.yaml     # Graphe de dependances entre modules
├── examens/                     # Specifications par type d'examen
│   └── bac-3eme-t3.yaml        # BAC 3eme maths trimestre 3
└── modules/
    ├── nombre-derive/           # 5 fichiers (savoir, praxeologies, patterns, misconceptions, lexique)
    ├── fonction-derivee/        # 4 fichiers (savoir, praxeologies, misconceptions, lexique)
    └── denombrement/            # 4 fichiers (savoir, praxeologies, misconceptions, lexique)
```

**Livrables :**
- [x] Arborescence finale validee
- [x] `_interface.yaml` : contrat avec IDs modules, examens, identifiants

### 0.2 Definir le format de chaque fichier `_meta/` ✅

**Decisions prises :**
- `savoir.md` : Markdown structure (sections 0-7 de l'ancienne KB) — lisible par l'humain, parsable par le LLM
- `praxeologies.md` : Markdown structure avec IDs (Prax1, Prax2...) — savoir narratif
- `patterns.yaml` : YAML structure (variables, frequence, sources) — donnees structurees
- `misconceptions.md` : Markdown structure avec IDs (E1, E2...) — savoir narratif
- `lexique.md` : Markdown — regles de redaction specifiques au module
- `examens/{slug}.yaml` : YAML — donnees structurees

### 0.3 Definir l'interface META ↔ CONTENT ✅

Interface implementee dans `_meta/_interface.yaml`. Les plans referencent `_meta/` via le champ `meta_refs` :
```yaml
meta_refs:
  module: nombre-derive          # → resolu via _interface.yaml
  patterns: [Prax1.v1, ...]     # optionnel, pour livrets examen
  examen: bac-3eme-t3           # optionnel, pour livrets de preparation
```

---

## Phase 1 — Migrer les KB existantes vers `_meta/` ✅

### 1.1 Creer la structure `_meta/` ✅

- [x] Repertoires crees : `_meta/`, `_meta/global/`, `_meta/examens/`, `_meta/modules/`
- [x] `_meta/_interface.yaml` cree (version 1)

### 1.2 Migrer `nombre-derive` ✅

- [x] KB lue et distribuee dans 4 fichiers :
  - `_meta/modules/nombre-derive/savoir.md` (178 lignes — sections 0-7)
  - `_meta/modules/nombre-derive/praxeologies.md` (180 lignes — section 8, 13 praxeologies)
  - `_meta/modules/nombre-derive/misconceptions.md` (98 lignes — section 9, 7 misconceptions)
  - `_meta/modules/nombre-derive/lexique.md` (15 lignes — section 10)
- [x] `_patterns.yaml` migre → `_meta/modules/nombre-derive/patterns.yaml` (772 lignes)
- [x] IDs coherents avec `_interface.yaml`
- [x] Anciens fichiers supprimes de `content/3eme-math/nombre-derive/`

### 1.3 Migrer `fonction-derivee` ✅

- [x] KB lue et distribuee dans 4 fichiers :
  - `_meta/modules/fonction-derivee/savoir.md` (181 lignes)
  - `_meta/modules/fonction-derivee/praxeologies.md` (133 lignes, 10 praxeologies)
  - `_meta/modules/fonction-derivee/misconceptions.md` (76 lignes, 7 misconceptions)
  - `_meta/modules/fonction-derivee/lexique.md` (34 lignes)
- [x] Pas de `_patterns.yaml` a migrer
- [x] Ancien `_kb.md` supprime

### 1.4 Migrer `denombrement` ✅

- [x] KB lue et distribuee dans 4 fichiers :
  - `_meta/modules/denombrement/savoir.md` (168 lignes)
  - `_meta/modules/denombrement/praxeologies.md` (132 lignes, 11 praxeologies)
  - `_meta/modules/denombrement/misconceptions.md` (78 lignes, 6 misconceptions)
  - `_meta/modules/denombrement/lexique.md` (29 lignes)
- [x] Pas de `_patterns.yaml` a migrer
- [x] Ancien `_kb.md` supprime

### 1.5 Creer les fichiers globaux initiaux ✅

- [x] `_meta/global/lexique.md` — conventions de vocabulaire communes
- [x] `_meta/global/complexite.md` — echelle de difficulte 0-3 avec criteres detailles
- [x] `_meta/global/prerequis-graph.yaml` — graphe de 7 modules 3eme-math (T1-T3)

### 1.6 Validation de la migration ✅

- [x] Pipeline `npm run generate` : 0 erreurs, 0 warnings, 9 PDFs generes
- [x] Les fichiers `_meta/` contiennent l'integralite du contenu des KB originales (verifie par line count)

---

## Phase 2 — Adapter les workflows et skills ✅

### 2.1 Adapter le skill `/content kb` ✅

- [x] `SKILL.md` mis a jour — references `_meta/modules/{module}/`
- [x] `actions/create-kb.md` mis a jour — ecrit 4 fichiers dans `_meta/` + maj `_interface.yaml`
- [x] `references/kb-template.md` mis a jour — note sur la structure eclatee

### 2.2 Adapter le skill `/content patterns` ✅

- [x] `SKILL.md` mis a jour — chemin `_meta/modules/{module}/patterns.yaml`
- [x] `actions/enrich-patterns.md` mis a jour — lit praxeologies depuis `_meta/`, ecrit patterns dans `_meta/`

### 2.3 Adapter le skill `/content plan` ✅

- [x] `SKILL.md` mis a jour — note sur `meta_refs` et `_interface.yaml`
- [x] `references/planning-template.yaml` mis a jour — champ `meta_refs` ajoute

### 2.4 Adapter le skill `/content creer` ✅

- [x] `actions/create-from-planning.md` mis a jour — lit savoir + praxeologies depuis `_meta/`

### 2.5 Adapter le skill `/content valider` ✅

- [x] `actions/validate-module.md` mis a jour — lit les 4 fichiers split depuis `_meta/`
- [x] Pipeline non impacte (confirme : il ne lit ni KB ni patterns)

---

## Phase 3 — Adapter le pipeline et la documentation ✅

### 3.1 Pipeline `tools/pipeline/` ✅

- [x] Pipeline ignore `_meta/` (confirme — scanne uniquement `content/`)
- [x] Suppression des `_kb.md` et `_patterns.yaml` de `content/` ne casse rien (0 errors, 0 warnings)
- [x] Pipeline ne reference `_kb.md` nulle part dans son code

### 3.2 Mettre a jour `docs/content-agentic-workflow.md` ✅

- [x] Partie 1 : 8 nouvelles lignes pour les ressources `_meta/`
- [x] Partie 2 : WF1, WF1+, WF2 mis a jour avec les chemins `_meta/`
- [x] Partie 2 : diagrammes mermaid mis a jour
- [x] Partie 3 : metriques mises a jour (date 2026-03-22)
- [x] Partie 4 : lacunes L7/L8 marquees partiellement resolues

### 3.3 Mettre a jour `docs/CONTENT-CONVENTIONS.md` ✅

- [x] Version 5 (2026-03-22)
- [x] Section patterns : chemin `_meta/modules/{slug}/patterns.yaml`
- [x] Arborescence : `_meta/` ajoutee, `_kb.md`/`_patterns.yaml` retires de `content/`
- [x] Table "invisible to pipeline" : remplacee par table `_meta/`

### 3.4 Mettre a jour `CLAUDE.md` ✅

- [x] `_meta/` ajoute dans la section Structure
- [x] Convention `Modele academique → _meta/` ajoutee
- [x] Reference legacy `_kb.md` retiree

### 3.5 Nettoyer les anciens fichiers ✅

- [x] `docs/CONTENT-SYSTEM-VISION.md` — deja supprime (remplace par vision chantier 004)
- [x] `docs/PLAN-GENTECH-V2.md` — deja supprime (remplace par ce plan)
- [x] `_kb.md` de `content/` — supprimes (3 fichiers)
- [x] `_patterns.yaml` de `content/` — supprime (1 fichier)

---

## Phase 4 — Creer le premier contenu `_meta/` inedit ✅ (partiel)

### 4.1 Creer une specification d'examen ✅

- [x] `_meta/examens/bac-3eme-t3.yaml` cree — structure BAC 3eme maths T3
  - Duree (180 min), 5 exercices, distribution par module, patterns transversaux
- [x] `_interface.yaml` mis a jour avec la ref examen

### 4.2 Creer un plan de livret cross-module — REPORTE

Reporte a une session ulterieure. L'architecture est en place, mais la creation effective d'un livret cross-module necessite une iteration avec l'utilisateur pour definir le contenu.

### 4.3 Enrichir `_meta/global/` ✅

- [x] `_meta/global/complexite.md` — criteres detailles par niveau (0-3), correspondance avec types d'atomes
- [x] `_meta/global/prerequis-graph.yaml` — 7 modules, dependances, trimestres

---

## Bilan final

| Phase | Status | Fichiers crees/modifies |
|-------|--------|------------------------|
| Phase 0 | ✅ | 4 fichiers `_meta/` structure |
| Phase 1 | ✅ | 14 fichiers `_meta/modules/` + 4 fichiers supprimes de `content/` |
| Phase 2 | ✅ | 6 fichiers skills modifies |
| Phase 3 | ✅ | 4 fichiers docs modifies |
| Phase 4 | ✅ partiel | 1 spec examen creee, livret cross-module reporte |

**Pipeline** : `npm run generate` → 0 erreurs, 175 atomes, 9 livrets, 9 PDFs ✅
