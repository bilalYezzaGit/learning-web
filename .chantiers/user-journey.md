# Chantier: user-journey

Implémenter le parcours utilisateur avec navigation par parcours dans l'URL.

## Statut: Terminé

---

## Architecture implémentée

### Principe fondamental

```
┌─────────────────────────────────────────────────────────────┐
│                     SOURCE DE VÉRITÉ                        │
├─────────────────────────────────────────────────────────────┤
│  Parcours actuel  →  L'URL (/3eme-math/...)                │
│  Parcours profil  →  Firestore user.parcours (si connecté) │
└─────────────────────────────────────────────────────────────┘
```

**Règle unique :** Si l'utilisateur est connecté ET que le parcours URL ≠ parcours profil → bannière d'alerte.

### Structure des URLs

```
Routes globales (hors parcours) :
/                     → Landing page (présentation + sélecteur parcours)
/login                → Connexion
/signup               → Inscription (inclut sélection parcours)
/profil               → Profil utilisateur
/select-parcours      → Sélection parcours (users existants)

Routes parcours-spécifiques :
/[parcours]                                    → Dashboard
/[parcours]/apprendre                          → Page Apprendre
/[parcours]/apprendre/[moduleId]               → Module (timeline)
/[parcours]/apprendre/[moduleId]/[activityId]  → Activité
/[parcours]/reviser                            → Page Réviser
/[parcours]/reviser/serie/[id]                 → Série (timeline)
/[parcours]/reviser/serie/[id]/[activityId]   → Activité série
/[parcours]/reviser/serie/[id]/play           → Mode lecture série
/[parcours]/reviser/serie/[id]/result         → Résultat série
```

### Parcours disponibles

| Slug | Label |
|------|-------|
| `3eme-math` | 3ème Maths |
| `2nde-math` | 2nde Maths |
| `1ere-math` | 1ère Maths |
| `term-math` | Terminale Maths |

---

## Implémentation

### Fichiers créés

**Configuration parcours:**
- `src/lib/parcours/config.ts` - Liste des parcours disponibles
- `src/lib/parcours/use-user-parcours.ts` - Hook pour gérer le parcours utilisateur
- `src/lib/parcours/index.ts` - Barrel export

**Middleware:**
- `src/middleware.ts` - Validation des slugs parcours

**Routes globales:**
- `src/app/(landing)/layout.tsx` - Layout landing
- `src/app/(landing)/page.tsx` - Landing page avec sélecteur
- `src/app/(global)/layout.tsx` - Layout global (profil, etc.)
- `src/app/(global)/profil/page.tsx` - Page profil avec settings parcours
- `src/app/select-parcours/page.tsx` - Sélection parcours

**Routes parcours:**
- `src/app/(parcours)/[parcours]/layout.tsx` - Layout avec sidebar + bannière
- `src/app/(parcours)/[parcours]/page.tsx` - Dashboard
- `src/app/(parcours)/[parcours]/apprendre/` - Pages apprendre
- `src/app/(parcours)/[parcours]/reviser/` - Pages réviser

**Composants:**
- `src/components/parcours-banner.tsx` - Bannière hors-parcours (shadcn Alert)

### Fichiers modifiés

- `src/components/app-sidebar.tsx` - Ajout prop parcours, badge parcours
- `src/components/site-header.tsx` - Ajout prop parcours
- `src/components/nav-user.tsx` - Affichage parcours dans dropdown
- `src/components/signup-form.tsx` - Étape sélection parcours

### Fichiers à supprimer

- `src/app/(main)/` - Ancienne structure (remplacée par (parcours))

---

## Principes shadcn respectés

| Élément | Composant shadcn |
|---------|------------------|
| Bannière hors-parcours | `Alert` + `AlertDescription` |
| Badge parcours | `Badge` (variant="secondary") |
| Menu utilisateur | `DropdownMenu` (existant) |
| Cards parcours | `Card` (existant) |
| Sidebar | `Sidebar` avec `variant="inset"` (existant) |

**Aucun composant custom créé** - Tout utilise les primitives shadcn existantes.

---

## Flux utilisateur

### Inscription
1. Credentials (email/password)
2. Sélection parcours
3. Redirection vers `/${parcours}`

### Connexion utilisateur existant
- Si parcours défini → Peut naviguer dans n'importe quel parcours
- Si parcours non défini → Redirection vers `/select-parcours`

### Navigation hors-parcours
- Bannière d'alerte affichée
- Lien "Aller à mon parcours"

---

## Modèle de données

### User (Firestore)

```typescript
interface UserProfile {
  parcours?: {
    slug: string        // "3eme-math"
    selectedAt: string  // ISO date
  }
  createdAt: string
  updatedAt?: string
}
```

### Parcours (statique)

```typescript
interface ParcoursConfig {
  slug: string          // "3eme-math"
  label: string         // "3ème Maths"
  level: string         // "3eme"
  section: string       // "math"
  description?: string
  order: number
  available: boolean
}
```
