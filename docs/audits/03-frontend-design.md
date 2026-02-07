# Audit 3 -- Frontend Design Quality

Date : 2026-02-07
Source : skill frontend-design (Anthropic)
Scope : `src/app/**/*.tsx` (33 fichiers) + `src/components/**/*.tsx` (53 fichiers)

---

## Score global : 4.5 / 10

L'application est une plateforme Next.js correctement structuree sur shadcn/ui avec une architecture technique solide (Server Components, bonne separation des responsabilites). Cependant, du point de vue design, elle se presente comme un **prototype non theme** : palette entierement achromatique (oklch a chroma zero), polices generiques (Inter), textures et gradients absents, animations quasi-inexistantes. Les composants pedagogiques (lesson-parts, exercise-parts, QCM Player, CourseTimeline) sont le point fort -- bien colores, bien structures, avec des etats riches. Mais le wrapper autour (landing, auth, navigation, dashboard) reste un template SaaS anonyme sans identite liee a l'education ou aux mathematiques.

---

## 1. Typographie -- 3/10

### Bug critique : font-serif partiellement resolue

- `src/app/globals.css:11` -- `--font-serif: var(--font-source-serif), ui-serif, Georgia, serif` est maintenant declare dans `@theme inline`. La variable CSS est mappee.
- `src/app/layout.tsx:14-17` -- Source Serif 4 est charge via `next/font/google` et assigne a `--font-source-serif`. La variable est appliquee sur `<body>` via `${sourceSerif.variable}`.
- Les 7+ usages de `font-serif` dans le codebase devraient fonctionner : `app-sidebar.tsx:48`, `module-card.tsx:58`, `select-parcours/page.tsx:53`, `apprendre/page.tsx:48`, `apprendre/page.tsx:67`, `reviser/page.tsx:58`, `result/page.tsx:38`.

### Inter comme police principale

- `src/app/layout.tsx:9-12` -- Inter est la police sans-serif par defaut. C'est la police la plus generique du web moderne, explicitement deconseille par les guidelines frontend-design ("Inter" est cite comme "overused font family" a eviter).
- `src/app/globals.css:10` -- `--font-sans: var(--font-inter), ui-sans-serif, system-ui, sans-serif`.

### Hierarchie typographique plate

- La plupart des headings utilisent `font-semibold` ou `font-bold` sans variation systematique de taille ou de poids entre niveaux. Par exemple :
  - `src/app/(landing)/page.tsx:29` -- Hero h1: `text-4xl font-bold md:text-6xl` (correct)
  - `src/app/(landing)/page.tsx:54` -- Section h2: `text-3xl font-semibold` (correct)
  - `src/app/(parcours)/[parcours]/page.tsx:34` -- Dashboard: `text-lg font-semibold` (trop petit pour un titre de page)
  - `src/components/site-header.tsx:45` -- Header title: `text-base font-medium` (trop discret)
- Pas de variation de tracking, line-height, ou letter-spacing intentionnelle.
- `text-balance` utilise sur 5-6 headings (`landing/page.tsx:29,54,104,135`, `select-parcours/page.tsx:53`, `result/page.tsx:38`) mais absent de beaucoup d'autres.

### Bon usage de tabular-nums

- `src/components/patterns/qcm-player.tsx:163,166,191` -- Scores QCM en tabular-nums
- `src/components/course-timeline.tsx:252,306,360,492,510` -- Compteurs et pourcentages timeline
- `src/components/patterns/module-card.tsx:72` -- Pourcentage progression
- `src/app/(parcours)/[parcours]/reviser/reviser-client.tsx:71,83,93` -- Stats cards

### Observations

- Aucun usage de font-mono en dehors de l'admin (`atom-preview.tsx:31`)
- Pas de variation de style (italique) pour les descriptions ou citations
- La taille de base du body n'est pas explicitement definie (defaut browser 16px)

---

## 2. Couleur & Theme -- 2/10

### Palette entierement achromatique

- `src/app/globals.css:63-100` (light) et `103-141` (dark) -- Toutes les variables semantiques utilisent `oklch(X 0 0)` : lightness variable, **chroma zero, hue zero**. Cela signifie que :
  - `--primary: oklch(0.205 0 0)` = quasi-noir
  - `--secondary: oklch(0.97 0 0)` = quasi-blanc
  - `--accent: oklch(0.97 0 0)` = identique a secondary
  - `--muted: oklch(0.97 0 0)` = identique a secondary
  - `--background: oklch(1 0 0)` = blanc pur
  - `--foreground: oklch(0.145 0 0)` = quasi-noir
