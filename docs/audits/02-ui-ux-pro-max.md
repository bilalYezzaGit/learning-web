# Audit 2 — UI/UX Pro Max

Date : 2026-02-06
Source : skill ui-ux-pro-max (design intelligence)

---

## Methodologie

29 fichiers audites contre les criteres UI/UX Pro Max : accessibilite, touch & interaction, performance, layout & responsive, typographie & couleur, animation. Scripts de recherche utilises pour confirmer les recommandations cles pour une app education.

---

## Issues par fichier

### src/app/layout.tsx

```
CRITICAL  :49  - <Toaster /> absent du root layout — tous les toast() sont silencieusement ignores
CRITICAL  :13  - font-serif CSS variable non mappee — Source Serif 4 charge mais jamais wire dans @theme
MEDIUM    :46  - <html> manque suppressHydrationWarning pour next-themes
```

### src/app/globals.css

```
HIGH      -    - Zero prefers-reduced-motion dans tout le codebase
MEDIUM    :10  - --font-serif manquant dans @theme inline
LOW       :129 - Pas de line-height explicite pour le body (Tailwind default 1.5 OK mais 1.625 serait mieux)
```

### src/app/(landing)/page.tsx

```
HIGH      :60  - Feature cards sans cursor-pointer (visuellement cliquables mais non interactifs)
HIGH      :111 - Parcours cards : cursor-pointer uniquement sur le Button interne, pas sur le Card
MEDIUM    :151 - Footer links sans focus-visible explicite
LOW       :29  - text-4xl sur mobile (36px) potentiellement grand pour 375px
```

### src/app/select-parcours/page.tsx

```
CRITICAL  :59  - <Card onClick> sans role="button", tabIndex, onKeyDown — keyboard users bloques
HIGH      :23  - Pas de loading/disabled state pendant l'appel async setParcours
MEDIUM    :40  - Loading state en texte brut au lieu de skeleton/spinner
LOW       :69  - Button "Choisir" redondant dans un card deja cliquable
```

### src/components/login-form.tsx

```
HIGH      :63  - Formulaire brut sans shadcn Form + react-hook-form (pas de aria-describedby auto)
HIGH      :72  - Erreur dans un <div> generique sans role="alert" ni aria-live
MEDIUM    :119 - SVG Google inline au lieu d'une icone du set Lucide (exception a documenter)
LOW       :102 - Texte "Connexion..." sans spinner icon
```

### src/components/signup-form.tsx

```
HIGH      :87  - Meme probleme formulaire brut que login-form
HIGH      :96  - Erreur sans role="alert" / aria-live
HIGH      :148 - RadioGroup touch targets potentiellement < 44x44px sur mobile
MEDIUM    :45  - Validation mot de passe n'affiche qu'une seule erreur a la fois
MEDIUM    :136 - Pas d'indicateur de force du mot de passe
```

### src/app/(parcours)/[parcours]/page.tsx

```
HIGH      :54  - Cards "Apprendre"/"Reviser" sans cursor-pointer sur le Card body
LOW       :55  - Cards sans aria-label descriptif
```

### src/app/(parcours)/[parcours]/layout.tsx

```
LOW       :48  - 3 niveaux de flex imbriques — fonctionnel mais fragile pour les edge cases overflow
```

### src/app/(parcours)/[parcours]/apprendre/page.tsx

```
MEDIUM    :59  - Icone BookOpen decorative sans aria-hidden="true" dans l'empty state
```

### src/app/(parcours)/[parcours]/apprendre/[moduleId]/layout.tsx

```
MEDIUM    :50  - <main> sans aria-label dans le split layout
```

### src/app/(parcours)/[parcours]/apprendre/[moduleId]/[activityId]/page.tsx

```
MEDIUM    :105 - <div /> spacer — <span aria-hidden="true" /> serait plus semantique
LOW       :87  - max-w-none sur prose enleve la limite de line-length (~65ch)
```

### src/app/(parcours)/[parcours]/reviser/serie/[id]/result/page.tsx

```
MEDIUM    :35  - Couleurs hardcodees (bg-green-100, text-green-600) au lieu de tokens semantiques
```

### src/app/admin/content/page.tsx

```
HIGH      :130 - Page admin non responsive sous md breakpoint
MEDIUM    :118 - Badges stats en flex sans flex-wrap — overflow horizontal sur ecrans etroits
```

### src/components/landing-header.tsx

```
MEDIUM    -    - Pas de "Skip to content" link
```

### src/components/app-sidebar.tsx

```
LOW       :68  - "Dashboard" en anglais au milieu d'une UI francaise — devrait etre "Tableau de bord"
```

### src/components/profile-sheet.tsx

```
CRITICAL  :155 - Bouton logout icon-only sans aria-label ni sr-only
HIGH      :245 - Couleurs hardcodees (bg-green-100 etc.) au lieu de tokens semantiques
MEDIUM    :162 - Changement d'onglet sans aria-live pour annoncer le nouveau contenu
```

### src/components/course-timeline.tsx

```
HIGH      :613 - Bouton fixed mobile (top-4) chevauche potentiellement le SiteHeader
HIGH      :355 - [&>svg] child selectors fragiles pour override taille SVG
MEDIUM    :295 - text-[13px] (~0.8rem) potentiellement sous le minimum 16px pour mobile
MEDIUM    :623 - Sheet fixe a w-80 (320px) — sur ecrans < 375px ne laisse que 55px
```

