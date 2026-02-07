# Audit 2 — UI/UX Pro Max

Date : 2026-02-07
Source : skill ui-ux-pro-max (design intelligence)

---

## Methodologie

86 fichiers .tsx dans le scope (33 app + 53 components). 33 fichiers shadcn/ui primitifs exclus de l'audit (generes automatiquement). 53 fichiers audites contre les criteres UI/UX Pro Max : accessibilite, touch & interaction, performance, layout & responsive, typographie & couleur, animation.

Note : cet audit remplace celui du 2026-02-06. Plusieurs issues CRITICAL et HIGH du precedent audit ont ete corrigees (InteractiveCard, role="alert", prefers-reduced-motion, Toaster, font-serif mapping, aria-label logout).

---

## Issues par fichier

### src/app/(landing)/page.tsx

```
HIGH      :54   - Cards "Comment ca marche" (feature cards) non interactives mais ressemblent a des boutons — risque de confusion utilisateur. Si non cliquables, ajouter un style distinctif ; si cliquables, ajouter cursor-pointer + Link wrapper.
HIGH      :111  - Parcours cards : le cursor-pointer est seulement sur le Button interne, pas sur le Card entier. L'utilisateur tente de cliquer la carte entiere.
MEDIUM    :147  - Footer links manquent de focus-visible ring explicite (relies sur le style navigateur).
MEDIUM    :151  - Lien "Conditions" et "Confidentialite" : transition-colors sans duree explicite — utiliser transition-colors duration-200.
LOW       :29   - Heading h1 text-4xl (36px) sur mobile 375px pourrait etre legerement grand ; considerer text-3xl pour mobile.
```

### src/app/select-parcours/page.tsx

```
HIGH      :39   - Loading state en texte brut "Chargement..." sans skeleton ou spinner — UX fragile, pas de reserve d'espace (content jumping).
MEDIUM    :70   - Button "Choisir" avec variant="link" est redondant dans un InteractiveCard deja cliquable — confusion sur quoi cliquer.
LOW       :62   - transition-[shadow,border-color] sans duree explicite — s'appuie sur le default Tailwind (150ms), expliciter pour clarte.
```

### src/app/(parcours)/[parcours]/page.tsx

```
HIGH      :54   - Cards "Apprendre" et "Reviser" : cursor-pointer manquant. Le <Link> est sur la Card mais la Card elle-meme n'affiche pas cursor-pointer (transition-colors seulement). L'element cliquable n'est pas visuellement signale.
LOW       :55   - Cards navigation manquent d'un aria-label descriptif sur le lien pour les screen readers (le titre du CardTitle n'est pas explicitement associe).
```

### src/app/(parcours)/[parcours]/apprendre/page.tsx

```
MEDIUM    :76   - Cards modules dans <Link className="group"> : le cursor-pointer est implicite via le Link, mais la Card elle-meme pourrait beneficier d'un hover plus explicite.
LOW       :59   - Icone BookOpen dans l'empty state : aria-hidden="true" present, correct.
```

### src/app/(parcours)/[parcours]/apprendre/[moduleId]/layout.tsx

```
MEDIUM    :50   - Deux elements <main> potentiellement imbriques — un id="main-content" dans parcours layout (ligne 49) et un autre <main> ici (ligne 50). Le standard HTML interdit les <main> imbriques. L'un devrait etre <div> ou l'autre supprime.
```

### src/app/(parcours)/[parcours]/apprendre/[moduleId]/page.tsx

```
MEDIUM    :56   - BookOpen icon dans la welcome card manque aria-hidden="true".
LOW       :87   - Taille des badges ("X sections", "X activites") pourrait etre insuffisante comme touch targets (< 44px hauteur).
```

### src/app/(parcours)/[parcours]/apprendre/[moduleId]/[activityId]/page.tsx

```
MEDIUM    :64   - Bouton back mobile icon-only (<ChevronLeft>) a un sr-only "Retour au module" ce qui est correct. Pas de probleme.
MEDIUM    :105  - <div /> vide utilise comme spacer au lieu de <span aria-hidden="true" /> — pas semantique.
LOW       :87   - prose max-w-none enleve la limite de longueur de ligne (~65 caracteres recommandes).
```

### src/app/(parcours)/[parcours]/apprendre/[moduleId]/[activityId]/activity-client.tsx

