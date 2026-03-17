# MVP Vision — Aylan v1

> Document vivant de pilotage. Compare la vision cible avec l'etat de l'application.
> Mis a jour au fil des discussions pour maintenir l'alignement.

**Derniere mise a jour** : 2026-03-17

---

## 1. Vision globale

L'application Aylan est une **extension numerique de livrets mathematiques imprimes**.
Les livrets PDF sont le produit principal. L'app fait 2 choses :

1. **Consulter le contenu** — Scanner un QR ou naviguer → voir enonce, solution, QCM, cours
2. **Correction IA** — Prendre en photo son travail → feedback personnalise (auth requise)

Le contenu est **ouvert et statique**. Pas de compte obligatoire pour consulter.
Pas de tracking de progression en V1.

---

## 2. Principes V1

| Principe | Description |
|----------|-------------|
| **Paper-first** | Le livret imprime est le support principal, l'app l'augmente |
| **Contenu ouvert** | Tout le contenu statique est accessible sans compte |
| **Auth minimale** | Seule la correction IA necessite un login |
| **Zero friction** | Scanner un QR → voir le contenu en 1 seconde |
| **Mobile-first** | UX optimisee pour smartphone (scan QR sur le terrain) |
| **Pas de code superflu** | Si une feature est coupee, son code est supprime |

---

## 3. Fonctionnalites — Vision vs. Etat

### 3.1 Navigation & UX globale

#### 3.1.1 Page principale — Liste des livrets

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Contenu** | Liste de tous les livrets, c'est LA page principale | Grille avec titre, description, badges | OUI |
| **Favoris** | Etoile sur chaque livret, stocke en localStorage, affiches en premier | Non implemente | NON |
| **Navigation** | Pas de bottom nav — la liste EST la navigation | Bottom nav 3 onglets (Livrets, Scan, Progres) | NON |

**Taches d'alignement :**
- [ ] Supprimer la bottom nav (`bottom-nav.tsx`)
- [ ] Supprimer la page `/app/progres` et sa route
- [ ] Supprimer la page `/app/scan` (le scan se fait via FAB)
- [ ] Ajouter un systeme de favoris localStorage sur la liste des livrets
- [ ] Ajuster `app-main.tsx` (plus de padding bottom pour la nav)

#### 3.1.2 FAB Scan

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Position** | Floating action button en bas a droite, toujours visible | Onglet central dans la bottom nav | NON |
| **Comportement** | Clic → active la camera immediatement (pas de page intermediaire) | Navigue vers `/app/scan` (page avec choix camera/manuel) | NON |

**Taches d'alignement :**
- [ ] Creer un composant FAB scan flottant (bottom-right, z-40)
- [ ] Au clic → ouvre un sheet/modal avec QrScanner (camera directe)
- [ ] Sur scan reussi → redirect vers le contenu (exercice ou hub livret)
- [ ] Integrer dans le layout app (visible sur toutes les pages app)

#### 3.1.3 Hub du livret

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Acces** | Direct via URL ou QR | Direct via `/app/mes-livrets/[code]` | OUI |
| **Actions rapides** | Resume + QCM | 2 cards (Resume, QCM rapide) | OUI |
| **Sommaire** | Table des matieres avec tous les atomes cliquables | Sections + activites avec liens | OUI |

**Statut : ALIGNE**

#### 3.1.4 Page exercice

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Enonce** | Affiche clairement | HTML compile avec KaTeX | OUI |
| **Solution** | Bouton "Voir la solution" | Bloc depliable `<details>` | OUI |
| **Scan IA** | Gate auth : badge "Compte requis" + CTA login | Card avec gate visuel | OUI |
| **Scope** | Scan IA uniquement pour exercices | `isExercise` check | OUI |

**Statut : ALIGNE**

#### 3.1.5 Page QCM

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Mode consultation** | Question + reponse correcte + explication | Detecte `qcm-*`, affiche avec reponse verte | OUI |
| **Mode session** | Quiz chronometre interactif | QcmSessionPlayer via "QCM rapide" | OUI |

**Statut : ALIGNE**

#### 3.1.6 Page resume

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Contenu** | Resume du cours, theoremes, definitions | HTML compile avec KaTeX | OUI |