### src/components/patterns/module-card.tsx

```
CRITICAL  :31  - <Card onClick> sans keyboard accessibility (role, tabIndex, onKeyDown)
```

### src/components/patterns/activity-card.tsx

```
CRITICAL  :54  - <Card onClick> sans keyboard accessibility
MEDIUM    :60  - Etat locked sans aria-disabled="true"
```

### src/components/patterns/qcm-player.tsx

```
HIGH      :77  - useEffect keyboard handler avec closure stale potentielle (handleValidate hors deps)
HIGH      :211 - Boutons option sans focus-visible:ring explicite
MEDIUM    :274 - Score "X/Y" change sans aria-live — non annonce aux screen readers
```

### src/components/patterns/scan-upload.tsx

```
HIGH      :167 - <img> brut au lieu de next/image
MEDIUM    :212 - Drop zone sans accessibilite clavier (tabIndex, onKeyDown)
MEDIUM    :172 - animate-spin sans prefers-reduced-motion
```

### src/components/content/exercise-parts.tsx

```
HIGH      :27  - <summary> focus ring potentiellement invisible sur fonds colores
```

### Fichiers OK

```
src/app/login/page.tsx                    ✓ pass
src/app/signup/page.tsx                   ✓ pass
src/app/(parcours)/[parcours]/reviser/page.tsx              ✓ pass
src/app/(parcours)/[parcours]/reviser/serie/[id]/page.tsx   ✓ pass
src/app/(parcours)/[parcours]/reviser/serie/[id]/play/page.tsx  ✓ pass
src/components/nav-apprendre.tsx          ✓ pass
```

---

## Resume par severite

### CRITICAL (a corriger immediatement)

| # | Issue | Fichier(s) |
|---|-------|------------|
| 1 | `<Card onClick>` divs sans accessibilite clavier | `select-parcours/page.tsx:59`, `module-card.tsx:31`, `activity-card.tsx:54` |
| 2 | `<Toaster />` absent du root layout | `layout.tsx:49` |
| 3 | `font-serif` CSS variable non mappee | `layout.tsx:13`, `globals.css` |
| 4 | Bouton logout icon-only sans aria-label | `profile-sheet.tsx:155` |

### HIGH (a corriger rapidement)

| # | Issue | Fichier(s) |
|---|-------|------------|
| 5 | Zero `prefers-reduced-motion` dans le codebase | App-wide |
| 6 | Formulaires auth en `<form>` brut sans shadcn Form | `login-form.tsx`, `signup-form.tsx` |
| 7 | Erreurs sans `role="alert"` / `aria-live` | `login-form.tsx:73`, `signup-form.tsx:97` |
| 8 | Bouton mobile fixed chevauche le header | `course-timeline.tsx:613` |
| 9 | QCM boutons option sans focus visible | `qcm-player.tsx:211` |
| 10 | Admin badges overflow ecrans etroits | `admin/content/page.tsx:118` |
| 11 | RadioGroup touch targets trop petits mobile | `signup-form.tsx:148` |
| 12 | `<img>` brut au lieu de next/image | `scan-upload.tsx:167` |

---

## Quick Wins (< 5 min chacun)

1. **Ajouter `<Toaster />` au root layout** — 1 import + 1 ligne JSX
2. **Ajouter `--font-serif` a globals.css** — `--font-serif: var(--font-source-serif), ui-serif, Georgia, serif;`
3. **`aria-label="Se deconnecter"` sur le bouton logout** — 1 attribut dans `profile-sheet.tsx:155`
4. **`role="alert"` sur les divs erreur** — 1 attribut dans `login-form.tsx:73` et `signup-form.tsx:97`
5. **Renommer "Dashboard" en "Tableau de bord"** — 1 string dans `app-sidebar.tsx:68`
6. **`flex-wrap` sur la barre stats admin** — `admin/content/page.tsx:118`
7. **`prefers-reduced-motion` global dans globals.css** :
```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

---

## Recommandations architecturales

### A. Creer un composant `InteractiveCard`

Le pattern `<Card onClick>` sans clavier est repete 3+ fois. Un wrapper reusable resout le CRITICAL #1 :

```tsx
function InteractiveCard({ onClick, children, ...props }) {
  return (
    <Card
      role="button"
      tabIndex={0}
      onClick={onClick}
      onKeyDown={(e) => {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault()
          onClick?.()
        }
      }}
      className="cursor-pointer ..."
      {...props}
    >
      {children}
    </Card>
  )
}
```

### B. Migrer les formulaires auth vers shadcn Form

Remplacer `<form>` + `useState` par `react-hook-form` + shadcn `<Form>` / `<FormField>` / `<FormMessage>`. Fournit automatiquement `aria-describedby`, validation par champ, meilleure inference TypeScript.

### C. Etablir une couche de tokens couleur semantiques

Extraire les 30+ instances de couleurs hardcodees (green/blue/amber/red) dans des CSS variables :

```css
:root {
  --success: oklch(0.6 0.2 145);
  --success-foreground: oklch(0.3 0.1 145);
  --warning: oklch(0.7 0.15 85);
}
```

### D. Ajouter des regions `aria-live` pour le contenu dynamique

Surtout pour le QCM player : annoncer changements de score, transitions de question, resultats de validation.
