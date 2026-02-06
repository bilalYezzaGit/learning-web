# Audit 1 — Web Interface Guidelines

Date : 2026-02-06
Source : vercel-labs/web-interface-guidelines

---

## Problemes transversaux (toute l'app)

1. **Pas de skip link** — `src/app/layout.tsx:46` — pas de `<a href="#main-content">` pour la navigation clavier
2. **`aria-hidden="true"` manquant sur les icones Lucide** — quasiment partout. Les SVG sont annonces par les lecteurs d'ecran
3. **Pas de `prefers-reduced-motion`** — aucune animation n'est gatee derriere la preference utilisateur
4. **`aria-live="polite"` absent** — les mises a jour dynamiques (erreurs, loading, scores) ne sont jamais annoncees
5. **`text-balance` manquant** sur les headings (`<h1>`, `<h2>`)

---

## src/components/login-form.tsx

```
:80  - email input missing autocomplete="email"
:80  - email input missing spellCheck={false}
:93  - password input missing autocomplete="current-password"
:72  - error div missing aria-live="polite" and role="alert"
:102 - "Connexion..." → "Connexion…" (ellipsis char)
:119 - Google SVG icon missing aria-hidden="true"
```

## src/components/signup-form.tsx

```
:104 - email input missing autocomplete="email" and spellCheck={false}
:117 - password input missing autocomplete="new-password"
:128 - confirm-password input missing autocomplete="new-password"
:96  - error div missing aria-live="polite" and role="alert"
:96  - errors not inline next to fields; first error field not focused on submit
:160 - "Creation..." → "Creation…"
:176 - Google SVG icon missing aria-hidden="true"
```

## src/app/select-parcours/page.tsx

```
:59  - <Card> with onClick is a div acting as button — needs role="button", tabIndex, onKeyDown
:41  - "Chargement..." → "Chargement…"
:52  - <h1> missing text-balance
```

## src/app/(landing)/page.tsx

```
:29  - <h1> missing text-balance
:54  - <h2> missing text-balance
:104 - <h2> missing text-balance
:135 - <h2> missing text-balance
:63  - BookOpen icon missing aria-hidden="true"
:75  - Brain icon missing aria-hidden="true"
:87  - BarChart3 icon missing aria-hidden="true"
```

## src/components/course-timeline.tsx

```
:280 - transition-all on ActivityItem button
:276 - ActivityItem <button> missing focus-visible:ring-*
:457 - transition-all on CollapsibleContent
:229 - Check icon missing aria-hidden="true"
:623 - SheetContent missing overscroll-behavior: contain
```

## src/components/patterns/activity-card.tsx

```
:54  - <Card> with onClick is a div — should be <button> or role="button"
:56  - transition-all anti-pattern
:54  - no focus-visible:ring-* on clickable card
:70  - decorative icons missing aria-hidden="true"
```

## src/components/patterns/module-card.tsx

```
:31  - <Card> with onClick is a div — needs role="button", tabIndex, onKeyDown
:31  - no focus-visible:ring-* on clickable card
:71  - progress % missing tabular-nums
```

## src/components/patterns/qcm-player.tsx

```
:211 - option <button> elements missing focus-visible:ring-*
:191 - progress fraction missing tabular-nums
:275 - score display missing tabular-nums
:262 - explanation after validation missing aria-live="polite"
```

## src/components/patterns/scan-upload.tsx

```
:202 - <input type="file"> missing accessible label
:167 - <img> preview missing explicit width/height
:212 - drop zone <div> with onDrop has no keyboard accessibility
:172 - animate-spin doesn't honor prefers-reduced-motion
:161 - analyzing state missing aria-live="polite"
```

## src/components/profile-sheet.tsx

```
:155 - icon-only LogOut <Button> missing aria-label
:66  - SheetContent missing overscroll-behavior: contain
:249 - stat values missing tabular-nums
```

## src/components/nav-apprendre.tsx

```
:48  - ChevronRight icon button missing aria-label
```

## src/components/content/exercise-parts.tsx

```
:28  - CheckCircle icon missing aria-hidden="true"
:42  - BookOpen icon missing aria-hidden="true"
:55  - Lightbulb icon missing aria-hidden="true"
:69  - AlertTriangle icon missing aria-hidden="true"
```

## Fichiers OK

```
src/app/(landing)/layout.tsx                                    ✓ pass
src/app/(parcours)/[parcours]/apprendre/[moduleId]/layout.tsx   ✓ pass
src/app/(parcours)/[parcours]/reviser/serie/[id]/layout.tsx     ✓ pass
src/app/admin/layout.tsx                                        ✓ pass
```

---

## Top 3 chantiers

1. **`aria-hidden="true"` sur toutes les icones Lucide** — ~30 fichiers, mecanique
2. **Formulaires auth** — `autocomplete`, `aria-live`, `role="alert"`
3. **Cards cliquables** — remplacer `<div onClick>` par `<button>` ou `role="button"` + `tabIndex` + `onKeyDown`
