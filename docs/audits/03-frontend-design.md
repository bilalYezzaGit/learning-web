# Audit 3 — Frontend Design Quality

Date : 2026-02-06
Source : skill frontend-design (Anthropic)

---

## Score global : 4.5 / 10

L'application est une plateforme Next.js bien structuree sur shadcn/ui, mais elle se lit comme un **prototype non theme** plutot qu'un produit fini. La palette de couleurs est entierement achromatique (oklch a chroma zero), pas de gradient, pas de texture, pas d'atmosphere. La typo utilise Inter (generique) et charge Source Serif 4 mais ne le wire pas correctement dans Tailwind. L'impression globale est celle d'un template SaaS anonyme, pas d'une plateforme d'apprentissage math memorable.

---

## 1. Typographie — 3/10

### Bug critique : font-serif non mappee
- `src/app/layout.tsx:8-16` — Inter et Source Serif 4 sont charges via `next/font/google`. Source Serif 4 est assigne a `--font-source-serif`.
- `src/app/globals.css:10` — `--font-sans` est correctement mappe a `var(--font-inter)`.
- **Manquant** : pas de `--font-serif: var(--font-source-serif)` dans le bloc `@theme inline` de `globals.css`. Tailwind v4 definit `--font-sans` et `--font-mono` mais pas `--font-serif`.
- **Consequence** : les 7 usages de `font-serif` (`app-sidebar.tsx:48`, `module-card.tsx:57`, `select-parcours/page.tsx:52`, `apprendre/page.tsx:48,67`, `reviser/page.tsx:58`, `result/page.tsx:38`) rendent en Times New Roman au lieu de Source Serif 4.

### Observations
- Inter est la police la plus generique possible ("AI slop font")
- Pas de variation de poids au-dela de bold/semibold/medium
- `text-balance` utilise a 3 endroits mais absent du hero landing et de la plupart des headings
- `tabular-nums` bien utilise dans le course-timeline (bon point)

---

## 2. Couleur & Theme — 2/10

### Palette entierement achromatique
- `src/app/globals.css:53-88` — Toutes les variables CSS utilisent `oklch(X 0 0)` : lightness avec **zero chroma, zero hue**. Primary, secondary, accent, muted, background, foreground, border = **tous gris purs**.
- `--primary: oklch(0.205 0 0)` est quasi-noir. `--secondary: oklch(0.97 0 0)` est quasi-blanc.
- Seule couleur chromatique : `--destructive: oklch(0.577 0.245 27.325)` (rouge) et les chart colors.

### Couleurs semantiques hardcodees
- Vert pour succes (`profile-sheet.tsx:245`, `result/page.tsx:35`, `exercise-parts.tsx:26`)
- Bleu pour info (`exercise-parts.tsx:40`)
- Ambre pour indices (`exercise-parts.tsx:54`)
- Rouge pour erreurs (`exercise-parts.tsx:68`)
- Ce sont des couleurs Tailwind hardcodees (green-100, blue-50), pas integrees au systeme de variables CSS.

### Aucun gradient nulle part dans le codebase
### `viewport.themeColor` est `#9F6B53` (terracotta chaud) mais cette couleur n'apparait nulle part dans l'UI

---

## 3. Composition spatiale & Layout — 4/10

- Spacing consistant avec l'echelle Tailwind (bon)
- Layout bien organise mais cookie-cutter
- Landing page : Hero, Separator, Features, Separator, Parcours, Separator, CTA — tres corporate/template
- `max-w-7xl` + `mx-auto` utilise correctement
- Bon responsive (2-col desktop / 1-col mobile pour auth, grid adaptatif pour cards)
- **Aucun choix creatif** : pas d'offset, pas d'overlap, pas d'asymetrie

---

## 4. Motion & Animation — 3/10

- `tw-animate-css` importe pour les animations shadcn
- `transition-colors` sur hover des cards
- `transition-all` sur select-parcours (anti-pattern)
- Skeletons de loading implementes pour Apprendre et Reviser (bon)
- **`prefers-reduced-motion` non respecte** — zero match dans le code custom
- Pas de transitions de page
- Pas d'animations d'entree staggerees
- Pas d'animations scroll-based

---

## 5. Details visuels & Polish — 3/10

