# MVP Roadmap — Parcours 1ere TC

> Objectif : publier le parcours 1ere annee Tronc Commun, complet (15 modules),
> avec un contenu riche, interactif et attractif. Acces libre sans inscription.

## Vision MVP

- **Public** : Eleves 1ere TC (lycee tunisien)
- **Acces** : 100% libre — l'eleve parcourt cours, exercices, series sans compte
- **Auth** : Optionnelle — debloque uniquement le suivi de progression
- **Perimetre** : 15 modules du programme 1ere TC, bien faits et riches

---

## Graphe de dependances

```
C1 Fondations ──────────┬──→ C4 Contenu (fil rouge, le plus gros)
                        │
                        ├──→ C3 UX & Polish
                        │        │
C2 Identite & Vitrine ──┘        ├──→ C3.5 Refonte page Revision
(peut demarrer tot)               │         (besoin C1.4 + C4.3)
                                  │
                                  └──→ C3.4 Motion & Animation
                                            (besoin C3.1-C3.3)

C5 Mobile & PWA ─────── independant (peut avancer en parallele)
       │
       └──→ C5.3 Scan ── optionnel MVP (si le temps)
                          (besoin C1 + deploiement)

C6 Deploiement ──────── dernier (besoin que tout soit pret)
```

---

## C1 — Fondations techniques

> Fiabiliser le systeme de contenu + quick wins perf.
> **Dependances : aucune — c'est le point de depart.**
> **Debloque : C4 (contenu), C3.5 (page revision)**

### 1.1 Supprimer le ContentRenderer legacy
- [ ] Retirer `src/content/renderer.tsx` et ses usages
- [ ] Migrer `activity-content.tsx` vers le pipeline MDX unique
- [ ] Un seul chemin : `content/` → `src/lib/content.ts` → pages

### 1.2 Validation Zod du contenu
- [ ] Schemas Zod pour les atomes (frontmatter MDX)
- [ ] Schemas Zod pour les molecules (YAML : cours, series, programmes)
- [ ] Validation des references : chaque step pointe vers un atome existant
- [ ] Erreurs claires au build, pas de crash silencieux en prod

### 1.3 Refactorer le parsing QCM (approche hybride)
- [ ] Garder `<Question>`, `<Option>`, `<Explanation>` comme vrais composants MDX (contenu riche)
- [ ] Deplacer uniquement `correctOption` dans le frontmatter (seule donnee structuree)
- [ ] Compiler le MDX au lieu de parser par regex — plein pouvoir MDX
- [ ] Migrer les 67 QCM existants (ajouter `correctOption` au frontmatter)
- [ ] Supprimer le parsing regex (`parseQcmComponents`, `parseQcmLegacy`)

### 1.4 Evoluer le modele de donnees des series
- [ ] Ajouter les champs au schema YAML des series :
  - `type` : `mono-module` | `cross-module` | `devoir-controle` | `devoir-synthese`
  - `trimestre` : 1, 2 ou 3
  - `modules` : liste des modules couverts (pour cross-module et devoirs)
  - `priority` : ordre d'affichage au sein d'un trimestre
- [ ] Mettre a jour le schema Zod (1.2) pour valider ces nouveaux champs
- [ ] Mettre a jour `src/lib/content.ts` : loaders, resolvers, types
- [ ] Mettre a jour `src/types/content.ts` : interface Serie

### 1.5 Performance — Quick wins zero risque
- [ ] `React.cache()` sur `compileMdx` dans `src/lib/mdx.ts` (cache per-request uniquement)
- [ ] Dynamic imports pour les libs lourdes : `recharts`, `mathjs`, `mafs`
- [ ] `optimizePackageImports` dans `next.config.ts` pour `lucide-react`, `recharts`, `date-fns`

---

## C2 — Identite visuelle & Vitrine

> Definir la marque ET construire la landing en meme temps.
> **Dependances : aucune** (peut demarrer en parallele de C1).
> **Debloque : C3 (les tokens couleur/typo servent partout)**

### 2.1 Identite visuelle
- [ ] Palette de couleur de marque (remplacer le noir/blanc/gris achromatique)
- [ ] Police distinctive (remplacer Inter — Plus Jakarta Sans, Outfit, ou Manrope)
- [ ] Atmosphere sur surfaces cles (gradient hero, panneau auth, page result)
- [ ] Elements mathematiques decoratifs (formules dans le hero, symboles)