**Statut : ALIGNE**

---

### 3.2 Scan IA (AUTH REQUISE)

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Declencheur** | Depuis la page exercice | `ExerciseScanCard` avec capture photo | OUI |
| **Auth** | Login requis | `/api/scan` verifie Bearer token | OUI |
| **Modele** | Claude Vision | Claude Sonnet 4.5 avec tool_use | OUI |
| **UX non-connecte** | Badge "Compte requis" + CTA login | Card avec gate visuel | OUI |

**Statut : ALIGNE**

---

### 3.3 Progression — SUPPRIMEE en V1

| | Vision V1 | App actuelle | Aligne ? |
|-|-----------|-------------|----------|
| **Concept** | SUPPRIME — pas de tracking en V1 | `useProgress`, `local-progress.ts`, page `/app/progres`, stats dans profile sheet | NON |

**Taches d'alignement :**
- [ ] Supprimer `useProgress` hook
- [ ] Supprimer `useModuleProgress` hook
- [ ] Supprimer `local-progress.ts` service
- [ ] Supprimer types progress (`ActivityProgress`, `ProgressStatus`, `ProgressContext`)
- [ ] Supprimer la constante `SUCCESS_THRESHOLD`
- [ ] Supprimer les appels `completeQCM` / `completeExercise` dans le QCM player
- [ ] Simplifier le profile sheet (supprimer tab Stats)
- [ ] Nettoyer Firestore rules (collection `activityProgress`)

---

### 3.4 Authentification

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Login/Signup** | Fonctionnel | Firebase Auth (email/password) | OUI |
| **Reset password** | Fonctionnel | Firebase sendPasswordResetEmail | OUI |
| **Utilite unique en V1** | Correction IA | `/api/scan` avec Bearer token | OUI |
| **Profile sheet** | Juste infos compte (email) | 2 tabs (Stats + Profil) | NON |

**Taches d'alignement :**
- [ ] Simplifier profile sheet (supprimer tab Stats, garder uniquement Profil)

---

### 3.5 Landing page

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Message** | "Augmente ton livret de maths avec l'IA" | Meme message | OUI |
| **Features** | Consulter + Corriger (2 piliers, pas 3) | 3 cards dont "Suis ta progression" | NON |
| **CTA** | Explorer les livrets | "Explorer les livrets" (mis a jour) | OUI |

**Taches d'alignement :**
- [ ] Retirer la feature card "Suis ta progression"
- [ ] Ajuster a 2 features : consultation + correction IA

---

### 3.6 Features supprimees

| Feature | Statut | Date |
|---------|--------|------|
| Pairing de livrets | Code supprime | 2026-03-17 |
| Progression / tracking | A supprimer | - |
| Simulations interactives | Reporte V2 | 2026-03-17 |
| Parcours personnalises | Reporte V2 | 2026-03-17 |

---

## 4. Architecture technique

### Stack V1

| Couche | Technologie | Role |
|--------|-------------|------|
| Frontend | Next.js (App Router) + Tailwind + shadcn | Rendu statique + client |
| Auth | Firebase Auth (client SDK) | Login/signup/reset |
| API | Next.js API Routes | Correction IA (POST /api/scan) |
| Token verification | Firebase Admin SDK | `verifyIdToken()` dans /api/scan |
| IA | Anthropic API (Claude Vision) | Analyse des copies manuscrites |
| Contenu | Pipeline custom (MDX → HTML/JSON/PDF) | Generation des livrets |
| Math | KaTeX | Rendu des formules |

### Services supprimes

| Service | Raison |
|---------|--------|
| Firestore | Plus aucune donnee a stocker cote serveur en V1 |
| Firebase Cloud Functions | Non utilise |
| `firebase/firestore` (client SDK) | Import supprime, reduit le bundle |

### Variables d'environnement (Vercel)

```
ANTHROPIC_API_KEY          → Cle API Anthropic (sk-ant-...)
FIREBASE_PROJECT_ID        → learning-os-platform
FIREBASE_CLIENT_EMAIL      → firebase-adminsdk-...@...iam.gserviceaccount.com
FIREBASE_PRIVATE_KEY       → -----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n
```