- **Il n'y a aucune couleur de marque dans l'interface.** Pas de teinte primaire reconnaissable.

### Couleurs semantiques hardcodees hors du systeme

Les tokens `--success`, `--info`, `--warning` existent dans globals.css (lignes 95-100) mais ne sont presque jamais utilises. A la place, des couleurs Tailwind sont hardcodees :

- Vert : `bg-green-100 dark:bg-green-900/20` (15+ occurrences) -- `activity-client.tsx:107`, `reviser-client.tsx:78,128,172,189`, `serie-player.tsx:218,236`, `serie-activity-client.tsx:105,129`, `profile-sheet.tsx:245`, `result/page.tsx:35`, `exercise-parts.tsx:26`, `lesson-parts.tsx:79`
- Bleu : `bg-blue-100 dark:bg-blue-900/20` (8+ occurrences) -- `reviser-client.tsx:89`, `parcours-banner.tsx:42`, `qcm-player.tsx:263`, `exercise-parts.tsx:40`, `lesson-parts.tsx:47`
- Ambre/Orange : `bg-amber-100 dark:bg-amber-900/20` (5+ occurrences) -- `exercise-parts.tsx:54`, `lesson-parts.tsx:95`, `profile-sheet.tsx:273`
- Violet : `bg-purple-100 dark:bg-purple-900/30` -- `profile-sheet.tsx:287`, `atom-list.tsx:10`
- Rouge/Rose : `bg-red-100/bg-rose-50` -- `exercise-parts.tsx:68`, `lesson-parts.tsx:111`, `qcm-player.tsx:224,238`
- Indigo : `bg-indigo-50` -- `lesson-parts.tsx:31`

Ces couleurs ne passent pas par les CSS variables, ce qui rend le theming global impossible sans modifier chaque fichier.

### viewport.themeColor orphelin

- `src/app/layout.tsx:35` -- `themeColor: '#9F6B53'` (terracotta chaud) n'est utilise nulle part dans l'UI. C'est un indice d'une direction de marque abandonnee.

### Dark mode structurellement present mais non teste visuellement

- `src/app/globals.css:103-142` -- Les variables dark existent
- `src/app/(landing)/layout.tsx:9` -- ThemeProvider avec `defaultTheme="system"`
- `src/components/profile-sheet.tsx:397-411` -- Toggle clair/sombre dans Settings
- Mais les couleurs hardcodees (green-100, blue-50) ont toutes leur pendant dark (`dark:bg-green-950/20`) -- effort de coherence.

### Aucun gradient, overlay ou couleur d'atmosphere

Zero usage de `bg-gradient-to-*`, `linear-gradient()`, ou gradients CSS dans tout le codebase.

---

## 3. Composition spatiale & Layout -- 5/10

### Structure de layout bien faite

- `src/app/(parcours)/[parcours]/layout.tsx:43-56` -- SidebarProvider + SidebarInset + SiteHeader + contenu : architecture de layout d'app classique et fonctionnelle.
- `src/app/(parcours)/[parcours]/apprendre/[moduleId]/layout.tsx:37-52` -- Split view module (timeline + contenu) bien pense.
- `src/app/(landing)/page.tsx` -- Hero > Features > Parcours > CTA > Footer : structure classique.
- Responsive systematiquement gere avec `sm:`, `md:`, `lg:` breakpoints.
- `max-w-7xl mx-auto` utilise correctement sur toutes les sections landing.

### Spacing coherent mais mecanique

- Padding : `px-4 lg:px-6` utilise comme pattern repete dans toutes les pages parcours.
- Gap : `gap-4`, `gap-6` utilises systematiquement.
- Vertical spacing : `py-20` pour les sections landing, `py-4 md:py-6` pour le contenu app.
- C'est correct mais sans surprise ni hierarchie de rythme.

### Absence totale de creativite spatiale

- Pas d'overlap entre elements
- Pas d'asymetrie
- Pas de bento grid ou layout non-standard
- Pas de white space genereux intentionnel (tout est dense)
- Landing page : strictement lineaire (Hero, Separator, Section, Separator, Section, Separator, CTA, Footer)
- Les Separators entre sections (`landing/page.tsx:49,99,129`) creent une segmentation brutale au lieu d'un rythme fluide

### Bon point : grilles adaptatives

