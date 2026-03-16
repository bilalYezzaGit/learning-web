# MVP Vision — Aylan v1

> Document vivant de pilotage. Compare la vision cible avec l'etat de l'application.
> Mis a jour au fil des discussions pour maintenir l'alignement.

**Derniere mise a jour** : 2026-03-17

---

## 1. Vision globale

L'application Aylan est une **extension numerique de livrets mathematiques imprimes**.
Les livrets PDF sont le produit principal. L'app sert a :

1. **Consulter les corrections** — Scanner un QR d'exercice/QCM → voir enonce + solution
2. **Correction IA** — Scanner une copie manuscrite → feedback personnalise (auth requise)
3. **Suivre sa progression** — Dashboard de suivi (auth requise, V2)

Le contenu est **ouvert et statique** en V1. Pas de pairing, pas de compte obligatoire pour consulter.

---

## 2. Principes V1

| Principe | Description |
|----------|-------------|
| **Paper-first** | Le livret imprime est le support principal, l'app l'augmente |
| **Contenu ouvert** | Tout le contenu statique est accessible sans compte |
| **Auth minimale** | Seuls le scan IA et la progression necessitent un login |
| **Zero friction** | Scanner un QR → voir le contenu en 1 seconde, pas de pairing |
| **Mobile-first** | UX optimisee pour smartphone (scan QR sur le terrain) |

---

## 3. Fonctionnalites — Vision vs. Etat

### 3.1 Consultation du contenu (OUVERT)

#### 3.1.1 Liste des livrets

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Acces** | Ouvert, tous les livrets visibles | Ouvert, affiche tous les livrets via `getAllBooklets()` | OUI |
| **Navigation** | Grille de livrets avec metadata | Grille avec titre, description, badges (exos, QCM, code) | OUI |
| **CTA principal** | Pas de CTA de pairing | CTA pairing supprime | OUI |

**Statut : ALIGNE** (pairing supprime le 2026-03-17)

#### 3.1.2 Hub du livret

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Acces** | Direct via URL ou QR | Direct via `/app/mes-livrets/[code]` | OUI |
| **Actions rapides** | Resume + QCM | 2 cards (Resume, QCM rapide) — card Scanner supprimee | OUI |
| **Sommaire** | Table des matieres avec tous les atomes cliquables | Sections + activites (lecons, exercices, QCM) avec liens | OUI |

**Statut : ALIGNE** (sommaire ajoute le 2026-03-17)

#### 3.1.3 Page exercice (via QR)

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Acces** | QR → `/app/ex?b=...&e=...` → page exercice | Redirect fonctionne | OUI |
| **Enonce** | Affiche clairement | HTML compile avec KaTeX | OUI |
| **Solution** | Bouton "Voir la solution" visible | Bloc depliable `<details>` compile par pipeline | OUI |
| **Scan IA** | Gate auth : badge "Compte requis" + CTA login | Card avec gate visuel si non connecte | OUI |
| **Scope** | Scan IA uniquement pour exercices | `isExercise` check, pas de scan card pour lecons/QCM | OUI |

**Statut : ALIGNE** (gate auth + separation exercice/lecon ajoutees le 2026-03-17)

#### 3.1.4 Page QCM

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Mode consultation** | Scanner QR ou clic sommaire → voir question + reponse + explication | Page exercice detecte `qcm-*`, charge les JSON compiles, affiche avec reponse correcte (vert) + explication | OUI |
| **Mode session** | Quiz chronometre interactif | QcmSessionPlayer (10 min, 10 questions, scoring) via "QCM rapide" | OUI |
| **Quiz groups** | Affiche toutes les questions du groupe | Detecte `quizAtomIds` dans le livret, charge le groupe complet | OUI |

**Statut : ALIGNE** (consultation mode ajoute le 2026-03-17)

#### 3.1.5 Page resume

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Contenu** | Resume du cours, theoremes, definitions | HTML compile avec KaTeX, blocs structures | OUI |
| **Acces** | Depuis le hub du livret | Card "Resume du cours" si resume existe | OUI |

**Statut : ALIGNE** — Rien a faire.

---