```
MEDIUM    :107  - Couleurs hardcodees (bg-green-100, text-green-600, bg-green-950/30) au lieu des tokens semantiques --success. Repete dans tout le composant.
LOW       :159  - Bouton "J'ai compris" : pas de feedback de loading pendant l'appel async completeExercise.
```

### src/app/(parcours)/[parcours]/reviser/reviser-client.tsx

```
MEDIUM    :68   - Icones Trophy, GraduationCap, Check dans les stats cards sans aria-hidden="true".
MEDIUM    :170  - Concatenation de classes dynamiques avec template literals au lieu de cn() — fragile et peut produire des classes invalides.
LOW       :208  - Clock icon (h-3 w-3) potentiellement trop petit pour l'accessibilite (12x12px, sous le minimum 16px recommande pour les icones informatives).
```

### src/app/(parcours)/[parcours]/reviser/serie/[id]/layout.tsx

```
HIGH      :31   - Hauteur h-[calc(100vh-3.5rem)] utilise vh au lieu de svh/dvh — sur iOS Safari avec la barre d'adresse, le contenu deborde. Utiliser 100svh ou 100dvh.
MEDIUM    :43   - <main> sans id="main-content" — le skip-to-content du root layout pointe vers un element qui n'existe pas dans ce contexte.
```

### src/app/(parcours)/[parcours]/reviser/serie/[id]/play/serie-player.tsx

```
HIGH      :53   - h-[calc(100vh-3.5rem)] repete 3 fois (lignes 53, 151, 193) — vh au lieu de svh/dvh, meme probleme iOS.
HIGH      :115  - setTimeout de 2 secondes apres QCM completion pour auto-avancer — aucun indicateur visuel du delai, pas d'option pour annuler. UX confuse : l'utilisateur ne comprend pas pourquoi rien ne se passe pendant 2 secondes.
MEDIUM    :241  - Bouton "J'ai compris" sans disabled state pendant l'appel async — double-click possible.
LOW       :252  - Bouton "Precedent" disabled sans tooltip expliquant pourquoi (premiere activite).
```

### src/app/(parcours)/[parcours]/reviser/serie/[id]/[activityId]/page.tsx

```
LOW       :101  - <div /> spacer (meme pattern que activity page).
```

### src/app/(parcours)/[parcours]/reviser/serie/[id]/[activityId]/serie-activity-client.tsx

```
MEDIUM    :105  - Couleurs hardcodees (green-200, green-50, green-800, green-950/20) au lieu de tokens semantiques.
LOW       :134  - Bouton "J'ai compris" sans loading state (meme issue que activity-client).
```

### src/app/(parcours)/[parcours]/reviser/serie/[id]/result/page.tsx

```
MEDIUM    :35   - Couleurs hardcodees (bg-green-100, text-green-600) au lieu de tokens semantiques (--success).
LOW       :76   - Guest CTA section pourrait etre plus proeminente pour les utilisateurs non connectes.
```

### src/app/(parcours)/[parcours]/apprendre/[moduleId]/loading.tsx

```
LOW       :3    - Loading state en texte "Chargement..." sans spinner ni skeleton — inconsistant avec les autres loading.tsx qui utilisent des Skeleton.
```

### src/app/(parcours)/[parcours]/reviser/serie/[id]/loading.tsx

```
LOW       :3    - Meme probleme : texte "Chargement..." sans skeleton — inconsistant avec reviser/loading.tsx et apprendre/loading.tsx qui ont des skeletons.
```

### src/app/admin/content/page.tsx

```
HIGH      :130  - Layout grid-cols-[380px_1fr] pas responsive sous md — la page est inutilisable sur mobile.
MEDIUM    :116  - h-[calc(100svh-3.25rem)] : bon usage de svh, mais la valeur magique 3.25rem devrait etre une CSS variable.
```

### src/app/admin/content/atom-filters.tsx

```
HIGH      :98   - Tag buttons : <button> wrapper autour d'un <Badge> sans minimum touch target (44x44px). Sur mobile, les tags sont trop petits pour etre tapes.
MEDIUM    :72   - Input de recherche sans icone Search et sans label visible — utiliser un placeholder ne remplace pas un label.
MEDIUM    :71   - Opacity 0.7 pendant isPending : pas de cursor change (wait/progress) pour indiquer le chargement.
```

