# Système de Contenu - Documentation Complète

Ce document décrit le système de gestion de contenu et les options de configuration.

## Architecture actuelle

```
                    ┌─────────────┐
                    │   YAML      │  ← Source (content/)
                    │  (75 files) │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │  build.js   │  ← Build (scripts/content-build/)
                    │  (Node.js)  │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │    JSON     │  ← Output (public/content/)
                    │  (25 files) │
                    └──────┬──────┘
                           │
              ┌────────────┴────────────┐
              │                         │
     ┌────────▼────────┐      ┌────────▼────────┐
     │  Firebase CDN   │      │   Next.js       │
     │  (actuel)       │      │   (option)      │
     └────────┬────────┘      └────────┬────────┘
              │                         │
              ▼                         ▼
     https://learning-os-     /content/programmes.json
     platform.web.app/        (servi par Next.js)
     content/
```

## Structure des fichiers

### Source YAML (content/)

```
content/
├── activities/                    # 75 activités
│   ├── lesson-cont-intro.yaml    # Cours
│   ├── ex-cont-01.yaml           # Exercices
│   └── qcm-cont-bases.yaml       # QCM
├── programmes/
│   ├── 3eme-math/
│   │   ├── _index.yaml           # Métadonnées programme
│   │   └── modules/
│   │       └── continuite/
│   │           ├── _module.yaml  # Métadonnées module
│   │           └── sections/
│   │               ├── 01-notion.yaml
│   │               └── 02-theoremes.yaml
│   ├── 3eme-sciences/
│   └── 1ere-tc/
└── series/
    ├── serie-tvi-maitrise.yaml
    └── serie-continuite-fondamentaux.yaml
```

### Output JSON (public/content/)

```
public/content/
├── programmes.json          # Catalogue (léger, sans activités)
├── cours/
│   ├── continuite.json     # Module avec activités inline
│   └── derivation.json
├── series/
│   ├── index.json          # Catalogue séries
│   └── serie-tvi-maitrise.json
└── version.json            # Pour cache busting
```

## Scripts disponibles

```bash
# Dans scripts/content-build/
npm run build         # YAML → JSON (génère public/content/)
npm run validate      # Valide le contenu YAML
npm run deploy        # Build + firebase deploy + bump version
npm run bump-version  # Incrémente content_version dans Remote Config
```

## Configuration actuelle : Firebase CDN

Le content-service.ts utilise actuellement Firebase Hosting CDN :

```typescript
// src/lib/services/content-service.ts
const BASE_URL = 'https://learning-os-platform.web.app/content'

export async function fetchProgrammes() {
  const res = await fetch(`${BASE_URL}/programmes.json`)
  return res.json()
}
```

### Avantages Firebase CDN
- Cache distribué globalement
- Séparation contenu / app
- Déploiement indépendant
- Headers de cache configurables

### Inconvénients
- Configuration Firebase requise
- Deux déploiements (app + contenu)
- CORS nécessaire

---

## Option Alternative : Servir via Next.js

Next.js peut servir les fichiers JSON directement depuis `public/`.

### Changements requis

#### 1. Modifier content-service.ts

```typescript
// AVANT (Firebase CDN)
const BASE_URL = 'https://learning-os-platform.web.app/content'

// APRÈS (Next.js direct)
const BASE_URL = '/content'  // ou process.env.NEXT_PUBLIC_CONTENT_URL || '/content'
```

#### 2. Build le contenu avant le build Next.js

```json
// package.json (racine)
{
  "scripts": {
    "prebuild": "npm run content:build",
    "content:build": "cd scripts/content-build && npm run build",
    "content:validate": "cd scripts/content-build && npm run validate"
  }
}
```

#### 3. Ajouter public/content/ au .gitignore

```gitignore
# Content build output
public/content/
```

### Avantages Next.js direct
- Un seul déploiement
- Pas de CORS
- Plus simple à configurer
- Fonctionne en local sans Firebase

### Inconvénients
- Rebuild complet si contenu change
- Pas de cache CDN distribué (sauf Vercel/Cloudflare)
- Bundle plus gros en production

