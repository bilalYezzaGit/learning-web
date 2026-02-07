# MVP Roadmap — Parcours 1ere TC

> Objectif : publier le parcours 1ere annee Tronc Commun, complet (15 modules),
> avec un contenu riche, interactif et attractif. Acces libre sans inscription.

## Vision MVP

- **Public** : Eleves 1ere TC (lycee tunisien)
- **Acces** : 100% libre — l'eleve parcourt cours, exercices, series sans compte
- **Auth** : Optionnelle — debloque uniquement le suivi de progression
- **Perimetre** : 15 modules du programme 1ere TC, bien faits et riches

---

## Chantier 1 — Fiabiliser le systeme de contenu

> Garantir que le contenu est isole, valide et evolutif avant d'enrichir.

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
- [ ] Compiler le MDX au lieu de parser par regex — plein pouvoir MDX dans questions/options/explications
- [ ] Migrer les 67 QCM existants (ajouter `correctOption` au frontmatter)
- [ ] Supprimer le parsing regex (`parseQcmComponents`, `parseQcmLegacy`)

---

## Chantier 2 — Enrichir les contenus (15 modules)

> Le gros du travail : rendre chaque module attractif et pedagogiquement riche.

### 2.1 Audit du contenu existant
- [ ] Inventaire par module : nombre de lecons/exercices/QCM, qualite actuelle
- [ ] Identifier les modules les plus pauvres en contenu
- [ ] Definir un standard minimum par module (ex: X lecons, Y exercices, Z QCM)

### 2.2 Enrichir les explications et activites
- [ ] Exploiter les composants interactifs : `<Graph>`, `<Variations>`, `<TviExplorer>`
- [ ] Ajouter des simulations visuelles la ou c'est pertinent
- [ ] Explications QCM riches (pas juste du texte — schemas, graphes, etapes visuelles)
- [ ] Exercices avec feedback visuel