### src/app/admin/content/atom-list.tsx

```
MEDIUM    :50   - Items de la liste avec padding py-1.5 (6px) — touch targets bien en dessous de 44px sur mobile.
LOW       :56   - Indicateur orphelin (point orange) sans label textuel — information conveyed seulement par couleur.
```

### src/app/admin/content/atom-preview.tsx

```
LOW       :31   - Font mono pour l'ID d'atome sans overflow handling — IDs longs pourraient deborder.
```

### src/app/admin/layout.tsx

```
LOW       :15   - Header admin sans navigation retour vers l'app principale.
```

### src/components/landing-header.tsx

```
MEDIUM    :38   - Avatar dans l'etat authentifie : cursor-pointer manquant — l'avatar n'est pas cliquable mais ressemble a un element interactif.
LOW       :25   - Pas de landmark <nav> explicite dans le header.
```

### src/components/site-header.tsx

```
LOW       :38   - Classe CSS utilise h-(--header-height) syntaxe Tailwind v4 — correcte pour ce projet mais attention a la compatibilite.
```

### src/components/parcours-banner.tsx

```
LOW       :42   - Alert avec classes hardcodees (border-blue-200, bg-blue-50) au lieu de tokens — coherent avec le design system Alert mais non semantique.
```

### src/components/app-sidebar.tsx

```
LOW       :69   - "Tableau de bord" utilise comme label — fixe depuis le dernier audit. OK.
```

### src/components/nav-user.tsx

```
LOW       :142  - Icons dans DropdownMenuItem utilisent mr-2 h-4 w-4 inline — devrait utiliser aria-hidden="true" sur les icones decoratives.
```

### src/components/profile-sheet.tsx

```
HIGH      :66   - SheetContent sans SheetDescription obligatoire — shadcn/radix genere un warning dans la console. SheetDescription est present dans GuestContent mais pas dans AuthenticatedContent (via SheetHeader).
MEDIUM    :245  - Couleurs hardcodees repandues dans StatsTab (bg-green-100, bg-blue-100, bg-amber-100, bg-purple-100) — devrait utiliser des tokens semantiques.
MEDIUM    :396  - Theme toggle boutons : pas de feedback visuel du theme "system" — l'utilisateur ne sait pas quel est le mode actif si le theme est "system".
LOW       :155  - Bouton logout aria-label="Se deconnecter" present — fixe depuis le dernier audit.
```

### src/components/course-timeline.tsx

```
HIGH      :613  - Bouton mobile fixed (left-4 top-4 z-50) chevauche potentiellement le SiteHeader qui a aussi une hauteur fixe. Sur mobile avec le sidebar de l'app, deux elements se superposent.
MEDIUM    :295  - text-[13px] pour les titres d'activites — en dessous du minimum 16px recommande pour mobile. Difficile a lire sur petits ecrans.
MEDIUM    :306  - text-[11px] pour les meta-donnees — 11px est definitivement trop petit pour du texte fonctionnel sur mobile.
MEDIUM    :623  - Sheet mobile fixe a w-80 (320px) — sur ecrans de 375px ne laisse que 55px visibles du contenu derriere le sheet.
LOW       :279  - Boutons d'activite dans la timeline ont cursor-pointer implicite via <button>, correct.
```

### src/components/patterns/qcm-player.tsx

```
HIGH      :77   - useEffect keyboard handler avec closure stale : handleValidate et handleNext sont referees mais pas dans le dependency array. Peut causer des bugs de score.
HIGH      :211  - Boutons option QCM : focus-visible:ring-2 present dans className, mais la combinaison avec les couleurs de fond validees (green, red) pourrait rendre le focus ring invisible. Tester le contraste.
MEDIUM    :253  - <kbd> cache sur mobile (hidden sm:inline-block) — correct, mais les raccourcis clavier pourraient etre annonces via sr-only pour les utilisateurs clavier.
MEDIUM    :274  - Score en bas "Score: X/Y" change sans aria-live="polite" — deja present (ligne 274, aria-live="polite"). Fixe.
LOW       :200  - ContentRenderer pour les enonces : si le HTML contient des images, elles n'auront pas de lazy loading ni de optimisation next/image.
```