---

## Stratégie recommandée

### Pour le développement local
- Utiliser Next.js direct (`BASE_URL = '/content'`)
- Pas besoin de Firebase configuré

### Pour la production
- **Option simple** : Next.js direct (un seul déploiement)
- **Option optimisée** : Firebase CDN (meilleur cache, updates indépendants)

### Variable d'environnement

```typescript
// content-service.ts
const BASE_URL = process.env.NEXT_PUBLIC_CONTENT_URL 
  || (process.env.NODE_ENV === 'development' ? '/content' : 'https://cdn.example.com/content')
```

```env
# .env.local (dev)
NEXT_PUBLIC_CONTENT_URL=/content

# .env.production (prod avec CDN)
NEXT_PUBLIC_CONTENT_URL=https://learning-os-platform.web.app/content
```

---

## Format des fichiers JSON

### programmes.json (catalogue)

```json
{
  "programmes": [
    {
      "id": "3eme-math",
      "label": "3ème année - Math",
      "levelSlug": "3eme",
      "sectionSlug": "math",
      "modules": [
        {
          "id": "continuite",
          "title": "Continuité",
          "description": "...",
          "objectives": ["...", "..."],
          "activityCount": 12
        }
      ]
    }
  ]
}
```

### cours/{id}.json (module complet)

```json
{
  "id": "continuite",
  "title": "Continuité",
  "description": "...",
  "objectives": ["..."],
  "sections": [
    {
      "id": "notion",
      "label": "Notion de continuité",
      "activities": [
        {
          "id": "lesson-cont-intro",
          "type": "lesson",
          "title": "Introduction à la continuité",
          "body": "<p>...</p>"
        },
        {
          "id": "ex-cont-01",
          "type": "exercise",
          "title": "Exercice 1",
          "enonce": "<p>...</p>",
          "solution": "<p>...</p>"
        }
      ]
    }
  ]
}
```

### series/{id}.json

```json
{
  "id": "serie-tvi-maitrise",
  "title": "Maîtrise du TVI",
  "description": "...",
  "activities": [
    { "id": "...", "type": "qcm", "..." : "..." }
  ]
}
```

---

## Validation du contenu

Le script `validate.js` vérifie :

1. **Champs requis** : id, type, title
2. **Type-specific** :
   - Exercises : enonce, solution
   - QCM : questions avec options et correctIndex
   - Lessons : body
3. **HTML** : Fermeture des balises custom (graph, youtube, variations, math-block)
4. **LaTeX** : Quotes correctes dans YAML
5. **IDs uniques** : Pas de doublons

```bash
npm run content:validate
# Affiche les erreurs par sévérité (critical, high, medium, low)
```

---

## Workflow de mise à jour du contenu

### En développement

```bash
# 1. Modifier les fichiers YAML dans content/
# 2. Valider
cd scripts/content-build && npm run validate

# 3. Builder
npm run build

# 4. Tester
cd ../.. && npm run dev
# → Vérifier sur http://localhost:3000/apprendre
```

### En production (Firebase CDN)

```bash
# Build + deploy + version bump
cd scripts/content-build
npm run deploy
```

### En production (Next.js direct)

```bash
# Le contenu est inclus dans le build Next.js
npm run build  # déclenche prebuild → content:build
npm run start
```

---

## Fichier à modifier pour passer à Next.js direct

### src/lib/services/content-service.ts

Ligne à changer :
```typescript
// Ligne 15 environ
const BASE_URL = 'https://learning-os-platform.web.app/content'
// Changer en :
const BASE_URL = process.env.NEXT_PUBLIC_CONTENT_URL || '/content'
```

### package.json (ajouter)

```json
{
  "scripts": {
    "prebuild": "npm run content:build",
    "content:build": "cd scripts/content-build && npm run build",
    "content:validate": "cd scripts/content-build && npm run validate"
  }
}
```

### .gitignore (ajouter)

```
public/content/
```

### .env.local (créer ou ajouter)

```
NEXT_PUBLIC_CONTENT_URL=/content
```