- **Fonds plats partout** — pas de texture, gradient, bruit ou effet atmospherique
- Le panneau lateral auth (`login-form.tsx:138-147`, `signup-form.tsx:195-204`) est un rectangle `bg-primary` plat avec du texte blanc centre. C'est le moment de marque le plus visible et c'est un rectangle quasi-noir.
- Usage minimal des ombres : `shadow-md` au hover sur module-card et select-parcours
- `backdrop-blur` utilise une seule fois (timeline mobile toggle)
- Bordures/radius consistants via le systeme CSS variables (bon)
- Icones consistantes (Lucide, tailles coherentes)
- **Les exercise-parts sont le highlight design** : sections collapsibles color-codees avec icones assorties

---

## 6. Qualite des composants — 6/10

### QCM Player — bien construit
- Raccourcis clavier (1-4, Enter, Space) avec indicateurs visuels (kbd tags)
- Machine a etats claire : answering, validated, finished
- Bonnes couleurs de feedback (vert/rouge)
- Barre de progression

### Course Timeline — le composant le plus complexe et poli
- Accordion par section avec compteurs de progression
- Indicateurs d'etape multi-etats
- Header collapsible avec metadata
- Bonne responsive mobile/desktop avec Sheet

### Etats vides geres
- `apprendre/page.tsx:57-61` — "Aucun module disponible"
- `reviser/page.tsx:69-75` — "Aucune serie disponible"
- `profile-sheet.tsx:88-108` — Etat invite avec CTA

---

## 7. Identite design — 2/10

- **Aucune identite visuelle memorable.** L'app ressemble a tout autre starter template shadcn.
- "Learning OS" affiche en `text-lg font-semibold` sans traitement de marque. Pas de logo, pas de wordmark stylise.
- Pas de lien visuel avec le domaine education/math
- Pas de reference a la culture visuelle marocaine
- Pas d'illustrations custom
- La couleur `#9F6B53` dans le viewport meta suggere une direction terracotta/chaude jamais exploitee

---

## Top 5 ameliorations a plus fort impact

1. **Fixer le mapping `font-serif`** — Ajouter `--font-serif: var(--font-source-serif)` dans `@theme inline` de `globals.css`. Chaque usage de `font-serif` rendera correctement. Envisager de remplacer Inter par une sans-serif plus distinctive (Plus Jakarta Sans, Outfit, Manrope).

2. **Introduire de la couleur** — Remplacer la palette achromatique par un systeme de couleurs chaud et intentionnel. Le `#9F6B53` terracotta du viewport meta est un bon point de depart. Definir `--primary` en terracotta, `--accent` en bleu ou or complementaire.

3. **Ajouter de l'atmosphere aux surfaces cles** — Le hero landing a besoin d'un gradient ou motif geometrique. Le panneau auth a besoin de plus qu'une couleur plate — gradient, motif CSS geometrique (inspire des zellige marocains), ou au minimum un radial gradient.

4. **Animer intentionnellement** — Fade-in stagger sur les grilles de cards. Scale-up subtil sur la selection QCM. Animation de celebration sur la page result. Ajouter `prefers-reduced-motion` partout.

5. **Creer un layout landing distinctif** — Remplacer le hero centre generique par un layout asymetrique. Ajouter des symboles mathematiques flottants comme elements decoratifs. Varier le rythme section-separator-section.

---

## Ce que l'app fait bien

- Architecture code excellente (Server Components par defaut, separation claire)
- Skeletons de loading implementes
- Course timeline bien engineer avec UX reflechie
- Exercise parts avec langage visuel color-code clair
- QCM Player avec raccourcis clavier
- `tabular-nums` correctement utilise
- Responsive bien gere
- Dark mode structurellement complet

---

## Ce qui rendrait l'app memorable

- **Palette terracotta/chaude** enracinee dans la culture visuelle marocaine (or, bleu, terre)
- **Motifs geometriques** inspires des zellige comme elements decoratifs CSS
- **Source Serif 4 fonctionnel** et utilise pour tous les headings (ambiance scholarly)
- **Un wordmark "Learning OS" distinctif** au-dela de l'icone BookOpen generique
- **Moments de celebration** quand les eleves completent des activites (confetti, animations)
- **Typographie mathematique comme element design** — expressions KaTeX decoratives dans le hero