### 3.2 Scan IA (AUTH REQUISE)

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Declencheur** | Scanner sa copie depuis la page exercice | `ExerciseScanCard` avec capture photo | OUI |
| **Auth** | Login requis | `/api/scan` verifie Bearer token | OUI |
| **Modele** | Claude Vision | Claude Sonnet 4.5 avec tool_use | OUI |
| **Rate limit** | Protection contre abus | 10 req/min par IP (in-memory) | OUI |
| **Feedback** | Correct/incorrect, confiance, suggestions | isCorrect, confidence, feedback, suggestions[] | OUI |
| **UX non-connecte** | Message clair + CTA login | Card avec badge "Compte requis" + bouton login | OUI |

**Statut : ALIGNE** (gate auth ajoute le 2026-03-17)

---

### 3.3 Progression (AUTH REQUISE — V2)

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Stockage** | Firestore par utilisateur | `users/{uid}/activityProgress/{activityId}` | OUI |
| **Dashboard** | Stats + progression par module | Page `/app/progres` avec stats et barres | OUI |
| **Sans compte** | localStorage (pas de migration) | `local-progress.ts` ecrit en localStorage | OUI |
| **Priorite V1** | Secondaire — message "Creez un compte" | Page affiche CTA login si non connecte | OUI |

**Statut : ALIGNE** pour V1 (fonctionnel mais secondaire).

---

### 3.4 Pairing de livrets

| | Vision V1 | App actuelle | Aligne ? |
|-|-----------|-------------|----------|
| **Concept** | SUPPRIME — contenu ouvert | Code supprime entierement | OUI |

**Statut : ALIGNE** (supprime le 2026-03-17)
- `booklet-service.ts` supprime
- `UserBooklet` type supprime
- `/api/booklet/validate` route supprimee
- `use-booklet-progress.ts` hook supprime
- `/app/scan` transforme en simple scanner → redirect contenu
- Firestore rules nettoyees (collection `booklets` retiree)

---

### 3.5 Simulations interactives (V2)

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Concept** | QR sur theoreme → simulation/graphique interactif dans l'app | Non existant | REPORTE V2 |

**Scope V2 :**
- Nouveau type d'atome `interactive` ou `simulation`
- Composants React interactifs (canvas, sliders, animations)
- Nouveau type de QR "theoreme" dans le pipeline PDF
- Route dediee `/app/interactive/[id]`

---

### 3.6 Authentification

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Login/Signup** | Fonctionnel | Firebase Auth (email/password) | OUI |
| **Reset password** | Fonctionnel | Firebase sendPasswordResetEmail | OUI |
| **Pages auth** | Design shadcn | Cards avec pattern login-01 | OUI |
| **Guard middleware** | Routes publiques vs protegees | Whitelist de routes, redirect vers `/` | PARTIEL |