- `src/app/(landing)/page.tsx:59` -- `grid md:grid-cols-3` pour features
- `src/app/(landing)/page.tsx:109` -- `grid sm:grid-cols-2` pour parcours
- `src/app/(parcours)/[parcours]/apprendre/page.tsx:70` -- `grid sm:grid-cols-2 lg:grid-cols-3`
- `src/app/admin/content/page.tsx:130` -- `grid-cols-1 md:grid-cols-[380px_1fr]` split admin

---

## 4. Motion & Animation -- 3/10

### prefers-reduced-motion globalement gere

- `src/app/globals.css:155-163` -- Excellent : une regle globale `@media (prefers-reduced-motion: reduce)` qui force `animation-duration: 0.01ms !important` et `transition-duration: 0.01ms !important` sur tous les elements. C'est la bonne approche.

### Transitions hover existantes mais minimales

- `transition-colors` sur les cards hover : `parcours/page.tsx:54,70` (`hover:bg-muted/50`), `apprendre/page.tsx:77`, `reviser-client.tsx:167`
- `transition-transform` sur les chevrons : `apprendre/page.tsx:90` (`group-hover:translate-x-1`), `course-timeline.tsx:446-448` (rotation chevron)
- `transition-[shadow,border-color]` : `select-parcours/page.tsx:62`, `activity-card.tsx:56`
- Ces sont des micro-transitions de base, pas des choix d'animation intentionnels.

### Skeletons de loading (bon point)

- `src/app/(parcours)/[parcours]/apprendre/loading.tsx` -- 3 cartes skeleton avec proportions correctes
- `src/app/(parcours)/[parcours]/reviser/loading.tsx` -- Stats + liste skeleton
- `src/components/nav-user.tsx:50-58` -- Avatar + texte skeleton

### Ce qui manque cruellement

- Aucune animation d'entree (fade-in, slide-up) sur les pages ou sections
- Aucun stagger sur les grilles de cards
- Aucune animation sur les resultats (page result, score QCM)
- Aucun scroll-triggered effect
- Aucune animation de celebration (confetti, check animes)
- Les 2 loading.tsx minimalistes (`module/loading.tsx:3`, `serie/loading.tsx:3`) affichent juste "Chargement..." en texte brut sans spinner ni animation
- `tw-animate-css` est importe (`globals.css:2`) mais utilise uniquement par les composants shadcn internes (accordion, sheet)

---

## 5. Details visuels & Polish -- 3/10

### Surfaces plates

- **Zero texture, zero bruit, zero grain, zero motif geometrique** dans tout le codebase.
- **Zero gradient** -- ni CSS, ni Tailwind `bg-gradient-to-*`.
- Les fonds sont tous des couleurs unies : `bg-background`, `bg-muted`, `bg-primary`, `bg-card`.

### Auth panel : moment de marque rate

- `src/components/login-form.tsx:140-149` et `signup-form.tsx:199-208` -- Le panneau decoratif droit des pages auth est :
  ```html
  <div className="bg-primary relative hidden md:block">
    <div className="absolute inset-0 flex items-center justify-center">
      <div className="text-primary-foreground text-center p-8">
        <h2 className="text-3xl font-bold mb-4">Learning</h2>
        <p className="text-lg opacity-90">Apprenez a votre rythme</p>
      </div>
    </div>
  </div>
  ```
  Avec `--primary` = quasi-noir, c'est un rectangle noir avec du texte blanc. C'est le moment visuel le plus important pour l'impression de marque et c'est vide.

### Usage minimal des ombres

- `hover:shadow-md` : `module-card.tsx:34`, `select-parcours/page.tsx:62`
- `shadow-lg` : `layout.tsx:51` (skip-to-content focus)
- `backdrop-blur-sm` : `course-timeline.tsx:615` (bouton mobile timeline) -- seul usage dans le codebase
- Pas de shadow system ou depth hierarchy.

### Bordures et radius bien geres

- `src/app/globals.css:61` -- `--radius: 0.625rem` avec calculs derives (`radius-sm` a `radius-4xl`)
- Usage coherent de `rounded-lg`, `rounded-xl`, `rounded-full` dans tous les composants
- `border-border` applique globalement (`globals.css:146`)

### Les lesson-parts sont le highlight design

- `src/components/content/lesson-parts.tsx` -- 6 composants (Definition, Theorem, Property, Example, Remark, Attention) avec :
  - Couleurs distinctes et coherentes (indigo, violet, sky, emerald, amber, rose)
  - Header avec icone + label colore + bordure inferieure
  - Fond colore subtil + bordure assortie
  - Support dark mode complet
  - C'est le seul endroit ou l'app a un langage visuel riche et intentionnel.

### Exercise-parts collapsibles bien codes