### 2.3 Creer les contenus manquants
- [ ] (A definir apres l'audit module par module)

---

## Chantier 3 — UI/UX : de "prototype" a "produit attractif"

> Score actuel : 4.5/10. L'app est fonctionnelle mais generique.
> Diagnostic complet dans `docs/audits/` (3 rapports + plan d'action).

### 3.1 Quick wins + Accessibilite (~2h)
- [ ] **Lot A** : 11 corrections atomiques (svh, cursor-pointer, ellipsis, touch-action, preconnect...)
- [ ] **Lot B** : Sweep aria-hidden sur ~60 icones decoratives dans ~25 fichiers
- [ ] **Lot C** : Interactions clavier (closure stale QCM, drop zone, double-click prevention)

### 3.2 Typographie + Tokens couleur (~2h)
- [ ] **Lot E** : Tailles min mobile (11px/13px → 14px), text-balance, placeholders
- [ ] **Lot F** : Migrer 40+ couleurs hardcodees (green-100, blue-50...) vers tokens `--success`, `--info`, `--warning`

### 3.3 Composants specifiques (~2h)
- [ ] **Lot G** : CourseTimeline (chevauchement mobile, largeur sheet)
- [ ] **Lot G** : Landing page (cards entierement cliquables, feature cards non-interactives)
- [ ] **Lot G** : Admin responsive, scan-upload next/image, QCM focus ring

### 3.4 Motion & Animation (~2h)
- [ ] **Lot D** : Countdown visuel auto-advance serie (au lieu de setTimeout invisible)
- [ ] **Lot D** : Skeletons coherents (remplacer les 2 "Chargement..." texte brut)
- [ ] **Lot D** : Animations entree staggerees sur grilles de cards
- [ ] **Lot D** : Animation de celebration page result QCM

### 3.5 Identite visuelle (chantier design)
- [ ] **H1** : Palette de couleur de marque (remplacer le noir/blanc/gris achromatique)
- [ ] **H2** : Police distinctive (remplacer Inter — Plus Jakarta Sans, Outfit, ou Manrope)
- [ ] **H3** : Atmosphere sur surfaces cles (gradient hero, panneau auth, page result)
- [ ] **H4** : Elements mathematiques decoratifs (formules dans le hero, symboles)

---

## Chantier 4 — Landing page recentree MVP

> La landing raconte actuellement "inscrivez-vous a une plateforme generique".
> Elle doit raconter "voici la plateforme du lycee, le 1ere TC est pret, plongez-y".

### 4.1 Hero
- [ ] CTA principal → "Explorer le parcours 1ere TC" (lien direct vers `/1ere-tc/apprendre`)
- [ ] CTA secondaire → "J'ai un compte" (reste ok)
- [ ] Message large lycee mais qui met en avant le 1ere TC comme parcours disponible
- [ ] Retirer le push vers signup comme action principale

### 4.2 Section parcours (actif vs bientot)
- [ ] 1ere TC = cliquable, visuellement mis en avant
- [ ] Les 4 autres niveaux = badge "Bientot", visuellement desactives (opacite, pas de lien)
- [ ] Passer `available: false` dans `ParcoursConfig` pour les parcours sans contenu
- [ ] Gerer l'affichage "coming soon" sur la landing (et bloquer l'acces aux routes)

### 4.3 Section features
- [ ] Rendre les promesses concretes : chiffres (15 modules, 90+ activites), apercu, preuve
- [ ] Ou rendre les cards cliquables vers une section du parcours

### 4.4 CTA final
- [ ] "Commence le premier chapitre" → lien direct dans le contenu
- [ ] Inscription suggeree en secondaire ("Cree un compte pour sauvegarder ta progression")

### 4.5 Header
- [ ] Ajouter un lien direct vers le parcours meme quand non connecte (pas que signup/login)

### 4.6 Footer / Legal
- [ ] Verifier que /terms et /privacy existent (pages necessaires avant mise en prod)
- [ ] Garder "Learning OS" pour le moment

---

## Chantier 5 — Mobile (PWA + Scan)

> Les eleves utilisent principalement le telephone. Le site doit etre une vraie app mobile
> via PWA, et le scan d'exercices doit etre branche et fonctionnel.

### 5.1 Brancher le scan dans les pages exercices
- [ ] Integrer `ScanUpload` dans la page activite (type exercice)
- [ ] Verifier/deployer la Cloud Function `analyzeScan` cote Firebase
- [ ] Historique des scans visible par l'eleve (Firestore `users/{uid}/scanHistory/`)

### 5.2 UX cross-device : QR code desktop → scan mobile
- [ ] Page exercice desktop : afficher un QR code "Scanne depuis ton telephone"
- [ ] Le QR ouvre directement la page de scan pour cet exercice precis
- [ ] Resultat synchro en temps reel sur le desktop via Firestore `onSnapshot`
- [ ] Necessite que l'eleve soit connecte (meme compte sur les 2 appareils)

### 5.3 PWA complete
- [ ] Page offline/fallback (quand pas de reseau)
- [ ] Strategie de cache : cours consultables hors-ligne
- [ ] Prompt "Ajouter a l'ecran d'accueil" (install banner)
- [ ] Verifier les icones PWA (192/512 existent, verifier la qualite)

### 5.4 Corrections UX mobile (deja identifies dans l'audit)
- [ ] `100vh` → `100svh` (debordement iOS Safari)
- [ ] Textes trop petits dans la timeline (11px/13px → 14px min)
- [ ] Sheet mobile trop large sur petits ecrans
- [ ] Bouton timeline mobile qui chevauche le header

### 5.5 Analytics / Geolocalisation
- [ ] Firebase Analytics pour localiser les utilisateurs
- [ ] Dashboard basique pour visualiser la repartition geographique

---

## Chantier 6 — (A discuter)

> Points ouverts a couvrir ensemble :
> - Deploiement : Vercel ? Domaine ? CI/CD ?
> - SEO : comment les eleves trouvent le site ?
> - Series (revision) : etat actuel, enrichir ?
> - Performance : temps de chargement, optimisation build

---

## Ordre de priorite

| Priorite | Chantier | Raison |
|----------|----------|--------|
| 1 | 1 — Fiabiliser le systeme | Prerequis avant de toucher au contenu en masse |
| 2 | 3.1-3.3 — UI quick wins + corrections | Rendre l'app utilisable proprement |
| 3 | 3.5 — Identite visuelle | Donner envie aux eleves de rester |
| 4 | 3.4 — Motion & animation | Polish final |
| 5 | 4 — Landing page MVP | Premier contact eleve, doit donner envie |
| 6 | 5 — Mobile (PWA + Scan) | Experience telephone + feature scan |
| 7 | 2 — Enrichir les contenus | Le coeur de la MVP |
| 8 | 6 — A definir | Deploiement, SEO, etc. |