### src/components/patterns/scan-upload.tsx

```
HIGH      :166  - <img> brut au lieu de next/image pour la preview — pas d'optimisation, pas de dimensions reservees (content jumping pendant le chargement).
MEDIUM    :213  - Drop zone non accessible au clavier — pas de tabIndex, pas de onKeyDown pour declencher le file picker.
LOW       :172  - animate-spin respecte prefers-reduced-motion grace au CSS global. OK.
```

### src/components/patterns/activity-content.tsx

```
MEDIUM    :39   - <summary> dans CollapsibleSection : focus ring potentiellement invisible sur fonds colores (amber, green). Ajouter un focus-visible ring avec une couleur contrastante.
```

### src/components/content/exercise-parts.tsx

```
MEDIUM    :27   - <summary> elements : focus ring invisible sur fonds colores (green-50, blue-50, amber-50, red-50). Le focus ring par defaut est souvent noir/transparent et disparait sur ces fonds. Ajouter focus-visible:outline-2 focus-visible:outline-offset-2 avec une couleur contrastante.
```

### src/components/content/lesson-parts.tsx

```
LOW       :31   - Aside elements avec border-indigo-200/violet/sky/etc : bon usage de aria-hidden sur les icones, semantique correcte avec <aside>.
```

### src/components/content/mdx-components.tsx

```
LOW       -     - Registry correct, pas de problemes UI/UX.
```

### src/components/content/qcm-parts.tsx

```
LOW       -     - Composants data-carrier rendant null. Pas de probleme UI/UX.
```

### src/components/patterns/command-menu.tsx

```
MEDIUM    :29   - Navigation items hardcodes sans parcours prefix — les URLs "/apprendre" et "/reviser" sont fausses, devraient etre "/{parcours}/apprendre" etc.
LOW       :88   - Icones dans CommandItem utilisent mr-2 h-4 w-4 — ajouter aria-hidden="true".
```

### src/components/patterns/module-card.tsx

```
LOW       :43   - Image avec next/image et alt={title} : correct.
LOW       :50   - Placeholder BookOpen sans alt text — decoratif, OK avec aria-hidden implicite du parent div.
```

### src/components/patterns/activity-card.tsx

```
LOW       :92   - Circle icon pour status "available" et "in_progress" : utilisee comme indicateur visuel, aria-hidden implicite. OK.
```

### src/components/ui/interactive-card.tsx

```
LOW       -     - Bien implemente : role="button", tabIndex, onKeyDown, aria-disabled, cursor-pointer, focus-visible ring. Resolution du CRITICAL #1 de l'audit precedent.
```

### src/app/globals.css

```
LOW       :155  - prefers-reduced-motion present et correct. Resolution du HIGH #5 de l'audit precedent.
```

### Fichiers OK

```
src/app/layout.tsx                                          OK  (skip-to-content, Toaster, font-serif, viewport)
src/app/(landing)/layout.tsx                                OK  (ThemeProvider wrapper)
src/app/login/page.tsx                                      OK
src/app/signup/page.tsx                                     OK
src/app/(parcours)/[parcours]/apprendre/loading.tsx         OK  (skeleton)
src/app/(parcours)/[parcours]/reviser/loading.tsx           OK  (skeleton)
src/app/(parcours)/[parcours]/reviser/page.tsx              OK
src/app/(parcours)/[parcours]/reviser/serie/[id]/page.tsx   OK
src/app/(parcours)/[parcours]/reviser/serie/[id]/play/page.tsx  OK  (server component, no UI issues)
src/components/nav-apprendre.tsx                            OK  (aria-hidden, aria-label correct)
src/app/(parcours)/[parcours]/apprendre/[moduleId]/course-timeline-wrapper.tsx  OK  (client wrapper, no UI)
src/app/(parcours)/[parcours]/reviser/serie/[id]/serie-timeline-wrapper.tsx     OK  (client wrapper, no UI)
src/components/ui/field.tsx                                 OK  (shadcn component, well-structured)
src/app/globals.css                                         OK  (reduced-motion, tokens)
src/components/content/lesson-parts.tsx                     OK
src/components/content/qcm-parts.tsx                        OK
src/components/content/mdx-components.tsx                   OK
```

---

## Resume par severite

### CRITICAL (a corriger immediatement)