### 2.2 Landing page — Hero
- [ ] CTA principal → "Explorer le parcours 1ere TC" (lien direct vers `/1ere-tc/apprendre`)
- [ ] CTA secondaire → "J'ai un compte" (reste ok)
- [ ] Message large lycee mais qui met en avant le 1ere TC comme parcours disponible
- [ ] Retirer le push vers signup comme action principale

### 2.3 Landing page — Section parcours (actif vs bientot)
- [ ] 1ere TC = cliquable, visuellement mis en avant
- [ ] Les 4 autres niveaux = badge "Bientot", visuellement desactives (opacite, pas de lien)
- [ ] Passer `available: false` dans `ParcoursConfig` pour les parcours sans contenu
- [ ] Gerer l'affichage "coming soon" sur la landing (et bloquer l'acces aux routes)

### 2.4 Landing page — Features & CTA
- [ ] Promesses concretes : chiffres (15 modules, 90+ activites), apercu, preuve
- [ ] CTA final → "Commence le premier chapitre" (lien direct dans le contenu)
- [ ] Inscription suggeree en secondaire ("Cree un compte pour sauvegarder ta progression")

### 2.5 Header & Footer
- [ ] Lien direct vers le parcours meme quand non connecte (pas que signup/login)
- [ ] Verifier que /terms et /privacy existent (pages necessaires avant mise en prod)

---

## C3 — UX & Polish

> Corriger les bugs UX, ajouter du mouvement, refondre la page revision.
> **Dependances : C2 (tokens couleur/typo definis avant).**
> **C3.5 depend aussi de C1.4 (data model series) + C4.3 (contenu series existant).**

### 3.1 Quick wins + Accessibilite
- [ ] **Lot A** : 11 corrections atomiques (svh, cursor-pointer, ellipsis, touch-action, preconnect...)
- [ ] **Lot B** : Sweep aria-hidden sur ~60 icones decoratives dans ~25 fichiers
- [ ] **Lot C** : Interactions clavier (closure stale QCM, drop zone, double-click prevention)

### 3.2 Typographie + Tokens couleur
- [ ] Tailles min mobile (11px/13px → 14px), text-balance, placeholders
- [ ] Migrer 40+ couleurs hardcodees (green-100, blue-50...) vers tokens `--success`, `--info`, `--warning`

### 3.3 Composants specifiques
- [ ] CourseTimeline (chevauchement mobile, largeur sheet)
- [ ] Landing page (cards entierement cliquables, feature cards non-interactives)
- [ ] Admin responsive, scan-upload next/image, QCM focus ring

