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

## ~~PARTIE 3 — Pages Auth (login, signup, select-parcours)~~ DONE

- [x] Supprimé l'auth anonyme (code mort) : `signInAnonymouslyFn`, `isAnonymous` dans auth-service, services/index, auth-context, nav-user, profile-sheet
- [x] Login : supprimé le state `mode` mort (`'login' | 'forgot'`) et le bouton "Mot de passe oublié" (aucun rendu conditionnel n'existait)
- [x] Signup : fusionné le flow 2-steps en **1 seule page** — RadioGroup pour le choix parcours, un seul `handleSubmit` (création user + sauvegarde parcours Firestore)
- [x] Profile sheet : supprimé le ternaire "Anonyme/Complet", le Card "Passez à un compte complet", la prop `isAnonymous` de `ProfilTab`
- [x] select-parcours : gardé tel quel (utile pour redirect post-login)

---

## ~~PARTIE 4 — Landing page~~ DONE

- [x] Vérifié : les blocks shadcn officiels (hero-01, feature-01, footer-01) **n'existent pas** dans le registry — seuls login/signup/sidebar/dashboard existent
- [x] Amélioré la landing avec composants shadcn standard (Badge, Card, Button, Separator)
- [x] Hero : typo plus grande (text-4xl/6xl), padding accru (py-20/32)
- [x] Features : icônes dans des containers `bg-primary/10` arrondis
- [x] CTA : wrappé dans un Card `bg-primary` avec bouton `variant="secondary"`
- [x] Footer : layout 3 colonnes (brand, liens Conditions/Confidentialité, copyright)
- [x] Gardé : landing-header (auth-aware) et section parcours (spécifique au domaine)

---

## ~~PARTIE 5 — Sidebar & Navigation~~ DONE

- [x] Supprimé 3 composants nav morts : `nav-main.tsx` (Quick Create/Inbox, vestige template), `nav-secondary.tsx`, `nav-documents.tsx` (Open/Share/Delete factice)
- [x] Supprimé le bouton "Rechercher ⌘K" mort dans `app-sidebar.tsx` (prop `onSearchClick` jamais passée depuis le layout)
- [x] Gardé : `nav-apprendre.tsx` (charge les modules dynamiquement), `nav-user.tsx` (nettoyé en P3), `site-header.tsx`, `parcours-banner.tsx`
- [x] Sidebar finale : Header (logo + parcours badge) → Dashboard / Apprendre (collapsible modules) / Réviser → Footer (NavUser)

---

## ~~PARTIE 6 — Dashboard parcours~~ DONE

- [x] Supprimé le bloc Streak & Daily Goal (100% hardcodé, aucune logique backend)
- [x] Supprimé les 3 stats cards hardcodées ("0 activités", "-- score", "0/5 séries")
- [x] Supprimé les Badges hardcodés ("3 séries", "Nouveau")
- [x] Dashboard simplifié : CTA "Reprendre" + 2 Quick Actions (Apprendre / Réviser) avec icônes et descriptions
- [x] Reste Server Component — les vraies stats sont dans le ProfileSheet (client-side via `useProgress`)

---

## ~~PARTIE 7 — Apprendre (modules & activités)~~ DONE

- [x] Extrait `CollapsibleSection`, `ExerciseContent`, `getActivityTypeLabel` vers `components/patterns/activity-content.tsx` (source unique partagée)
- [x] Supprimé la barre de progression 0% hardcodée dans `apprendre/page.tsx` — remplacée par un simple label "N sections"
- [x] Supprimé `ProgressBadge` mort dans `activity-client.tsx` (exporté mais jamais importé)
- [x] Nettoyé imports inutilisés (`Badge`, `isSuccess`) dans `activity-client.tsx`
- [x] `apprendre/[activityId]/page.tsx` : 194 → 130 lignes (helpers extraits)

---

## ~~PARTIE 8 — Reviser (séries & QCM)~~ DONE

- [x] Remplacé les 3 helpers dupliqués dans `reviser/[activityId]/page.tsx` par imports de `activity-content.tsx` (398 → 310 lignes)
- [x] Remplacé les 3 helpers dupliqués dans `reviser/play/page.tsx` par imports de `activity-content.tsx` (383 → 296 lignes)
- [x] Simplifié `result/page.tsx` : supprimé les 3 stats cards menteur (`completedActivities = totalActivities`), gardé le header de succès + encouragement
- [x] ~140 lignes de code dupliqué éliminées au total entre les 3 fichiers
- [x] Note pour plus tard : `[activityId]` (route-based) et `/play` (index-based) sont 2 patterns de navigation différents — consolidation possible en Phase 5

---

## ~~PARTIE 9 — Course Timeline~~ DONE

- [x] Supprimé les props mortes `backHref`/`backLabel` (définies dans l'interface mais jamais utilisées ni passées)
- [x] Remplacé le sidebar mobile custom (overlay `div` + `aside` fixe + toggle button + close button, ~40 lignes) par shadcn `Sheet` (side="left") pour mobile + `aside` statique pour desktop
- [x] Meilleure a11y (Sheet gère focus trap, Escape, aria), moins de code custom
- [x] Supprimé import `PanelLeftClose` devenu inutile
- [x] Helpers et sous-composants (StepIndicator, ActivityItem, SectionAccordion, etc.) déjà bien structurés — gardés tels quels
- [x] 661 → ~630 lignes (gain net après remplacement mobile sidebar)

---

## ~~PARTIE 10 — Profile Sheet~~ DONE

- [x] Supprimé la prop morte `onClose` de `ProfilTab` (destructurée mais jamais utilisée)
- [x] Composant déjà propre après nettoyage P3 (auth anonyme supprimée) : 6 sous-composants bien découpés, ~75 lignes/composant
- [x] Utilise déjà shadcn correctement (Sheet, Tabs, Card, Badge, Avatar, ScrollArea, Button)
- [x] Pas de décomposition supplémentaire nécessaire — 452 lignes pour 6 composants c'est raisonnable

---

## ~~PARTIE 11 — QCM System~~ DONE

- [x] `qcm-player.tsx` (303 lignes) : déjà propre — state machine claire, keyboard shortcuts, composants shadcn (Card, Progress, Button)
- [x] 4 sous-composants `qcm/*.tsx` (qcm-option, qcm-question, qcm-review, qcm-result) : uniquement importés par `gallery/page.tsx` (dev-only), pas par l'app principale. Suppression reportée à P14 (décision gallery)
- [x] Pas de simplification nécessaire sur le player lui-même

---

## ~~PARTIE 12 — Hooks & State Management~~ DONE

- [x] Supprimé `ui-store.ts` (76 lignes) — 100% inutilisé (theme via next-themes, sidebar via React Context, toasts via Sonner)
- [x] Supprimé `preferences-store.ts` (109 lignes) — 100% inutilisé, jamais importé
- [x] Supprimé `use-module.ts` (27 lignes) — jamais utilisé, les Server Components fetchent directement
- [x] Supprimé `use-local-storage.ts` (78 lignes) — jamais utilisé
- [x] Nettoyé `use-media-query.ts` — supprimé 5 hooks de convenience morts (useIsTablet, useIsDesktop, usePrefersDarkMode, usePrefersReducedMotion, useIsMobile), gardé `useMediaQuery` seul
- [x] Gardé `src/hooks/use-mobile.ts` (shadcn default, utilisé par sidebar, breakpoint 768px)
- [x] Hooks actifs restants : `useProgrammes`, `useParcoursModules`, `useProgress` — tous bien utilisés
- [x] ~483 lignes de code mort supprimées (79% des hooks/stores)

---

## ~~PARTIE 13 — Types & Services~~ DONE

### Types nettoyés :
- [x] Supprimé `ModuleSummary` et `ProgrammeSummary` de models.ts (jamais importés)
- [x] Supprimé `ModuleStats` + 5 helpers morts de progress.ts (`emptyModuleStats`, `isProgressSuccess`, `needsReview`, `isModuleComplete`, `getRemainingCount`)
- [x] Supprimé `OnboardingState` + `ONBOARDING_TOTAL_STEPS` + 6 helpers morts de user.ts (`initialOnboardingState`, `hasFirstName`, `getDisplayName`, `canProceed`, `isOnboardingComplete`, `getOnboardingProgress`, `getStepLabel`)
- [x] Supprimé 4 helpers morts de series.ts (`findSeriesById`, `getSeriesExerciseCount`, `getSeriesQCMCount`, `getSeriesModuleIds`)
- [x] Supprimé `isProbleme` et `getQuestionCount` de activity.ts (jamais importés)
- [x] Nettoyé `types/index.ts` barrel — supprimé tous les re-exports morts

### Services nettoyés :
- [x] Supprimé 4 fonctions mortes de auth-service.ts (`getCurrentUser`, `resetPassword`, `isAuthenticated`, `getUserId`) + import `sendPasswordResetEmail`
- [x] Supprimé `contentService` object wrapper de content-service.ts (jamais importé)
- [x] Supprimé `getLastScanForActivity` + `scanService` object de scan-service.ts (jamais importés) + imports Firestore devenus inutiles
- [x] Nettoyé `services/index.ts` barrel

---

## ~~PARTIE 14 — Content System & Gallery~~ DONE

- [x] Supprimé `gallery/page.tsx` (450 lignes) — page dev-only, non liée depuis l'app, accessible uniquement par URL directe
- [x] Supprimé 4 composants QCM gallery-only : `qcm-option.tsx`, `qcm-question.tsx`, `qcm-review.tsx`, `qcm-result.tsx`
- [x] Supprimé 3 composants UI gallery-only : `search-bar.tsx`, `chip.tsx`, `icon.tsx`
- [x] Retiré `/gallery` de la whitelist middleware
- [x] Nettoyé `content/index.ts` — supprimé les exports de utilities et extensions inutilisés (seul `ContentRenderer` est importé)
- [x] Content system (renderer + 4 extensions) gardé tel quel — bien structuré, utilisé par 5 fichiers

---

## Progression

| Phase | Parties | Description | Statut |
|-------|---------|-------------|--------|
| **Phase 1** | P1, P2 | Fondations : deps, config, Firebase, auth | DONE |
| **Phase 2** | P3, P4 | Pages publiques : auth pages, landing | **DONE**      |
| **Phase 3** | P5, P6 | Navigation : sidebar, header, dashboard | **DONE**      |
| **Phase 4** | P7, P8 | Core features : apprendre, reviser | **DONE**      |
| **Phase 5** | P9, P10, P11 | Components lourds : timeline, profile, QCM | **DONE** |
| **Phase 6** | P12, P13, P14 | Lib & finition : hooks, types, services, content | **DONE** |

**Chaque partie suit le cycle : Audit -> Discussion -> Action.**
