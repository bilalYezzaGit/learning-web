# Chantier: simplify-ui

Simplifier le frontend en utilisant les blocks shadcn et standardiser l'UI.

## Statut: En cours

---

## Architecture UI cible

### Layout global (validé)
```
┌─ SidebarProvider (shadcn) ─────────────────────────┐
│ ┌─ AppSidebar ─┐ ┌─ SidebarInset (shadcn) ───────┐ │
│ │  sidebar-07  │ │ SiteHeader (dashboard-01)     │ │
│ │  collapse    │ │ ┌─ @container/main ─────────┐ │ │
│ │  to icons    │ │ │ flex flex-1 flex-col gap-2│ │ │
│ │              │ │ │ ┌─ Content area ────────┐ │ │ │
│ │              │ │ │ │ px-4 lg:px-6 (padding)│ │ │ │
│ │              │ │ │ │ FULL WIDTH            │ │ │ │
│ │              │ │ │ └──────────────────────┘ │ │ │
│ └──────────────┘ └──────────────────────────────┘ │
└────────────────────────────────────────────────────┘
```

| Couche | Source | Pattern |
|--------|--------|---------|
| Shell | shadcn | `SidebarProvider` + `SidebarInset` |
| Sidebar | shadcn | `sidebar-07` (collapse to icons) |
| Header | shadcn | `SiteHeader` (from dashboard-01) |
| Content wrapper | **dashboard-01** | `@container/main flex flex-1 flex-col gap-2` |
| Page padding | **dashboard-01** | `px-4 lg:px-6` (PAS de `container max-w-*`) |

### Composants shadcn utilisés
- Card, Progress, Badge, Button, Tabs
- Sidebar, SidebarInset, SidebarProvider
- Input, Label, Field (auth forms)

---

## Pipelines complétés

### Pipeline 1: Dashboard shadcn standard ✅
- [x] Installer dashboard-01 block
- [x] CSS shadcn standard (`@import "shadcn/tailwind.css"`)
- [x] Layout "inset" avec bloc visible
- [x] Supprimer `layout/` et `sections/` custom
- [x] AppSidebar avec `variant="inset"`

### Pipeline 2: Auth shadcn ✅
- [x] login-04 avec Firebase auth
- [x] signup-04 avec validation
- [x] Texte français
- [x] Bouton Google (désactivé, placeholder)
- [x] Hook useAuth étendu (signIn/signUp)

---

## Pipelines à faire

### Pipeline 3: Fix Layout + Accueil Learner ⬅️ PRIORITÉ

#### 3.1 Fix Layout (URGENT)
**Problème**: Les pages utilisent `container max-w-6xl` = contenu étroit et centré, moche.

**Solution**: Adopter le pattern dashboard-01 partout.

**Layout actuel (BAD)**:
```tsx
// (main)/layout.tsx
<div className="flex flex-1 flex-col gap-4 p-4">
  {children}
</div>

// pages
<div className="container max-w-6xl py-6">
  {/* contenu */}
</div>
```

**Layout cible (GOOD)**:
```tsx
// (main)/layout.tsx
<div className="flex flex-1 flex-col">
  <div className="@container/main flex flex-1 flex-col gap-2">
    <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
      {children}
    </div>
  </div>
</div>

// pages
<div className="px-4 lg:px-6">
  {/* contenu full width */}
</div>
```

**Fichiers à modifier**:
- [ ] `src/app/(main)/layout.tsx` - wrapper dashboard-01
- [ ] `src/app/(main)/page.tsx` - retirer container
- [ ] `src/app/(main)/profil/page.tsx` - retirer container
- [ ] `src/app/(main)/apprendre/page.tsx` - retirer container
- [ ] `src/app/(main)/reviser/page.tsx` - retirer container
- [ ] `src/app/(main)/scan/page.tsx` - retirer container
- [ ] Sous-pages apprendre et reviser

#### 3.2 Accueil Learner
**Objectif**: Remplacer le dashboard analytics par un accueil orienté apprentissage

**Design cible**:
```
┌─────────────────────────────────────────────────┐
│ Card: Streak + Daily Goal                       │ ← Progress component
│ 🔥 5 jours | Aujourd'hui: ████░░ 10/15 min     │
├─────────────────────────────────────────────────┤
│ Card: Continue Learning (CTA principal)         │ ← Card + Button
│ ▶ Reprendre: Algèbre - Chapitre 3              │
├─────────────────────────────────────────────────┤
│ Cards grid: Quick Stats                         │ ← 3x Card component
│ [Activités: 12] [QCM: 85%] [Série: 3/5]        │
├─────────────────────────────────────────────────┤
│ Card: Révisions suggérées                       │ ← Card + Badge
│ • Équations (à revoir) • Fonctions (nouveau)   │
└─────────────────────────────────────────────────┘
```

**Tâches**:
- [ ] Supprimer `/dashboard` (page analytics)
- [ ] Supprimer composants inutilisés: `section-cards.tsx`, `chart-area-interactive.tsx`, `data-table.tsx`
- [ ] Refaire `/(main)/page.tsx` avec pattern learner
- [ ] Composants: Card, Progress, Badge (déjà installés)

### Pipeline 4: Page Profil avec Tabs
**Objectif**: Refaire `/profil` avec layout onglets propre

**Design cible**:
```
┌─────────────────────────────────────────────────┐
│ [Profil] [Stats] [Paramètres]     ← Tabs        │
├─────────────────────────────────────────────────┤
│ Tab Profil:                                     │
│   Avatar + Email + Déconnexion                  │
├─────────────────────────────────────────────────┤
│ Tab Stats:                                      │
│   Cards stats (réutiliser pattern dashboard-01) │
│   [Activités] [Score QCM] [Taux réussite]      │
├─────────────────────────────────────────────────┤
│ Tab Paramètres:                                 │
│   Thème, notifications, etc.                    │
└─────────────────────────────────────────────────┘
```

**Tâches**:
- [ ] Ajouter composant Tabs si pas installé
- [ ] Refaire `/profil` avec 3 onglets
- [ ] Supprimer `StatCard` custom
- [ ] Réutiliser pattern stats de dashboard-01

### Pipeline 5: Calendrier streak (optionnel)
**Objectif**: Visualisation des jours d'étude

**Block shadcn**: `calendar-31` (with event slots)

**Tâches**:
- [ ] Installer calendar-31
- [ ] Intégrer dans profil ou accueil
- [ ] Afficher streak visuel

---

## Fichiers à supprimer (cleanup)

| Fichier | Raison |
|---------|--------|
| `src/app/dashboard/` | Remplacé par accueil learner |
| `src/app/dashboard/data.json` | Données demo inutiles |
| `src/components/section-cards.tsx` | Analytics, pas learner |
| `src/components/chart-area-interactive.tsx` | Analytics |
| `src/components/data-table.tsx` | Analytics |

---

## Ordre d'exécution

1. **P3.1** - Fix layout (toutes les pages) ⬅️ MAINTENANT
2. **P3.2** - Accueil learner + cleanup dashboard
3. **P4** - Profil avec Tabs
4. **P5** - Calendrier (optionnel)

---

## Commits liés
```
7943506 feat(auth): add shadcn login-04 and signup-04 with Firebase auth
e9fff74 refactor(ui): clean layout structure with shadcn inset variant
6454e13 feat(ui): integrate shadcn dashboard-01 block and standardize CSS
```