Aucun issue CRITICAL restant. Les 4 CRITICAL du precedent audit ont tous ete corriges :
- InteractiveCard cree et adopte
- Toaster ajoute au root layout
- font-serif mappe dans globals.css
- aria-label ajoute au bouton logout

### HIGH (a corriger rapidement)

| # | Issue | Fichier(s) |
|---|-------|------------|
| 1 | `100vh` au lieu de `100svh`/`100dvh` — debordement iOS Safari | `reviser/serie/[id]/layout.tsx:31`, `serie-player.tsx:53,151,193` |
| 2 | Bouton timeline mobile fixed chevauche le SiteHeader | `course-timeline.tsx:613` |
| 3 | useEffect keyboard handler closure stale dans QCM player | `qcm-player.tsx:77` |
| 4 | Tag buttons admin touch targets < 44px | `atom-filters.tsx:98` |
| 5 | Admin page non responsive sous md breakpoint | `admin/content/page.tsx:130` |
| 6 | `<img>` brut au lieu de next/image dans scan-upload | `scan-upload.tsx:166` |
| 7 | setTimeout 2s auto-advance sans indicateur visuel | `serie-player.tsx:115` |
| 8 | Cards parcours dashboard sans cursor-pointer | `[parcours]/page.tsx:54` |
| 9 | SheetContent sans SheetDescription dans AuthenticatedContent | `profile-sheet.tsx:66` |
| 10 | QCM option buttons focus-visible ring potentiellement invisible | `qcm-player.tsx:211` |
| 11 | Landing parcours cards non entierement cliquables | `(landing)/page.tsx:111` |
| 12 | Serie layout : vh au lieu de svh | `reviser/serie/[id]/layout.tsx:31` |

### MEDIUM (amelioration notable)

| # | Issue | Fichier(s) |
|---|-------|------------|
| 1 | Couleurs hardcodees au lieu de tokens semantiques | `activity-client.tsx`, `serie-activity-client.tsx`, `result/page.tsx`, `profile-sheet.tsx`, `reviser-client.tsx` |
| 2 | `<main>` potentiellement imbriques | `[moduleId]/layout.tsx:50` + `[parcours]/layout.tsx:49` |
| 3 | text-[11px] et text-[13px] sous le minimum 16px mobile | `course-timeline.tsx:295,306` |
| 4 | Sheet mobile w-80 sur ecrans < 375px | `course-timeline.tsx:623` |
| 5 | Command menu URLs sans parcours prefix | `command-menu.tsx:29` |
| 6 | Summary focus ring invisible sur fonds colores | `exercise-parts.tsx:27`, `activity-content.tsx:39` |
| 7 | Drop zone scan-upload non accessible clavier | `scan-upload.tsx:213` |
| 8 | Icones stats sans aria-hidden | `reviser-client.tsx:68` |
| 9 | Input recherche admin sans label | `atom-filters.tsx:72` |
| 10 | Atom list items touch targets < 44px | `atom-list.tsx:50` |
| 11 | BookOpen icon sans aria-hidden dans module detail | `[moduleId]/page.tsx:56` |
| 12 | Theme toggle sans option "system" | `profile-sheet.tsx:396` |

---

## Quick Wins (< 5 min chacun)

1. **Remplacer `100vh` par `100svh`** dans `serie/[id]/layout.tsx:31` et `serie-player.tsx` (lignes 53, 151, 193) — changement de 4 occurrences d'une string.

2. **Ajouter `cursor-pointer` aux cards navigation** dans `[parcours]/page.tsx:54,70` — ajouter la classe directement sur le `<Card>`.

3. **Ajouter `aria-hidden="true"` aux icones decoratives** dans `reviser-client.tsx` (Trophy, GraduationCap, Check aux lignes 68, 79, 90) et `[moduleId]/page.tsx:56` (BookOpen).

4. **Ajouter SheetDescription dans AuthenticatedContent** dans `profile-sheet.tsx` — ajouter `<SheetDescription className="sr-only">Votre profil et parametres</SheetDescription>` apres le SheetTitle.

5. **Fixer les URLs du command-menu** dans `command-menu.tsx:29-44` — recevoir le parcours en prop et prefixer les URLs.

6. **Ajouter `min-h-[44px]`** aux tag buttons dans `atom-filters.tsx:98` pour respecter les touch targets.