**Taches d'alignement :**
- [ ] Nettoyer le middleware : supprimer `/viewer` de la whitelist (n'existe pas)
- [ ] Ajouter un guard cote client pour les features auth (scan IA, progres) — pas de redirect middleware, juste des CTA login dans l'UI

---

### 3.7 Landing page

| | Vision | App actuelle | Aligne ? |
|-|--------|-------------|----------|
| **Message** | "Augmente ton livret de maths avec l'IA" | Meme message | OUI |
| **Features mises en avant** | Scan QR, correction IA, consultation | Scan livret, Correction IA, Progression | PARTIEL |
| **CTA principal** | Explorer les livrets (ouvert) | "Scanne ton livret" → `/app/mes-livrets` | PARTIEL |

**Taches d'alignement :**
- [ ] Ajuster les CTA pour refleter le contenu ouvert (pas besoin de scanner pour explorer)
- [ ] Revoir les 3 feature cards pour coller a la vision V1 (consulter, corriger, s'entrainer)

---

## 4. Pipeline & contenu

| Aspect | Etat | Notes |
|--------|------|-------|
| Pipeline 6 etapes | Fonctionnel | read → validate → compile → resolve → write → generate-pdfs |
| Atomes MDX | 237 atomes (lesson, exercise, qcm) | 6 modules dans 3eme-math |
| Molecules YAML | 21 livrets unifies | Format `kind: livret` |
| Generation PDF | 17+ PDFs avec QR codes | Couverture + QR exercices |
| QR exercices | Fonctionnel | `/app/ex?b=...&e=...` |
| QR couverture | Fonctionnel | `/app/scan?code=...` |
| KB modules | 3 modules documentes | fonction-derivee, nombre-derive, fonctions |
| Plannings | 6 plannings actifs | Per-molecule WF2 |

**Statut : SOLIDE** — Le pipeline est le point fort du projet. Pas de changement necessaire pour V1.

---

## 5. Backlog d'alignement MVP

### Priorite haute (bloquant pour V1)

| # | Tache | Fichiers concernes | Statut |
|---|-------|--------------------|--------|
| 1 | ~~Supprimer le flux de pairing~~ | ~~service, types, API, hook, UI~~ | FAIT |
| 2 | ~~Transformer `/app/scan` en scanner → redirect~~ | ~~`scan/page.tsx`~~ | FAIT |
| 3 | ~~Gate visuel scan IA pour non-connectes~~ | ~~`exercise-scan-card.tsx`~~ | FAIT |
| 4 | ~~Ajouter sommaire dans le hub livret~~ | ~~`[code]/page.tsx`~~ | FAIT |

### Priorite moyenne (amelioration UX)

| # | Tache | Fichiers concernes | Statut |
|---|-------|--------------------|--------|
| 5 | ~~Separer scan IA (exercices only) + nettoyer page~~ | ~~`[exerciseId]/page.tsx`~~ | FAIT |
| 6 | ~~Mode consultation QCM (voir reponse)~~ | ~~`[exerciseId]/page.tsx`~~ | FAIT |
| 7 | ~~Ajuster landing page CTA~~ | ~~`(landing)/page.tsx`~~ | FAIT |
| 8 | ~~Nettoyer middleware~~ | ~~`middleware.ts`~~ | FAIT |

### Priorite basse (V2 / reporte)

| # | Tache | Notes |
|---|-------|-------|
| 9 | Simulations interactives | Nouveau type d'atome + composants |
| 10 | Re-introduire le pairing quand progression activee | Code existe, juste re-exposer |
| 11 | Migration localStorage → Firestore au login | Utile quand progression est un vrai feature |
| 12 | Parcours personnalises | 2nde-math, 1ere-tc a activer |

---

## 6. Architecture cible V1

```
ROUTES PUBLIQUES (sans compte)
  /                          Landing page
  /app/mes-livrets           Tous les livrets disponibles
  /app/mes-livrets/[code]    Hub livret (resume, exercices, QCM)
  /app/mes-livrets/[code]/resume       Resume du cours
  /app/mes-livrets/[code]/exercice/[id]  Enonce + solution
  /app/mes-livrets/[code]/qcm          Session QCM interactive
  /app/ex?b=...&e=...        Redirect QR exercice
  /app/scan                  Scanner QR → redirect vers contenu
  /login, /signup, /reset-password
  /terms, /privacy

ROUTES AUTH (avec compte)
  POST /api/scan             Correction IA (Bearer token)
  /app/progres               Dashboard progression

FEATURES GATING (cote client, pas middleware)
  ExerciseScanCard           → CTA login si non connecte
  Page progres               → CTA login si non connecte
```

---

## Historique des decisions

| Date | Decision | Contexte |
|------|----------|----------|
| 2026-03-17 | Supprimer le pairing en V1 | Contenu ouvert, zero friction |
| 2026-03-17 | Reporter les simulations interactives a V2 | Necessite nouveau type d'atome + composants |
| 2026-03-17 | Auth uniquement sur scan IA et progression | Simplification V1 |
| 2026-03-17 | Ajouter mode consultation QCM | QR doit pouvoir pointer vers une reponse |
| 2026-03-17 | Pairing supprime entierement (code + UI + Firestore rules) | YAGNI — pas de code speculatif |
| 2026-03-17 | Scan page simplifie (QR → redirect, pas de pairing) | Zero friction |
| 2026-03-17 | Landing CTA mis a jour ("Explorer les livrets") | Coherence avec contenu ouvert |
| 2026-03-17 | Middleware nettoye (route `/viewer` supprimee) | Hygiene |
