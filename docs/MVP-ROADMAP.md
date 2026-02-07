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
- [ ] **H5** : Landing page recentree MVP (acces direct au parcours 1ere TC, pas "signup first")

---

## Chantier 4 — (A discuter)

> Points ouverts a couvrir ensemble :
> - Deploiement : Vercel ? Domaine ? CI/CD ?
> - SEO : comment les eleves trouvent le site ?
> - Mobile : experience sur telephone (PWA ?)
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
| 5 | 2 — Enrichir les contenus | Le coeur de la MVP |
| 6 | 4 — A definir | Deploiement, SEO, etc. |
