# Rapport d'Audit Exhaustif - Learning OS

**Date** : 6 Fevrier 2026
**Auditeur** : Claude (Opus 4.6)
**Scope** : Application complete, page par page, code par code

---

## Table des Matieres

1. [BUGS CRITIQUES](#1-bugs-critiques)
2. [BUGS MAJEURS](#2-bugs-majeurs)
3. [BUGS MINEURS](#3-bugs-mineurs)
4. [AUDIT UI - Expert Design](#4-audit-ui---expert-design)
5. [AUDIT UX - Expert Experience Utilisateur](#5-audit-ux---expert-experience-utilisateur)
6. [AUDIT EDTECH - Expert Pedagogie](#6-audit-edtech---expert-pedagogie)
7. [AUDIT TECHNIQUE - Expert Next.js/React](#7-audit-technique---expert-nextjsreact)
8. [RESUME PAR PAGE](#8-resume-par-page)
9. [PLAN D'ACTION PRIORITISE](#9-plan-daction-prioritise)

---

## 1. BUGS CRITIQUES

### BUG-C1 : Score QCM affiche 6667% (double multiplication)

**Severite** : CRITIQUE - Visible par tous les utilisateurs
**Pages affectees** : `/profil` (onglet Stats), `/{parcours}/reviser` (stats)

**Cause racine** : `progress-service.ts:258-271`

```
// completeQCM() stocke:
const percentage = total > 0 ? Math.round((score / total) * 100) : 0  // Ex: 100
const progress = {
  score: percentage,  // = 100 (deja un pourcentage!)
  total,              // = 2 (nombre brut de questions)
}
```

Ensuite dans `reviser-client.tsx:41-48` ET `profil/page.tsx:146-155` :

```
totalScore += p.score       // += 100 (pourcentage)
totalPossible += p.total    // += 2 (nombre brut)
// ...
avgScore = Math.round((totalScore / totalPossible) * 100)
// = Math.round((100 / 2) * 100) = 5000% !!
```

**Fix** : Soit stocker le score brut (pas le pourcentage) dans `completeQCM`, soit adapter la formule d'averaging pour ne pas re-multiplier par 100.

---

### BUG-C2 : Le contenu n'est PAS filtre par parcours

**Severite** : CRITIQUE - Brise le modele parcours
**Pages affectees** : `/{parcours}/apprendre`, `/{parcours}/reviser`

**Cause** : `content-service.ts` appelle `fetchProgrammes()` et `fetchSeriesCatalog()` sans aucun filtre parcours. Le `parcours` param est present dans l'URL mais n'est jamais utilise pour filtrer le contenu.

```typescript
// apprendre/page.tsx:26-28
const response = await fetchProgrammes()  // Pas de filtre !
programmes = response.programmes          // TOUS les programmes
```

**Resultat** : Un eleve en `term-math` voit les modules de 3eme, 1ere, etc.

**Fix** : Filtrer `programmes` par le `parcours` param, ou ajouter un champ `parcours`/`level` dans les donnees JSON et filtrer cote client/serveur.

---

### BUG-C3 : Contenu de test visible en production

**Severite** : CRITIQUE - Impact credibilite
**Pages affectees** : `/{parcours}/apprendre`, `/{parcours}/reviser`

**Exemples observes** :
- "[TEST] Exercice auto-deploy" dans la liste des series
- "Demo - Contenu futur" dans les modules
- Modules vides sans activites

**Fix** : Ajouter un champ `draft: boolean` ou `published: boolean` dans les JSON de contenu, et filtrer cote serveur.

---

## 2. BUGS MAJEURS

### BUG-M1 : Accents manquants dans tout le contenu pedagogique

**Severite** : MAJEUR - Impact pedagogie et credibilite
**Pages affectees** : Toutes les pages de contenu

**Exemples** :
- "Continuite" au lieu de "Continuite" (devrait etre "Continuité")
- "Theoreme" au lieu de "Theoreme" (devrait etre "Théorème")
- "Derivation" au lieu de "Derivation" (devrait etre "Dérivation")
- "Limites et asymptotes" sans accent sur les titres

**Cause** : Les fichiers JSON de contenu sur Firebase Hosting (`learning-os-platform.web.app/content/`) semblent avoir ete generes sans accents francais.

**Fix** : Corriger les fichiers JSON source sur Firebase Hosting. C'est un probleme de donnees, pas de code.

---

### BUG-M2 : Parcours affiche "Non defini" dans le profil

**Severite** : MAJEUR - Confusion utilisateur
**Page affectee** : `/profil` (onglet Profil)

**Cause** : `profil/page.tsx:269-275` - Le `useUserParcours()` hook lit depuis Firestore `users/{uid}.parcours.slug`. Si le document utilisateur n'a pas ce champ (ex: comptes crees avant l'implementation parcours, ou connexion anonyme), il affiche "Non defini".

```tsx
{parcoursConfig ? (
  <Badge variant="secondary">{parcoursConfig.label}</Badge>
) : (
  <span className="text-muted-foreground">Non defini</span>  // <-- Toujours affiche
)}
```

**Fix** : Detecter le parcours depuis l'URL si le champ Firestore est vide, ou forcer la selection de parcours au premier login.

---

### BUG-M3 : Dashboard affiche des stats hardcodees a 0

**Severite** : MAJEUR - Dashboard inutile
**Page affectee** : `/{parcours}` (dashboard)

**Cause** : `[parcours]/page.tsx` est un Server Component qui ne lit pas les donnees de progression. Toutes les stats sont en dur :
- "0 jours" serie en cours (ligne 35)
- "0 / 15 min" objectif du jour (ligne 45)
- "0" activites (ligne 90)
- "--" score QCM (ligne 104)
- "0 / 5" series (ligne 118)
- "3 series" badge hardcode (ligne 133)

**Fix** : Convertir en client component ou ajouter un client wrapper qui lit `useProgress()` et `useAuth()`.

---

### BUG-M4 : Progress bar toujours a 0% sur la page Apprendre

**Severite** : MAJEUR - Pas de feedback de progression
**Page affectee** : `/{parcours}/apprendre`

**Cause** : `apprendre/page.tsx:92-94` - La progress value est hardcodee a `0` :

```tsx
<span className="text-muted-foreground">0%</span>
<Progress value={0} className="h-1.5" />
```

C'est un Server Component sans acces aux donnees de progression (Firestore client-side).

**Fix** : Ajouter un client component wrapper qui lit `useProgress()` pour chaque module.

---

### BUG-M5 : Redirection `/select-parcours` manquante dans le flow

**Severite** : MAJEUR - Nouveau utilisateur perdu
**Page affectee** : Flow post-login

**Cause** : Apres le login (`login-form.tsx:42`), la redirection est vers `/select-parcours`. Mais si l'utilisateur a deja un parcours, il devrait etre redirige vers `/{parcours}`. Il n'y a pas de logique de redirect conditionnel apres login.

Le `select-parcours/page.tsx:32-36` redirige vers `/login` si pas authentifie, mais ne redirige pas vers le parcours si deja selectionne.

---

### BUG-M6 : Command Menu routes cassees

**Severite** : MAJEUR - Feature inutilisable
**Fichier** : `components/patterns/command-menu.tsx:30-51`

**Cause** : Les routes dans le Command Menu (Cmd+K) sont hardcodees sans prefixe parcours :
```typescript
{ label: 'Dashboard', href: '/' }
{ label: 'Apprendre', href: '/apprendre' }
```

Elles devraient etre `/{parcours}/apprendre`, etc. L'utilisateur qui utilise Cmd+K est redirige vers `/` a cause du middleware.

---

## 3. BUGS MINEURS

### BUG-m1 : Pas de mode "system" pour le theme

**Page** : `/profil` (onglet Parametres)
**Detail** : Seuls "Clair" et "Sombre" sont disponibles. Le mode "System" (suivre les preferences OS) n'est pas propose malgre l'utilisation de `next-themes`.

---

### BUG-m2 : Google OAuth desactive sans date

**Pages** : `/login`, `/signup`
**Detail** : Le bouton Google affiche "Google (bientot)" mais est desactive (`disabled`). Pas de date ni d'indication de quand il sera disponible.

---

### BUG-m3 : "Mot de passe oublie" non implemente

**Page** : `/login`
**Detail** : Le lien "Mot de passe oublie ?" est present mais le `state` "forgot" n'est jamais utilise dans le composant (`login-form.tsx:27`).

---

### BUG-m4 : Liens `/terms` et `/privacy` morts (404)

**Pages** : `/login`, `/signup`
**Detail** : Les liens vers les conditions d'utilisation et la politique de confidentialite pointent vers des pages qui n'existent pas.

---

### BUG-m5 : Le hook `useEffect` dans QCMPlayer a des deps manquantes

**Fichier** : `patterns/qcm-player.tsx:77-103`
**Detail** : Le `useEffect` pour les keyboard shortcuts reference `handleValidate` et `handleNext` mais ne les inclut pas dans le tableau de dependances. Peut causer des closures stales.

---

### BUG-m6 : `window.innerWidth` check dans CourseTimeline

**Fichier** : `components/course-timeline.tsx:568`
**Detail** : `window.innerWidth < 1024` est utilise pour fermer le sidebar sur mobile. Devrait utiliser le hook `useMediaQuery` pour etre reactif.

---

### BUG-m7 : Nav-documents actions non implementees

**Fichier** : `components/nav-documents.tsx:66-77`
**Detail** : Les actions "Open", "Share", "Delete" du dropdown menu n'ont pas de handler.

---

### BUG-m8 : Sections count affiche 0 quand pas de sections

**Page** : `/{parcours}/apprendre/[moduleId]`
**Detail** : `module.sections?.length || 0` affiche "0 sections" si le module utilise une structure plate sans sections.

---

## 4. AUDIT UI - Expert Design

### 4.1 Landing Page (`/`)

| Element | Etat | Detail |
|---------|------|--------|
| Header/Nav | OK | Propre, bien espace, shadcn Buttons |
| Hero section | OK | Badge, titre, sous-titre, CTAs |
| Features cards | OK | 3 cartes avec icones, bonne utilisation de Card |
| Parcours cards | OK | Grid 2 colonnes, Card avec bouton Decouvrir |
| CTA section | OK | Simple et efficace |
| Footer | OK | Minimaliste |
| **Mobile** | ATTENTION | Pas teste en mobile durant cet audit |

**Recommandations UI** :
- Ajouter un logo/icone a cote de "Learning OS" dans le header
- La section Hero manque de visuel (illustration ou image)
- Les cards Features pourraient avoir des couleurs d'accent differentes par card
- Le footer est trop minimaliste (ajouter liens utiles)

---

### 4.2 Auth Pages (`/login`, `/signup`)

| Element | Etat | Detail |
|---------|------|--------|
| Layout 2 colonnes | OK | Pattern shadcn login-01 respecte |
| Formulaire | OK | Champs bien espaces, Field composant propre |
| Panel colore | OK | Fond `bg-primary` avec texte centre |
| Responsive | OK | Panel cache sur mobile |
| Error display | OK | Fond `bg-destructive/10` |

**Recommandations UI** :
- Le panel droit est trop simple (juste "Learning" + sous-titre). Ajouter une illustration ou des temoignages
- Le step 2 du signup (selection parcours) perd le layout 2 colonnes (inconsistance)
- Ajouter des indicateurs de step (1/2) dans le flow signup

---

### 4.3 Dashboard (`/{parcours}`)

| Element | Etat | Detail |
|---------|------|--------|
| Streak card | PROBLEME | Toujours "0 jours", pas fonctionnel |
| Continue CTA | OK | Bonne mise en avant avec `bg-primary/5` |
| Stats grid | PROBLEME | Stats hardcodees a 0 |
| Quick actions | OK | Hover effect, badges |
| Sidebar | OK | Navigation claire, icones coherentes |

**Recommandations UI** :
- Le dashboard ressemble a un placeholder plutot qu'a une vraie page
- Ajouter un etat vide plus engageant ("Commencez votre premiere lecon !")
- Les stats a "0" et "--" sont deprimants pour un nouvel utilisateur
- Manque un composant "derniere activite" ou "reprendre ou j'en etais"

---

### 4.4 Apprendre (`/{parcours}/apprendre`)

| Element | Etat | Detail |
|---------|------|--------|
| Module cards | OK | Grid responsive, hover effect |
| Progress bars | PROBLEME | Toujours a 0%, pas fonctionnel |
| Programme headers | OK | Font serif, bonne hierarchie |
| Empty state | OK | Icone + message |

**Recommandations UI** :
- Les cartes modules manquent de visuels (icone par module, couleur)
- Pas d'indication de la duree estimee par module dans la liste
- Le compteur "X sections" n'est pas tres informatif pour un eleve

---

### 4.5 Module Detail (`/{parcours}/apprendre/[moduleId]`)

| Element | Etat | Detail |
|---------|------|--------|
| Welcome card | OK | Centre, icone, titre, objectifs |
| Badges meta | OK | Sections, activites, temps |
| Start button | OK | Bonne taille, bien visible |
| Timeline sidebar | OK | Accordeon avec sections, progression |

**Recommandations UI** :
- Le bouton "Retour aux modules" est trop discret
- La welcome card est trop petite sur grand ecran (`max-w-md`)

---

### 4.6 Activity Content (`/{parcours}/apprendre/[moduleId]/[activityId]`)

| Element | Etat | Detail |
|---------|------|--------|
| Header titre | OK | Truncate, badge type |
| Contenu HTML | OK | Prose styling, max-w-3xl |
| KaTeX formules | OK | Render correct |
| Navigation footer | OK | Precedent / Suivant |
| QCM Player | OK | Options claires, feedback visuel |
| Hints/Solutions | OK | `<details>` collapsible, couleurs appropriees |

**Recommandations UI** :
- Le header mobile manque de breadcrumb
- Le footer de navigation pourrait afficher le titre de l'activite suivante
- Les kbd shortcuts sont caches sur mobile (bien), mais pas de tooltip explicatif

---

### 4.7 Reviser (`/{parcours}/reviser`)

| Element | Etat | Detail |
|---------|------|--------|
| Stats cards | PROBLEME | Score QCM affiche 6667% (bug C1) |
| Series list | OK | Progress bars, badges difficulte |
| Badges couleur | OK | Vert/ambre/rouge par difficulte |
| Estimated time | OK | Affiche en minutes |

---

### 4.8 Profil (`/profil`)

| Element | Etat | Detail |
|---------|------|--------|
| Avatar cercle | OK | Initiales, fond primary |
| Tabs | OK | Stats, Profil, Parametres |
| Stats grid | PROBLEME | Score QCM 6667% (bug C1) |
| Parcours | PROBLEME | Affiche "Non defini" (bug M2) |
| Theme toggle | OK | Clair/Sombre, mais manque System |
| Parcours change | OK | Boutons grilles |

---

## 5. AUDIT UX - Expert Experience Utilisateur

### 5.1 Flow Nouvel Utilisateur (Onboarding)

```
/ (landing) --> /signup --> step 1 (credentials) --> step 2 (parcours) --> /{parcours}
```

**Problemes** :
1. **Pas de flow visiteur** : Un utilisateur ne peut pas essayer la plateforme sans creer un compte. Le CTA principal est "Commencer gratuitement" qui amene directement a /signup
2. **Pas de preview** : Les cartes parcours sur la landing n'amenent pas a une preview du contenu
3. **Step indicator manquant** : Le signup en 2 etapes n'a pas d'indicateur de progression
4. **Pas de confirmation email** : Le compte est cree instantanement sans verification
5. **Pas de tutorial/guide** : Apres l'inscription, l'eleve arrive sur le dashboard sans explication

### 5.2 Flow Utilisateur Existant (Login)

```
/ (landing) --> /login --> /select-parcours (si pas de parcours) --> /{parcours}
```

**Problemes** :
1. **Redirect cassee** : Apres login, redirect toujours vers `/select-parcours` meme si parcours deja selectionne
2. **Pas de "Remember me"** : Pas d'option pour rester connecte
3. **Mot de passe oublie non fonctionnel** : Le lien existe mais ne fait rien

### 5.3 Flow Apprentissage

```
/{parcours}/apprendre --> module card --> module welcome --> activity --> activity --> ...
```

**Problemes** :
1. **Pas de "reprendre la ou j'en etais"** : Le dashboard a un bouton "Continuer" qui amene a `/apprendre`, pas a la derniere activite
2. **Pas de progression visible** : Les progress bars sont a 0% (bug M4)
3. **Navigation lineaire uniquement** : Pas de possibilite de sauter des activites
4. **Pas de reward/encouragement** : Aucun systeme de gamification (XP, badges, streaks fonctionnels)
5. **Timeline sidebar se ferme sur mobile apres clic** : Comportement correct mais pas de facon de revenir facilement

### 5.4 Flow Revision

```
/{parcours}/reviser --> serie card --> serie detail --> play --> result
```

**Problemes** :
1. **Pas de filtre/tri** : Les series ne peuvent pas etre filtrees par difficulte ou theme
2. **Score bugge** : Le score QCM affiche des valeurs absurdes (bug C1)
3. **Pas de recommandation** : Aucun systeme de "series recommandees" basees sur les faiblesses

### 5.5 Accessibilite

| Critere | Etat | Detail |
|---------|------|--------|
| Contraste | OK | Gere par shadcn/ui + themes |
| Navigation clavier | PARTIEL | QCM Player OK, mais Cards cliquables sans `role="button"` |
| Screen readers | FAIBLE | Manque `aria-label` sur beaucoup d'icones |
| Focus visible | OK | Gere par Tailwind/shadcn |
| Error announcements | FAIBLE | Erreurs pas annoncees (`role="alert"` manquant) |

**Fichiers concernes** :
- `activity-card.tsx` : Card cliquable sans semantique bouton
- `module-card.tsx` : idem
- `login-form.tsx` : Erreurs sans `role="alert"`
- `signup-form.tsx` : idem
- `qcm-player.tsx` : Options sans `aria-selected`

---

## 6. AUDIT EDTECH - Expert Pedagogie

### 6.1 Structure Pedagogique

| Critere | Etat | Score |
|---------|------|-------|
| Hierarchie des contenus | OK | Programme > Module > Section > Activite |
| Types d'activites | OK | Cours, Exercices, QCM |
| Progression | FAIBLE | Pas de prerequis, pas d'arbre de competences |
| Differenciation | ABSENTE | Pas d'adaptation au niveau de l'eleve |
| Feedback | PARTIEL | QCM avec correction immediate, exercices sans correction auto |

### 6.2 Problemes Pedagogiques

1. **Contenu non filtre par niveau** (Bug C2) : Un eleve de Terminale voit du contenu de 3eme. C'est un probleme pedagogique majeur car cela :
   - Cree de la confusion
   - Dilue le parcours
   - Donne l'impression que la plateforme n'est pas serieuse

2. **Accents manquants** (Bug M1) : En mathematiques, la precision typographique est importante. Des mots comme "theoreme", "derivee", "integrale" sans accents :
   - Manquent de credibilite academique
   - Peuvent gerer de la confusion chez les jeunes lecteurs
   - Donnent une impression de contenu genere automatiquement

3. **Pas de parcours adaptatif** : La progression est lineaire. Un eleve qui maitrise un sujet doit quand meme parcourir tout le contenu dans l'ordre.

4. **Score QCM non significatif** : Le score affiche est absurde (6667%), ce qui :
   - Detruit la confiance de l'eleve dans la plateforme
   - Rend impossible l'auto-evaluation
   - Brise la boucle de feedback pedagogique

5. **Pas de revision espacee (Spaced Repetition)** : Aucun systeme de rappel pour revenir sur les concepts mal maitrises. Les QCM peuvent etre refaits mais il n'y a pas de suggestion automatique.

6. **Exercices sans verification automatique** : Les exercices ont une solution cachable (`<details>`) mais pas de correction automatique. L'eleve doit s'auto-evaluer, ce qui est peu fiable.

7. **Pas d'objectifs clairs par session** : Le "15 min/jour" est hardcode et non fonctionnel. Pas de micro-objectifs.

### 6.3 Recommandations Pedagogiques

| Priorite | Recommandation |
|----------|---------------|
| P0 | Filtrer le contenu par parcours |
| P0 | Corriger le score QCM |
| P0 | Corriger les accents dans le contenu |
| P1 | Ajouter un systeme de prerequis entre modules |
| P1 | Implementer un "reprendre la ou j'en etais" fonctionnel |
| P2 | Ajouter la revision espacee |
| P2 | Ajouter des micro-objectifs par session |
| P3 | Implementer un parcours adaptatif |

---

## 7. AUDIT TECHNIQUE - Expert Next.js/React

### 7.1 Architecture

| Critere | Etat | Detail |
|---------|------|--------|
| App Router | OK | Utilisation correcte des route groups |
| Server/Client split | BON | Server par defaut, client quand necessaire |
| Middleware | OK | Validation des parcours slugs |
| Error handling | PARTIEL | `notFound()` pour 404, mais pas d'error boundary |
| Loading states | BON | Fichiers `loading.tsx` avec Skeletons |
| Caching | OK | `next: { revalidate: 3600 }` sur les fetches |

### 7.2 Problemes Techniques

#### T1 : Middleware parcours duplique

**Fichiers** : `middleware.ts:8` vs `parcours/config.ts:62-64`

La liste des parcours valides est definie a deux endroits avec un commentaire "keep in sync" :
```typescript
// middleware.ts
const VALID_PARCOURS = ['3eme-math', '2nde-math', '1ere-math', 'term-math']

// parcours/config.ts
export const VALID_PARCOURS_SLUGS = PARCOURS_LIST.filter(...)
```

Le middleware ne peut pas importer depuis `@/lib` car il tourne dans un runtime Edge. Mais la duplication est un risque de desynchronisation.

#### T2 : Layout Parcours est un Client Component

**Fichier** : `(parcours)/[parcours]/layout.tsx`

Le layout utilise `'use client'` et `useParams()`. Cela force tout le layout (sidebar, header, banner) a etre rendu cote client, alors qu'une grande partie pourrait etre server-rendered. Impact sur le TTI (Time to Interactive).

**Alternative** : Utiliser les `params` passes en prop au layout (Server Component) et passer `parcours` en prop au AppSidebar.

#### T3 : Pas d'Error Boundaries

Aucun `error.tsx` dans les routes. Si une erreur se produit (ex: fetch echoue, Firestore indisponible), l'application crash sans message utilisateur.

#### T4 : `any` implicite dans les conversions Firestore

**Fichier** : `progress-service.ts:52-77`

Les conversions `progressFromFirestore` utilisent des `as` casts repetitifs sans validation :
```typescript
status: data.status as ProgressStatus,  // Pas de validation
score: data.score as number | undefined,
```

Si les donnees Firestore sont corrompues, ca crash silencieusement.

#### T5 : React Query pas utilise pour le contenu serveur

Les pages `apprendre/page.tsx` et `reviser/page.tsx` font des fetches directs dans les Server Components, ce qui est correct. Mais les hooks `useModule()` et `useProgrammes()` (React Query) existent aussi cote client et ne sont pas utilises de maniere coherente.

#### T6 : Pas de validation de types runtime

**Fichier** : `content-service.ts:75-76`

```typescript
const data = await response.json()
return data as ProgrammesResponse  // Trust cast, pas de validation
```

Si l'API retourne un schema inattendu, l'app crash sans message utile. Recommandation : utiliser Zod pour valider les reponses.

#### T7 : Console.error sans reporting

Plusieurs `console.error` dans le code (`progress-service.ts:159`, `select-parcours/page.tsx:28`) mais aucun error reporting service (Sentry, etc.).

#### T8 : PWA non testee

`next-pwa` est configure mais :
- Pas de `service-worker.js` visible
- Pas de strategie de cache offline
- Pas de "install" prompt

### 7.3 Performance

| Critere | Etat | Detail |
|---------|------|--------|
| Server Components | BON | Contenu pedagogique rendu cote serveur |
| Bundle size | NON MESURE | KaTeX + Recharts potentiellement lourds |
| Image optimization | PARTIEL | `next/image` utilise mais peu d'images |
| Cache HTTP | OK | `revalidate: 3600` sur les fetches contenu |
| Firestore listeners | ATTENTION | Listener real-time pour chaque page, meme si pas necessaire |

### 7.4 Securite

| Critere | Etat | Detail |
|---------|------|--------|
| Auth state | OK | Firebase Auth |
| Firestore rules | NON AUDITE | Pas de fichier `firestore.rules` visible dans le repo |
| XSS via contenu HTML | RISQUE | `ContentRenderer` parse du HTML depuis Firebase Hosting avec `html-react-parser`. Si le contenu est compromis, XSS possible |
| CORS | OK | Firebase Hosting gere le CORS |
| Env vars | OK | Toutes en `NEXT_PUBLIC_` (cote client, normal pour Firebase) |

---

## 8. RESUME PAR PAGE

### `/` (Landing)

| Categorie | Issues |
|-----------|--------|
| Bugs | Aucun |
| UI | Manque logo, illustration hero, footer trop simple |
| UX | Pas de preview contenu, pas de flow visiteur |
| Pedagogie | N/A |
| Technique | OK |

### `/login`

| Categorie | Issues |
|-----------|--------|
| Bugs | "Mot de passe oublie" non implemente, liens /terms et /privacy 404 |
| UI | Panel droit trop simple |
| UX | Pas de "Remember me", redirect cassee post-login |
| Pedagogie | N/A |
| Technique | Error sans `role="alert"` |

### `/signup`

| Categorie | Issues |
|-----------|--------|
| Bugs | Liens /terms et /privacy 404, nested Field invalide |
| UI | Step 2 perd le layout 2 colonnes, pas d'indicateur de step |
| UX | Pas de confirmation email, pas de validation email avancee |
| Pedagogie | La selection de parcours est bonne mais manque de detail par niveau |
| Technique | Nested `<Field>` HTML invalide (ligne 181-202) |

### `/select-parcours`

| Categorie | Issues |
|-----------|--------|
| Bugs | Ne redirige pas si parcours deja selectionne |
| UI | OK, bien centre |
| UX | Devrait etre combine avec le flow login |
| Pedagogie | Description des parcours trop generique |
| Technique | `router.push('/login')` dans le render (devrait utiliser `redirect()` ou `useEffect`) |

### `/{parcours}` (Dashboard)

| Categorie | Issues |
|-----------|--------|
| Bugs | Stats hardcodees a 0 (M3), streak non fonctionnel |
| UI | Ressemble a un placeholder |
| UX | Pas de "reprendre la ou j'en etais" |
| Pedagogie | Objectif 15min/jour non fonctionnel, pas de micro-objectifs |
| Technique | Server Component sans acces aux donnees de progression |

### `/{parcours}/apprendre`

| Categorie | Issues |
|-----------|--------|
| Bugs | Progress a 0% (M4), contenu non filtre (C2) |
| UI | Cartes sans visuels, manque duree estimee |
| UX | Pas de filtre/recherche dans les modules |
| Pedagogie | Tous les niveaux melanges, accents manquants (M1) |
| Technique | Server Component, OK structurellement |

### `/{parcours}/apprendre/[moduleId]`

| Categorie | Issues |
|-----------|--------|
| Bugs | "0 sections" si structure plate (m8) |
| UI | Welcome card trop petite, bouton retour discret |
| UX | OK |
| Pedagogie | Objectifs bien presentes |
| Technique | OK |

### `/{parcours}/apprendre/[moduleId]/[activityId]`

| Categorie | Issues |
|-----------|--------|
| Bugs | useEffect deps manquantes dans QCMPlayer (m5) |
| UI | OK, bon usage de prose styling |
| UX | Navigation Precedent/Suivant OK, KaTeX OK |
| Pedagogie | Exercices sans correction auto, hints OK |
| Technique | Bon split Server/Client avec ActivityClient wrapper |

### `/{parcours}/reviser`

| Categorie | Issues |
|-----------|--------|
| Bugs | Score 6667% (C1), contenu test visible (C3), non filtre (C2) |
| UI | Bonne liste avec badges, progress bars |
| UX | Pas de filtre par difficulte |
| Pedagogie | Pas de recommandation basee sur les faiblesses |
| Technique | Server Component + Client components pour progress OK |

### `/profil`

| Categorie | Issues |
|-----------|--------|
| Bugs | Score 6667% (C1), parcours "Non defini" (M2) |
| UI | Onglets bien structures |
| UX | Pas de mode "System" pour le theme (m1) |
| Pedagogie | Stats non fiables |
| Technique | Bon usage de Suspense boundary |

---

## 9. PLAN D'ACTION PRIORITISE

### P0 - Blockers (a faire en premier)

| # | Action | Fichier(s) | Effort |
|---|--------|-----------|--------|
| 1 | **Fix score QCM (C1)** | `progress-service.ts`, `reviser-client.tsx`, `profil/page.tsx` | 30 min |
| 2 | **Filtrer contenu par parcours (C2)** | `apprendre/page.tsx`, `content-service.ts`, JSON data | 2-4h |
| 3 | **Masquer contenu test (C3)** | `content-service.ts` ou JSON data | 1h |
| 4 | **Fix accents contenu (M1)** | Firebase Hosting JSON files | 2-4h (data) |

### P1 - Majeur (sprint suivant)

| # | Action | Fichier(s) | Effort |
|---|--------|-----------|--------|
| 5 | Dashboard avec vraies stats (M3) | `[parcours]/page.tsx` | 3-4h |
| 6 | Progress bars fonctionnelles (M4) | `apprendre/page.tsx` | 2h |
| 7 | Fix parcours "Non defini" (M2) | `profil/page.tsx`, `use-user-parcours.ts` | 1h |
| 8 | Redirect post-login intelligent (M5) | `login-form.tsx`, auth flow | 2h |
| 9 | Command Menu avec parcours (M6) | `command-menu.tsx` | 1h |

### P2 - Ameliorations UX

| # | Action | Effort |
|---|--------|--------|
| 10 | "Reprendre la ou j'en etais" sur le dashboard | 3h |
| 11 | Ajouter error boundaries (`error.tsx`) | 2h |
| 12 | Implementer "Mot de passe oublie" | 2h |
| 13 | Ajouter pages /terms et /privacy | 1h |
| 14 | Step indicator dans le signup | 1h |
| 15 | Mode theme "System" | 30min |
| 16 | Logo/branding dans le header | 1h |

### P3 - Ameliorations Pedagogiques

| # | Action | Effort |
|---|--------|--------|
| 17 | Systeme de prerequis entre modules | 1-2 jours |
| 18 | Revision espacee (spaced repetition) | 2-3 jours |
| 19 | Parcours adaptatif | 1 semaine+ |
| 20 | Gamification (XP, badges, streaks) | 3-5 jours |

### P4 - Tech Debt

| # | Action | Effort |
|---|--------|--------|
| 21 | Validation Zod pour les responses API | 3h |
| 22 | Error reporting (Sentry) | 2h |
| 23 | Convertir parcours layout en Server Component | 2h |
| 24 | Centraliser les routes et labels | 2h |
| 25 | Tester et configurer PWA | 3h |
| 26 | Audit Firestore security rules | 2h |
| 27 | Audit accessibilite ARIA | 3h |

---

## Annexe : Correspondance Code <-> Bug

| Bug | Fichier | Ligne(s) |
|-----|---------|----------|
| C1 (Score) | `src/lib/services/progress-service.ts` | 258, 271 |
| C1 (Score) | `src/app/(parcours)/[parcours]/reviser/reviser-client.tsx` | 41-48 |
| C1 (Score) | `src/app/(global)/profil/page.tsx` | 146-155 |
| C2 (Filtre) | `src/app/(parcours)/[parcours]/apprendre/page.tsx` | 26-28 |
| C2 (Filtre) | `src/lib/services/content-service.ts` | 61-77 |
| C3 (Test) | Donnees JSON sur Firebase Hosting | - |
| M1 (Accents) | Donnees JSON sur Firebase Hosting | - |
| M2 (Parcours) | `src/app/(global)/profil/page.tsx` | 269-275 |
| M3 (Dashboard) | `src/app/(parcours)/[parcours]/page.tsx` | 35, 45, 90, 104, 118, 133 |
| M4 (Progress) | `src/app/(parcours)/[parcours]/apprendre/page.tsx` | 92-94 |
| M5 (Redirect) | `src/components/login-form.tsx` | 42 |
| M6 (CmdMenu) | `src/components/patterns/command-menu.tsx` | 30-51 |
| m1 (Theme) | `src/app/(global)/profil/page.tsx` | 332-348 |
| m2 (Google) | `src/components/login-form.tsx` | 113-124 |
| m3 (MDP) | `src/components/login-form.tsx` | 27 |
| m4 (Links) | `src/components/login-form.tsx` + `signup-form.tsx` | liens /terms, /privacy |
| m5 (Deps) | `src/components/patterns/qcm-player.tsx` | 77-103 |
| m6 (Width) | `src/components/course-timeline.tsx` | 568 |
| m7 (NavDocs) | `src/components/nav-documents.tsx` | 66-77 |
| m8 (Sections) | `src/app/(parcours)/[parcours]/apprendre/[moduleId]/page.tsx` | 81 |