7. **Ajouter un label accessible** a l'Input de recherche admin dans `atom-filters.tsx:72` — `<Label htmlFor="search" className="sr-only">Rechercher</Label>`.

---

## Recommandations architecturales

### A. Standardiser l'usage de svh/dvh

Toutes les valeurs `calc(100vh - ...)` dans le codebase devraient etre remplacees par `calc(100svh - ...)` pour le support iOS Safari. La variable CSS `--header-height` est correctement definie dans globals.css — l'utiliser systematiquement au lieu de valeurs magiques (`3.5rem`, `3.25rem`).

```tsx
// Avant
<div className="h-[calc(100vh-3.5rem)]">

// Apres
<div className="h-[calc(100svh-var(--header-height))]">
```

### B. Extraire les couleurs hardcodees vers des tokens

Le codebase utilise extensivement des couleurs Tailwind directes (green-100, green-600, blue-100, etc.) pour les etats de succes, erreur, info. Les tokens `--success`, `--info`, `--warning` existent deja dans globals.css mais ne sont pas utilises dans les composants. Migrer progressivement :

```tsx
// Avant
<div className="bg-green-100 dark:bg-green-900/30">
  <Check className="text-green-600" />
</div>

// Apres
<div className="bg-success/10">
  <Check className="text-success" />
</div>
```

Fichiers concernes : `activity-client.tsx`, `serie-activity-client.tsx`, `serie-player.tsx`, `result/page.tsx`, `reviser-client.tsx`, `profile-sheet.tsx` (StatsTab).

### C. Corriger le conflit de `<main>` imbrique

Le parcours layout (`[parcours]/layout.tsx:49`) definit un `<div id="main-content">` et le module layout (`[moduleId]/layout.tsx:50`) definit un `<main>`. Le skip-to-content dans le root layout pointe vers `#main-content`. Solution :

```tsx
// [moduleId]/layout.tsx - remplacer <main> par <div>
<div role="main" className="flex-1 overflow-auto">{children}</div>
```

Ou mieux : s'assurer qu'un seul `<main>` existe dans toute la hierarchie de layouts.

### D. Fixer la closure stale du QCM Player

Le useEffect du keyboard handler (ligne 77-103) depend de `handleValidate` et `handleNext` mais ces fonctions ne sont pas dans le dependency array ni memoizees avec useCallback. Solution :

```tsx
const handleValidate = React.useCallback(() => {
  if (selectedOption === null || !currentQuestion) return
  const isCorrect = selectedOption === currentQuestion.correctIndex
  if (isCorrect) setScore((s) => s + 1)
  setAnswers((a) => [...a, selectedOption])
  setState('validated')
}, [selectedOption, currentQuestion])

const handleNext = React.useCallback(() => {
  // ...
}, [isLastQuestion, score, selectedOption, currentQuestion, answers, startTime, qcm, onComplete])
```

### E. Ameliorer le feedback du timer auto-advance

Dans `serie-player.tsx:115`, le `setTimeout(2000)` apres completion du QCM est invisible pour l'utilisateur. Ajouter un compte a rebours visuel :

```tsx
// Ajouter un state pour le countdown
const [countdown, setCountdown] = React.useState<number | null>(null)

// Dans handleQCMComplete :
setCountdown(3)
const interval = setInterval(() => {
  setCountdown(prev => {
    if (prev === null || prev <= 1) {
      clearInterval(interval)
      // advance
      return null
    }
    return prev - 1
  })
}, 1000)

// Dans le JSX :
{countdown !== null && (
  <p className="text-sm text-muted-foreground">
    Passage a l'activite suivante dans {countdown}s...
  </p>
)}
```

### F. Rendre l'admin responsive

La page admin (`admin/content/page.tsx`) utilise un `grid-cols-[380px_1fr]` qui casse sous 768px. Solution : stack vertical sur mobile avec tabs ou accordion au lieu du split panel.

```tsx
<div className="grid flex-1 grid-cols-1 overflow-hidden md:grid-cols-[380px_1fr]">
  {/* Sur mobile : montrer filters + list en plein ecran */}
  {/* Sur desktop : split view comme actuellement */}
</div>
```

La preview pourrait etre deplacee dans un Sheet/Drawer sur mobile.
