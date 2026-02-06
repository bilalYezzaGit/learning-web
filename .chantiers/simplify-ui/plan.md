# Chantier: Simplify & Standardize

> **Objectif:** Simplifier le code au maximum et utiliser des technos/libs officielles (shadcn blocks, composants standard) partout où c'est possible.
> **Méthode:** Pour chaque partie, on **audite en profondeur** d'abord, on **discute les findings**, puis on **agit**.

---

## ~~PARTIE 1 — Dépendances & Configuration~~ DONE

- [x] Supprimé 7 deps inutilisées : `@dnd-kit/*` (4), `@tanstack/react-table`, `@tabler/icons-react`, `zod`
- [x] Migré 6 fichiers de `@tabler/icons-react` → `lucide-react`
- [x] Activé `@tailwindcss/typography` dans globals.css (bug: classes `prose` étaient cassées)
- [x] Retiré `"tempo"` du tsconfig.json exclude (dossier n'existait pas)

---

## ~~PARTIE 2 — Firebase & Auth~~ DONE

- [x] Supprimé `firebaseConfig` getter object (config.ts) — remplacé par `getFirebaseConfig()` direct
- [x] Supprimé exports `auth/db/functions` pré-initialisés (client.ts) — risque SSR, jamais importés
- [x] Supprimé `authService` convenience object (auth-service.ts) — jamais utilisé
- [x] Fusionné les 2 `useAuth` : ajouté `signIn`/`signUp` au Context, supprimé `hooks/use-auth.ts`
- [x] Mis à jour 4 fichiers (login-form, signup-form, profile-sheet, nav-user) vers `@/lib/context`

---

## PARTIE 3 — Pages Auth (login, signup, select-parcours)

### 3.1 Auditer les pages auth
- [ ] Relire `login-form.tsx`, `signup-form.tsx`, `select-parcours/page.tsx`.
- [ ] Comparer avec les blocks shadcn officiels (login-01, signup-01, etc.) — identifier ce qui peut être remplacé.
- [ ] Détecter le code mort, la logique incomplète, les validations manuelles remplaçables.

### 3.2 Appliquer la standardisation
- [ ] Remplacer par des blocks shadcn là où c'est pertinent.
- [ ] Nettoyer le code mort et simplifier les validations.

---

## PARTIE 4 — Landing page

### 4.1 Auditer la landing
- [ ] Relire `(landing)/page.tsx` et `landing-header.tsx`.
- [ ] Comparer chaque section (hero, features, CTA, footer) avec les blocks shadcn disponibles.
- [ ] Identifier les sections custom qui pourraient devenir standard.

### 4.2 Appliquer la standardisation
- [ ] Remplacer les sections par des blocks shadcn quand un match existe.
- [ ] Garder les sections spécifiques au domaine (parcours carousel, etc.).

---

## PARTIE 5 — Sidebar & Navigation

### 5.1 Auditer la navigation
- [ ] Relire `app-sidebar.tsx`, `site-header.tsx`, et tous les `nav-*.tsx` (main, secondary, documents, apprendre, user).
- [ ] Identifier les composants nav non-fonctionnels (boutons morts, actions placeholder).
- [ ] Comparer avec les blocks shadcn sidebar (sidebar-01 à sidebar-15) — trouver le meilleur match.

### 5.2 Appliquer le nettoyage
- [ ] Supprimer les nav components inutilisés ou vides.
- [ ] Simplifier la sidebar en s'alignant sur un block shadcn.

---

## PARTIE 6 — Dashboard parcours

### 6.1 Auditer le dashboard
- [ ] Relire `[parcours]/page.tsx` (page d'accueil après login).
- [ ] Identifier les données hardcodées, les cards qui pourraient utiliser des patterns shadcn standard.
- [ ] Vérifier si des blocks shadcn dashboard existent (stats, cards, etc.).

### 6.2 Appliquer les améliorations
- [ ] Standardiser les cards, connecter les vraies données si possible.

---

## PARTIE 7 — Apprendre (modules & activités)

### 7.1 Auditer le flow "apprendre"
- [ ] Relire toutes les pages sous `[parcours]/apprendre/` : page.tsx, [moduleId]/page.tsx, [moduleId]/layout.tsx, [activityId]/page.tsx, activity-client.tsx, course-timeline-wrapper.tsx.
- [ ] Identifier les patterns dupliqués (welcome screens, collapsible sections, activity type handling).
- [ ] Identifier les fichiers trop longs ou trop complexes à décomposer.
- [ ] Vérifier si des blocks shadcn correspondent (cards, collapsibles, etc.).

### 7.2 Appliquer le refactoring
- [ ] Extraire les composants réutilisables.
- [ ] Simplifier la logique client.
- [ ] Standardiser les patterns sur shadcn.

---

## PARTIE 8 — Reviser (séries & QCM)

### 8.1 Auditer le flow "reviser"
- [ ] Relire toutes les pages sous `[parcours]/reviser/` : page.tsx, reviser-client.tsx, serie/[id]/page.tsx, serie/[id]/layout.tsx, [activityId]/page.tsx, play/page.tsx, result/page.tsx, serie-timeline-wrapper.tsx.
- [ ] Identifier la duplication avec le flow "apprendre" (activity rendering, navigation, progression).
- [ ] Repérer les Client Components qui devraient être Server + wrapper.
- [ ] Mesurer la complexité des fichiers (lignes, responsabilités).

### 8.2 Appliquer le refactoring
- [ ] Factoriser la logique commune entre apprendre et reviser.
- [ ] Convertir en Server Components là où possible.
- [ ] Simplifier les fichiers longs.

---

## PARTIE 9 — Course Timeline

### 9.1 Auditer course-timeline.tsx
- [ ] Relire `course-timeline.tsx` (550+ lignes) en détail.
- [ ] Identifier les helpers extractibles, les sous-composants séparables, la logique mobile complexe.
- [ ] Vérifier si des composants shadcn (Accordion, Collapsible, ScrollArea) sont sous-utilisés.

### 9.2 Appliquer la décomposition
- [ ] Extraire helpers vers utils.
- [ ] Séparer les sous-composants.
- [ ] Maximiser l'usage de shadcn.

---

## PARTIE 10 — Profile Sheet

### 10.1 Auditer profile-sheet.tsx
- [ ] Relire `profile-sheet.tsx` (550+ lignes) en détail.
- [ ] Identifier les 3 tabs et leur complexité respective.
- [ ] Vérifier si le calcul des stats peut être extrait.
- [ ] Comparer avec les blocks shadcn (sheet, tabs, settings patterns).

### 10.2 Appliquer la décomposition
- [ ] Séparer chaque tab dans son fichier.
- [ ] Extraire la logique dans des hooks.

---

## PARTIE 11 — QCM System

### 11.1 Auditer le système QCM
- [ ] Relire `patterns/qcm-player.tsx` (400+ lignes) et les 4 sous-composants `qcm/*.tsx`.
- [ ] Identifier la logique extractible (validation, score, keyboard).
- [ ] Vérifier la cohérence entre qcm-player et les sous-composants.

### 11.2 Appliquer la simplification
- [ ] Extraire la logique dans des utils/hooks.
- [ ] Simplifier le player.

---

## PARTIE 12 — Hooks & State Management

### 12.1 Auditer les hooks
- [ ] Relire tous les hooks dans `lib/hooks/` et `src/hooks/`.
- [ ] Identifier les doublons (use-mobile vs use-media-query), les hooks inutilisés, les hooks trop complexes.
- [ ] Vérifier la cohérence des patterns (certains utilisent React Query, d'autres non).

### 12.2 Auditer les stores Zustand
- [ ] Relire `stores/preferences-store.ts` et `stores/ui-store.ts`.
- [ ] Vérifier si tous les states sont réellement utilisés.

### 12.3 Appliquer le nettoyage
- [ ] Fusionner/supprimer les doublons.
- [ ] Simplifier les hooks complexes.

---

## PARTIE 13 — Types & Services

### 13.1 Auditer les types
- [ ] Relire tous les fichiers dans `types/`.
- [ ] Identifier les types dupliqués, les interfaces trop larges, les fichiers obsolètes.

### 13.2 Auditer les services
- [ ] Relire `services/content-service.ts`, `services/progress-service.ts`, `services/scan-service.ts`.
- [ ] Identifier la sur-complexité (converters Firestore, subscriptions manuelles).

### 13.3 Appliquer la simplification
- [ ] Consolider les types, simplifier les services.

---

## PARTIE 14 — Content System & Gallery

### 14.1 Auditer le système de contenu
- [ ] Relire `content/renderer.tsx`, `content/utils.ts`, `content/index.ts` et les 4 extensions (math, graph, variations, youtube).
- [ ] Identifier la complexité et les opportunités de simplification.

### 14.2 Auditer la gallery
- [ ] Relire `gallery/page.tsx` (~500 lignes).
- [ ] Décider : supprimer, garder en dev-only, ou simplifier.

### 14.3 Appliquer les changements
- [ ] Simplifier le content system si possible.
- [ ] Traiter la gallery selon la décision.

---

## Progression

| Phase | Parties | Description | Statut |
|-------|---------|-------------|--------|
| **Phase 1** | P1, P2 | Fondations : deps, config, Firebase, auth | DONE |
| **Phase 2** | P3, P4 | Pages publiques : auth pages, landing | **EN COURS** |
| **Phase 3** | P5, P6 | Navigation : sidebar, header, dashboard | - |
| **Phase 4** | P7, P8 | Core features : apprendre, reviser | - |
| **Phase 5** | P9, P10, P11 | Components lourds : timeline, profile, QCM | - |
| **Phase 6** | P12, P13, P14 | Lib & finition : hooks, types, services, content | - |

**Chaque partie suit le cycle : Audit -> Discussion -> Action.**