> Firebase Auth client config est hardcodee dans `src/lib/firebase/config.ts` (valeurs publiques, pas des secrets).
> Les `NEXT_PUBLIC_FIREBASE_*` dans `.env.local` ne sont PAS utilises et peuvent etre retires.

---

## 5. Pipeline & contenu

| Aspect | Etat | Notes |
|--------|------|-------|
| Pipeline 6 etapes | Fonctionnel | read → validate → compile → resolve → write → generate-pdfs |
| Atomes MDX | 237 atomes | 6 modules dans 3eme-math |
| Molecules YAML | 21 livrets | Format `kind: livret` |
| Generation PDF | 17+ PDFs avec QR codes | Couverture + QR exercices |
| QR exercices | Fonctionnel | `/app/ex?b=...&e=...` |
| KB modules | 3 modules | fonction-derivee, nombre-derive, fonctions |

**Statut : SOLIDE** — Pas de changement necessaire.

---

## 6. Backlog d'alignement MVP

### Phase 1 — Supprimer le progress (FAIT)

Tous les fichiers progress supprimes : hooks, services, types, constants, page, Firestore rules, profile sheet simplifie.

### Phase 2 — Refonte navigation (FAIT)

Bottom nav supprimee, pages `/app/scan` et `/app/progres` supprimees, FAB scan flottant cree, favoris localStorage ajoutes, `app-main.tsx` simplifie.

### Phase 3 — Polish landing (FAIT)

Feature card "progression" supprimee. Landing ajustee a 2 features (consulter + corriger) en grille 2 colonnes.

### Reporte (V2)

| # | Tache |
|---|-------|
| 17 | Simulations interactives |
| 18 | Parcours personnalises (2nde-math, 1ere-tc) |
| 19 | Tracking progression (si valide plus tard) |

---

## 7. Architecture cible V1

```
ROUTES PUBLIQUES (sans compte)
  /                          Landing page
  /app/mes-livrets           Liste des livrets (page principale, favoris)
  /app/mes-livrets/[code]    Hub livret (resume, sommaire, QCM)
  /app/mes-livrets/[code]/resume       Resume du cours
  /app/mes-livrets/[code]/exercice/[id]  Exercice/Lecon/QCM consultation
  /app/mes-livrets/[code]/qcm          Session QCM interactive
  /app/ex?b=...&e=...        Redirect QR exercice
  /login, /signup, /reset-password
  /terms, /privacy

ROUTES AUTH (avec compte)
  POST /api/scan             Correction IA (Bearer token)

UX GLOBALE
  FAB scan flottant          Visible sur toutes les pages /app/*
  Pas de bottom nav          La liste des livrets EST la navigation
  Favoris                    localStorage, affiches en premier dans la liste
```

---

## Historique des decisions

| Date | Decision | Contexte |
|------|----------|----------|
| 2026-03-17 | Supprimer le pairing en V1 | Contenu ouvert, zero friction |
| 2026-03-17 | Reporter les simulations interactives a V2 | Necessite nouveau type d'atome + composants |
| 2026-03-17 | Pairing supprime entierement (code + UI + Firestore rules) | YAGNI — pas de code speculatif |
| 2026-03-17 | Scan page simplifie (QR → redirect) | Zero friction |
| 2026-03-17 | Gate auth sur scan IA | Badge "Compte requis" + CTA login |
| 2026-03-17 | Sommaire dans le hub livret | Table des matieres interactive |
| 2026-03-17 | Mode consultation QCM | Voir reponse + explication |
| 2026-03-17 | **Supprimer le progress en V1** | Focus sur les 2 piliers : contenu statique + correction IA |
| 2026-03-17 | **Supprimer la bottom nav** | 1 seule page utile, pas besoin de 3 onglets |
| 2026-03-17 | **FAB scan flottant** | Camera directe, pas de page intermediaire |
| 2026-03-17 | **Favoris localStorage** | Personnalisation sans auth |
| 2026-03-17 | **Landing a 2 features** | Consulter + corriger (plus de progression) |
| 2026-03-17 | **Firestore supprime** | Plus aucune donnee serveur en V1, Firebase Auth suffit |
| 2026-03-17 | **Parcours supprime** | Code mort, jamais importe dans l'app |