- `src/components/content/exercise-parts.tsx` -- 4 composants (Solution, Methode, Hint, Erreurs) avec details/summary natifs, couleurs color-coded, icones assorties.

### Icones coherentes

- Lucide utilise partout avec tailles coherentes (`h-4 w-4` pour inline, `h-5 w-5` pour medium, `h-8 w-8` et `h-10 w-10` pour hero).
- `aria-hidden="true"` applique sur la plupart des icones decoratives.

---

## 6. Qualite des composants -- 6/10

### QCM Player -- le composant le plus poli

- `src/components/patterns/qcm-player.tsx` -- 302 lignes avec :
  - Machine a etats claire (`answering` > `validated` > `finished`)
  - Raccourcis clavier (1-4 pour selectionner, Enter pour valider, Space pour continuer)
  - Indicateurs visuels `<kbd>` pour les raccourcis (lignes 253, 288)
  - Feedback couleur immediat (vert/rouge) apres validation
  - Explication pedagogique avec `aria-live="polite"` (ligne 263)
  - Barre de progression
  - Score tabular-nums
  - Ecran de resultat avec seuil de validation (70%)
  - Focus-visible sur les options (ligne 216)

### CourseTimeline -- composant le plus complexe

- `src/components/course-timeline.tsx` -- 635 lignes avec :
  - Support sections (Module) et liste plate (Serie)
  - StepIndicator multi-etats (complete/success, complete/retry, current, pending)
  - Section accordion avec compteurs de progression
  - Header collapsible avec metadata (duree, difficulte, objectifs)
  - Bouton "Continuer" intelligent (prochain non-complete)
  - Responsive : Sheet mobile + aside desktop
  - Bon usage de `tabular-nums` partout

### InteractiveCard -- bien pense pour l'accessibilite

- `src/components/ui/interactive-card.tsx` -- Card clickable avec :
  - `role="button"`, `tabIndex`, `aria-disabled`
  - Gestion keyboard (Enter + Space)
  - `focus-visible:ring-2`

### Etats vides geres

- `src/app/(parcours)/[parcours]/apprendre/page.tsx:57-61` -- "Aucun module disponible" avec icone
- `src/app/(parcours)/[parcours]/reviser/page.tsx:69-75` -- "Aucune serie disponible" avec message secondaire
- `src/app/admin/content/atom-list.tsx:41-44` -- "Aucun atome trouve"
- `src/components/patterns/scan-upload.tsx:183-195` -- Etat erreur avec icone + message + bouton retry

### Etats de chargement

- Skeletons bien structures pour apprendre et reviser
- NavUser skeleton (avatar + lignes)
- LandingHeader skeleton (bouton + cercle)
- MAIS : `module/loading.tsx` et `serie/loading.tsx` = juste du texte "Chargement..." sans skeleton ni spinner

### Ce qui manque

- Pas d'etat hover distinct sur le CourseTimeline ActivityItem (seulement `hover:bg-muted/50`)
- Pas de focus trap dans le QCM Player (les raccourcis sont globaux via `window`)
- Pas de toast/notification de succes apres completion d'exercice (juste changement d'icone)
- Le Toaster est importe (`layout.tsx:7,58`) mais les toasts ne sont declenches nulle part dans le code lu
- Pas d'etat disabled visuel sur les boutons de navigation (prev disabled quand premier)

---

## 7. Identite design -- 2/10

### Aucune identite de marque

- "Learning OS" est affiche en `text-lg font-semibold` (`landing-header.tsx:26`) -- pas de logo, pas de wordmark stylise, pas de traitement de marque.
- `src/components/app-sidebar.tsx:44` -- Logo sidebar = `BookOpen` dans un carre `bg-primary` generique + "Learning" en `font-serif text-lg`.
- L'icone BookOpen est la plus generique possible pour une app d'education.

### Aucun lien visuel avec le domaine

- Pas d'element mathematique dans le design (symboles, formules decoratives, grilles, graphiques)
- Pas d'illustration custom
- Pas de mascotte ou personnage
- Pas de reference culturelle (marocaine ou autre)
- L'app pourrait etre un CRM, un wiki, ou un gestionnaire de taches -- rien ne dit "mathematiques" ou "apprentissage"

### Template SaaS generique

- La landing page (`src/app/(landing)/page.tsx`) suit le pattern le plus commun : Hero centre > 3 feature cards > CTA card. C'est fonctionnel mais indiscernable de milliers d'autres landing pages.
- Les pages auth (`login/page.tsx`, `signup/page.tsx`) suivent le pattern shadcn login-01 sans personalisation.
- Le dashboard (`parcours/page.tsx`) est deux cards avec icones -- aucun element distinctif.

