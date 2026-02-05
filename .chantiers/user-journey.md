# Chantier: user-journey

Implémenter le parcours utilisateur avec sélection du niveau/section et interface orientée.

## Statut: Analyse

---

## Contexte et besoin

**Problème actuel:**
- L'interface n'est pas orientée selon le niveau de l'utilisateur
- La page `/apprendre` affiche une liste de modules → friction
- L'utilisateur doit naviguer pour trouver son contenu

**Objectif:**
- L'utilisateur définit son parcours (ex: "3ème Maths")
- L'interface entière s'adapte à ce choix
- Accès direct au contenu sans navigation superflue

---

## Analyse et recommandations

### 1. Modèle de données "Parcours"

```typescript
interface UserParcours {
  programmeId: string      // "3eme-math"
  currentModuleId?: string // Module en cours
  selectedAt: string       // Date de sélection
}
```

**Stockage:**
- Firestore: `users/{uid}/profile.parcours`
- Local: `localStorage` pour les anonymes
- Zustand store pour l'état applicatif

### 2. Flux d'onboarding

```
┌─────────────────────────────────────────────────────┐
│  Première visite / Pas de parcours                  │
│                                                     │
│  ┌─────────────────────────────────────────────┐    │
│  │  "Bienvenue ! Quel est votre niveau ?"      │    │
│  │                                             │    │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐     │    │
│  │  │ 2nde    │  │ 1ère    │  │ Term    │     │    │
│  │  └─────────┘  └─────────┘  └─────────┘     │    │
│  │                                             │    │
│  │  Section: [Math] [PC] [SVT]                │    │
│  │                                             │    │
│  │           [Commencer →]                     │    │
│  └─────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────┘
```

### 3. Interface "Apprendre" - Propositions

#### Option A: Module au centre (Recommandée ⭐)

```
┌─ Header ────────────────────────────────────────────┐
│  Learning    [Module: Continuité ▼]    🔔  👤       │
└─────────────────────────────────────────────────────┘
┌─ Sidebar ─┐ ┌─ Content ────────────────────────────┐
│           │ │                                      │
│ Dashboard │ │  ┌─ Module actuel ─────────────────┐ │
│ Apprendre │ │  │ Continuité                      │ │
│ Réviser   │ │  │ ████████░░░░ 65%                │ │
│ Profil    │ │  │ [Continuer →]                   │ │
│           │ │  └────────────────────────────────┘ │
│           │ │                                      │
│           │ │  ┌─ Timeline (comme actuel) ──────┐ │
│           │ │  │ Section 1: Définition          │ │
│           │ │  │ Section 2: Prolongement        │ │
│           │ │  └────────────────────────────────┘ │
└───────────┘ └──────────────────────────────────────┘
```

**Avantages:**
- Accès direct au module actuel
- Changement de module via dropdown dans le header
- Pas de page liste intermédiaire

#### Option B: Module dans sidebar dédié

```
┌─ Sidebar ─────────┐ ┌─ Content ─────────────────────┐
│                   │ │                               │
│ ┌─ Module ──────┐ │ │  Activité en cours            │
│ │ Continuité    │ │ │                               │
│ │ [Changer]     │ │ │                               │
│ │ ████░░ 40%    │ │ │                               │
│ └───────────────┘ │ │                               │
│                   │ │                               │
│ ┌─ Sections ────┐ │ │                               │
│ │ 1. Définition │ │ │                               │
│ │ 2. Prolong.   │ │ │                               │
│ └───────────────┘ │ │                               │
└───────────────────┘ └───────────────────────────────┘
```

**Avantages:**
- Tout dans la sidebar gauche
- Cohérent avec le timeline actuel

#### Option C: Dashboard-first

```
┌─ Page Apprendre ────────────────────────────────────┐
│                                                     │
│  Votre parcours: 3ème Maths                        │
│                                                     │
│  ┌─ Module en cours ─────────────────────────────┐ │
│  │ 📘 Continuité              [Continuer →]      │ │
│  │ Progression: 65% ████████░░                   │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  ┌─ Autres modules ──────────────────────────────┐ │
│  │ 📗 Suites (terminé)  📙 Dérivation (0%)       │ │
│  │ [Voir tous les modules]                       │ │
│  └───────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────┘
```

**Avantages:**
- Vue d'ensemble du parcours
- Module en cours mis en avant
- Accès rapide aux autres modules

### 4. Ma recommandation

**Approche hybride: Option A + C**

1. **Page `/apprendre`** = Dashboard parcours (Option C)
   - Module en cours prominent
   - Progression globale
   - Quick access aux autres modules

2. **Page `/apprendre/[moduleId]`** = Split view avec timeline (actuel)
   - Sélecteur de module dans le header (Option A)
   - Changement rapide sans retour au dashboard

3. **Header global** adapté au parcours
   - Affiche le niveau sélectionné
   - Dropdown pour changer de module rapidement

### 5. Éléments à filtrer selon le parcours

| Zone | Comportement |
|------|--------------|
| Header | Affiche niveau actuel |
| Dashboard | Stats du parcours uniquement |
| Apprendre | Modules du parcours |
| Réviser | Séries du parcours |
| Recherche | Filtré par parcours |

### 6. Modal de sélection de module

```
┌─────────────────────────────────────────────────────┐
│  Choisir un module                           [×]   │
├─────────────────────────────────────────────────────┤
│                                                     │
│  Votre parcours: 3ème Maths                        │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ ● Continuité           65% ████████░░         │ │
│  │ ○ Suites numériques    100% ██████████        │ │
│  │ ○ Dérivation           0%                     │ │
│  │ ○ Intégration          0%                     │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  [Voir tous les modules du programme]              │
└─────────────────────────────────────────────────────┘
```

---

## Questions à clarifier

1. **Changement de parcours**: L'utilisateur peut-il changer de parcours facilement ou c'est un choix "permanent" ?

2. **Multi-parcours**: Un utilisateur peut-il suivre plusieurs parcours (ex: 3ème Maths + 3ème PC) ?

3. **Module actuel**: Comment définir le "module en cours" ?
   - Dernier module visité ?
   - Premier module non terminé ?
   - Choix explicite de l'utilisateur ?

4. **Anonymes**: Les utilisateurs non connectés ont-ils accès au parcours (localStorage) ?

---

## Pipelines proposés

### Pipeline 1: Store et contexte parcours
- [ ] Créer `parcours-store.ts` (Zustand)
- [ ] Synchronisation Firestore/localStorage
- [ ] Hook `useParcours()`

### Pipeline 2: Onboarding parcours
- [ ] Page/Modal de sélection initiale
- [ ] Redirection si pas de parcours

### Pipeline 3: Header adaptatif
- [ ] Afficher niveau dans header
- [ ] Dropdown/modal changement de module

### Pipeline 4: Page Apprendre refonte
- [ ] Dashboard parcours
- [ ] Module en cours prominent
- [ ] Suppression liste modules

### Pipeline 5: Filtrage global
- [ ] Filtrer séries par parcours
- [ ] Filtrer stats par parcours

---

## Références UX

- **Duolingo**: Parcours linéaire, pas de choix de module
- **Khan Academy**: Sujet > Module > Leçon, mais navigation libre
- **Coursera**: Dashboard cours avec progression