### 3.4 Motion & Animation
> Dependance : C3.1-C3.3 (les composants doivent etre corriges avant d'animer)

- [ ] Countdown visuel auto-advance serie (au lieu de setTimeout invisible)
- [ ] Skeletons coherents (remplacer les 2 "Chargement..." texte brut)
- [ ] Animations entree staggerees sur grilles de cards
- [ ] Animation de celebration page result QCM

### 3.5 Refonte page Revision
> Dependance : C1.4 (data model series) + C4.3 (series creees)

- [ ] **Section "Pour toi maintenant"** : series du trimestre en cours mises en avant
- [ ] **Organisation par categorie** : onglets (par module / cross-module / devoirs types)
- [ ] **Filtres** : par module, par difficulte, par type de serie, par trimestre
- [ ] **Recherche** : trouver une serie specifique
- [ ] **Indicateurs visuels** : differencier mono-module, cross-module, DC, DS
- [ ] **Badge trimestre** : T1, T2, T3 visible sur chaque serie

---

## C4 — Contenu (fil rouge)

> Le coeur de la MVP. Demarre des que C1 est termine et tourne en continu
> en parallele des autres chantiers.
> **Dependances : C1 (systeme fiabilise, QCM refactore, data model series).**
> **Debloque : C3.5 (la page revision a besoin de series pour exister)**

### 4.1 Audit du contenu existant
- [ ] Inventaire par module : nombre de lecons/exercices/QCM, qualite actuelle
- [ ] Identifier les modules les plus pauvres en contenu
- [ ] Definir un standard minimum par module (ex: X lecons, Y exercices, Z QCM)

### 4.2 Enrichir les explications et activites
- [ ] Exploiter les composants interactifs : `<Graph>`, `<Variations>`, `<TviExplorer>`
- [ ] Ajouter des simulations visuelles la ou c'est pertinent
- [ ] Explications QCM riches (pas juste du texte — schemas, graphes, etapes visuelles)
- [ ] Exercices avec feedback visuel

### 4.3 Creer les series de revision
> Actuellement : 4 series, toutes sur fonctions affines. Il en faut ~25-40.

- [ ] **Series mono-module** : au moins 1 par module (15 series minimum)
- [ ] **Series cross-module par trimestre** :
  - T1 : geometrie (angles, Thales, trigo), numerique, algebre
  - T2 : fonctions (lineaires, affines, equations), systemes
  - T3 : revision generale / synthese
- [ ] **Devoirs types** :
  - Devoirs de controle (1-2 par trimestre, ciblent quelques modules)
  - Devoirs de synthese (1 par trimestre, couvrent tout le trimestre)
- [ ] **Gros problemes cross-module** : problemes ouverts compilant plusieurs chapitres
- [ ] Priorite par trimestre (trimestre 1 d'abord pour le lancement)

### 4.4 Creer les contenus manquants
- [ ] (A definir apres l'audit 4.1)

---

## C5 — Mobile & PWA

> Les eleves utilisent principalement le telephone.
> **Dependances : aucune pour PWA et corrections mobile.**
> **C5.3 (scan) depend de C1 + deploiement — optionnel pour le lancement.**

### 5.1 PWA
- [ ] Strategie de cache **NetworkFirst** (contenu frais si reseau disponible)
- [ ] Fallback offline uniquement pour les pages deja visitees
- [ ] Pas de cache agressif pendant la phase de lancement
- [ ] Page offline/fallback (quand pas de reseau)
- [ ] Prompt "Ajouter a l'ecran d'accueil" (install banner)
- [ ] Verifier les icones PWA (192/512 existent, verifier la qualite)

### 5.2 Corrections UX mobile
- [ ] `100vh` → `100svh` (debordement iOS Safari)
- [ ] Textes trop petits dans la timeline (11px/13px → 14px min)
- [ ] Sheet mobile trop large sur petits ecrans
- [ ] Bouton timeline mobile qui chevauche le header

### 5.3 Scan (optionnel MVP)
> Dependance : C1 (systeme de contenu stable) + deploiement Firebase Functions.
> Si pas pret au lancement, on lance sans et on ajoute en V1.1.

- [ ] Integrer `ScanUpload` dans la page activite (type exercice)
- [ ] Verifier/deployer la Cloud Function `analyzeScan` cote Firebase
- [ ] Historique des scans visible par l'eleve (Firestore `users/{uid}/scanHistory/`)
- [ ] UX cross-device : QR code desktop → scan mobile
- [ ] Resultat synchro en temps reel via Firestore `onSnapshot`

### 5.4 Analytics / Geolocalisation
- [ ] Firebase Analytics pour localiser les utilisateurs
- [ ] Dashboard basique pour visualiser la repartition geographique

---

## C6 — Deploiement

> Derniere etape : mettre en ligne.
> **Dependances : C1 + C2 + C3 + C4 (minimum T1) doivent etre prets.**

### 6.1 Deploiement Vercel
- [ ] Deployer sur Vercel (import du repo)
- [ ] Configurer les variables d'environnement Firebase (`NEXT_PUBLIC_FIREBASE_*`)
- [ ] Domaine personnalise (si pret)
- [ ] Verifier le build en production (`npm run build` sans erreurs)

### 6.2 Verification pre-lancement
- [ ] Tester le parcours complet 1ere TC de bout en bout
- [ ] Verifier l'experience mobile (PWA, responsive)
- [ ] Verifier que les 4 autres parcours sont bien bloques
- [ ] Pages /terms et /privacy en place

---

## Planning

```
Semaine   C1          C2            C3          C4           C5         C6
          Fondations  Identite      UX/Polish   Contenu      Mobile     Deploy
          ──────────  ──────────    ──────────  ──────────   ──────────  ──────

  1-2     ████████                                           ░░░░░░░░
          C1.1-1.5                                           C5.2 mobile

  2-3     ░░░░░░░░    ████████                  ████████
          C1 fin      C2.1-2.5                  C4.1 audit

  3-5                 ░░░░░░░░      ████████    ████████     ████████
                      C2 fin        C3.1-3.3    C4.2-4.3     C5.1 PWA

  5-7                               ████████    ████████
                                    C3.4-3.5    C4.3-4.4

  7-8                                           ░░░░░░░░                ████████
                                                C4 fin                  C6.1-6.2
```

> **C4 (contenu) est le fil rouge** : il demarre semaine 2 et ne s'arrete qu'au deploiement.
> **C5 (mobile)** avance en parallele car independant.
> Le scan (C5.3) est optionnel — on decide au moment du deploiement si on l'inclut.