### themeColor orphelin

- `src/app/layout.tsx:35` -- `themeColor: '#9F6B53'` suggere une direction terracotta/chaude qui n'a jamais ete implementee dans l'UI. C'est la trace d'une intention de marque non realisee.

---

## Top 5 ameliorations a plus fort impact

1. **Injecter de la couleur dans la palette primaire** -- Remplacer `--primary: oklch(0.205 0 0)` par une couleur de marque chromatique. Le `#9F6B53` terracotta du viewport meta (environ `oklch(0.55 0.08 55)`) est un bon candidat. Propager cette couleur a primary, sidebar-primary, et les accents. Cela transformerait instantanement tout : boutons, sidebar, header active, links.

2. **Remplacer Inter par une sans-serif distinctive** -- Plus Jakarta Sans, Outfit, Manrope, ou General Sans. Inter est explicitement cite comme "AI slop" par les guidelines. Un changement de police change l'impression globale sans modifier un seul layout.

3. **Ajouter de l'atmosphere aux surfaces cles** -- (a) Hero landing : gradient subtil ou motif geometrique en fond. (b) Auth panel : gradient multi-couleur, ou pattern CSS inspire de motifs geometriques. (c) Result page : celebration visuelle (gradient, illustrations). Trois surfaces seulement, impact visuel massif.

4. **Animer les transitions de contenu** -- Fade-in + slide-up sur les grilles de cards avec `animation-delay` stagger. Transition de score sur la page result QCM. Animation du check de completion d'exercice. Utiliser les `@keyframes` de tw-animate-css deja importe.

5. **Unifier les couleurs semantiques dans le systeme** -- Migrer les 40+ usages de couleurs Tailwind hardcodees (green-100, blue-50, amber-200...) vers les tokens CSS `--success`, `--info`, `--warning` deja definis dans globals.css. Cela permettrait le theming global et reduirait la dette de maintenance.

---

## Ce que l'app fait bien

- Architecture technique exemplaire : Server Components par defaut, Client Components uniquement quand necessaire, bonne separation serveur/client
- Lesson-parts (Definition, Theorem, Property, Example, Remark, Attention) : le meilleur design de l'app, color-code avec icones, fond et bordures assorties, support dark mode
- Exercise-parts collapsibles avec `<details>` natifs -- zero JS supplementaire
- QCM Player avec raccourcis clavier, machine a etats, et feedback immediat
- CourseTimeline robuste avec support sections + liste plate, responsive mobile/desktop
- InteractiveCard avec accessibilite clavier complete
- `tabular-nums` utilise correctement pour les scores et compteurs
- `prefers-reduced-motion` gere globalement dans globals.css
- `text-balance` applique sur les headings importants
- Skeletons de chargement pour les pages principales
- `aria-hidden="true"` sur les icones decoratives
- `aria-live="polite"` sur les zones de feedback QCM
- Skip-to-content link accessible (`layout.tsx:49-53`)
- Dark mode structurellement complet

---

## Ce qui rendrait l'app memorable

- **Palette terracotta/chaude** -- Une primary `oklch(0.55 0.08 55)` (terracotta) avec accent `oklch(0.5 0.15 250)` (bleu profond) et touches d'or `oklch(0.75 0.12 85)` creeerait une identite chaleureuse et distinctive, ancree dans des references culturelles nord-africaines.

- **Motifs geometriques CSS** -- Des patterns inspires des zellige marocains en fond du panneau auth, du hero, et de la page result. Realisables en pur CSS avec `background-image: repeating-linear-gradient(...)` ou SVG inline. Zero dependance externe.

- **Typographie scholarly** -- Source Serif 4 pour tous les h1/h2, avec une sans-serif distinctive (Outfit ou Manrope) pour le corps. Cela ancrerait l'app dans un registre "education serieuse mais moderne".

- **Moments de celebration** -- Quand un eleve termine une serie ou obtient un bon score QCM : animation de confetti CSS, score qui s'anime de 0 a N, cercle de progression qui se remplit. Ce sont ces micro-moments qui rendent une app memorable.

- **Elements mathematiques comme decoration** -- Formules KaTeX dans le hero landing (`\int_0^1 f(x)\,dx`), symboles mathematiques flottants subtils en arriere-plan des sections, graphique decoratif dans le panneau auth. Cela dit immediatement "cette app est pour les maths".
