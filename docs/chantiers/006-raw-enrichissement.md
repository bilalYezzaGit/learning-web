# Chantier 006 — Restructuration _raw/ et concept d'enrichissement

Status: PHASE 1 TERMINEE (restructuration), PHASE 2 A PLANIFIER (skill enrichissement)
Date: 2026-03-23

---

## Ce qui a ete fait (Phase 1)

### Restructuration _raw/

Avant :
```
_raw/
├── *.pdf                    (PDFs en vrac a la racine)
├── CARTOGRAPHIE.md          (obsolete)
├── sources/*.yaml           (fiches sans namespace)
├── reference/3eme-math/     (transcriptions sans distinction type)
└── pages/                   (extractions PNG)
```

Apres :
```
_raw/
└── 3eme-math/               (namespace par programme)
    ├── pdfs/                 (8 PDFs)
    ├── sources/              (8 fiches YAML avec champ status par module)
    ├── fondations/           (transcriptions → KB, WF0→WF1)
    │   └── {module}/         (manuel.typ, parascolaire.typ, xyplus.typ)
    └── enrichissements/      (transcriptions iteratives → patterns, WF1+)
        └── {module}/         (series, examens, cours de profs — vide pour l'instant)
```

### Tracking du statut

Chaque fiche source a maintenant un `status:` par module :
- `kb-complete` : transcrit + KB dans _meta/ (4 modules)
- `transcribed` : transcrit mais pas de KB (4 modules)
- `not-started` : pas encore transcrit (15 modules)

---

## Concept d'enrichissement (Phase 2 — a planifier)

### Le probleme

Le systeme actuel a deux flux distincts mais un seul est implemente :

| Flux | Source | Cible | Skill | Status |
|------|--------|-------|-------|--------|
| **Fondation** | Manuels/parascolaires/xyplus | `_meta/{prog}/{mod}/savoir.yaml` + `praxeologies.yaml` + `misconceptions.yaml` | `/content kb` | ✅ operationnel |
| **Enrichissement** | Series, examens, cours de profs, devoirs | `_meta/{prog}/{mod}/patterns.yaml` + potentiellement KB | `/content enrichir` | ❌ pas implemente |

Le flux enrichissement est plus complexe que le flux fondation car il **confronte** une source externe au modele existant. Les effets possibles :

### Effets d'un enrichissement

Un fichier d'enrichissement (ex: une serie d'exercices d'un prof) peut produire :

1. **Nouveau pattern** — un exercice dont la structure n'est pas dans patterns.yaml
   → Ajouter un pattern dans `_meta/{prog}/{mod}/patterns.yaml`

2. **Pattern connu, nouvelle instance** — un exercice qui correspond a un pattern existant
   → Incrementer `frequency`, ajouter la source

3. **Praxeologie manquante** — un type de tache non identifie dans praxeologies.yaml
   → Alerter l'humain, proposer une nouvelle praxeologie

4. **Contradiction avec la KB** — la source dit quelque chose qui contredit un theoreme ou une convention
   → Alerter l'humain (erreur dans la source OU dans la KB)

5. **Nouvelle misconception** — un corrige revele une erreur classique non documentee
   → Proposer un ajout dans `misconceptions.yaml`

6. **Confirmation** — la source est coherente avec le modele, rien a changer
   → Marquer le fichier comme traite

### Skill envisage : `/content enrichir {module}`

```
/content enrichir continuite
```

1. Scanne `_raw/{prog}/enrichissements/{module}/` pour les fichiers non traites
2. Charge tout `_meta/{prog}/{mod}/` (savoir + praxeologies + misconceptions + patterns)
3. Pour chaque fichier :
   - Analyse les exercices/cours/series
   - Classifie chaque element (match, nouveau, contradiction, misconception)
   - Produit un rapport
4. Propose les modifications a `_meta/` (patterns, misconceptions, praxeologies)
5. Attend validation humaine avant de modifier
6. Marque les fichiers comme traites (dans la fiche source ou dans un fichier _processed.yaml)

### Comment marquer les fichiers traites

Option A — Un fichier `_processed.yaml` par module dans enrichissements/ :
```yaml
# _raw/3eme-math/enrichissements/continuite/_processed.yaml
processed:
  - file: serie-prof-lycee-x.typ
    date: 2026-03-25
    effects: [2 new patterns, 1 misconception enriched]
  - file: synthese-t1-2024.typ
    date: 2026-03-26
    effects: [3 patterns frequency++, 0 new]
```

Option B — Un champ dans la fiche source (plus leger mais moins detaille)

### Prerequis avant implementation

- [ ] Avoir au moins 1 fichier d'enrichissement reel pour tester
- [ ] Definir le format du rapport d'enrichissement
- [ ] Decider si le skill modifie directement _meta/ ou produit un diff a valider
- [ ] Decider du tracking (option A ou B)
