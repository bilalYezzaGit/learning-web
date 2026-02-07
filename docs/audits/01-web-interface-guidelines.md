# Audit 1 — Web Interface Guidelines

Date : 2026-02-07
Source : vercel-labs/web-interface-guidelines

---

## Problemes transversaux (toute l'app)

1. **`"..."` au lieu de `"..."`** — `loading.tsx:4`, `profile-sheet.tsx:426` — Utiliser le caractere ellipsis unicode `\u2026` dans les textes de chargement. Certains fichiers utilisent deja `\u2026` (login-form, select-parcours) mais d'autres non.
2. **`transition-colors` sans liste explicite** — ~15 fichiers — `transition-colors` est acceptable mais certains fichiers utilisent `transition-shadow` ou `transition-[shadow,border-color]` de maniere heterogene. Verifier la coherence.
3. **Pas de `color-scheme: dark` sur `<html>`** — `src/app/layout.tsx:47` — L'element `<html>` n'a pas `color-scheme: dark` quand le theme sombre est actif ; necessaire pour les scrollbars natifs et inputs en dark mode.
4. **Pas de `<link rel="preconnect">` pour Firebase/CDN** — `src/app/layout.tsx` — Aucun preconnect declare pour les domaines Firebase (firestore, auth).
5. **Pas de `touch-action: manipulation` global** — Aucun fichier ne declare cette propriete pour eliminer le delai de double-tap sur mobile.
6. **Dates rendues avec `new Date().getFullYear()`** — `src/app/(landing)/page.tsx:158` — Risque de mismatch d'hydratation serveur/client (le serveur peut etre dans un fuseau different). Utiliser `suppressHydrationWarning` ou `Intl.DateTimeFormat`.
7. **Decorative icons sans `aria-hidden="true"` dans les stats** — `reviser-client.tsx:68-90`, `profile-sheet.tsx:245-295` — Les icones dans les cards de stats (Trophy, GraduationCap, Check, BookOpen, etc.) n'ont pas `aria-hidden="true"`.
8. **Pas de `font-display: swap` explicite** — Les polices Google (Inter, Source_Serif_4) sont chargees via `next/font` qui gere cela, mais aucun `<link rel="preload" as="font">` n'est present pour les polices critiques.

---

## src/app/layout.tsx

```
:47 - <html> manque color-scheme: dark quand theme sombre actif
:47 - suppressHydrationWarning present mais pas pour le bon cas (theme OK, mais pas de preconnect)
```

## src/app/(landing)/page.tsx

```
:151 - transition-colors sur les liens footer sans hover state explicite visible (OK mais borderline)
:158 - new Date().getFullYear() risque hydration mismatch serveur/client
:40  - ArrowRight dans <Button> sans aria-hidden="true" (decoratif)
:120 - ArrowRight dans <Button> sans aria-hidden="true"
```

## src/app/select-parcours/page.tsx

```
:62  - transition-[shadow,border-color] sur InteractiveCard : OK mais verifier que transform-origin est correct
:70  - <Button variant="link"> imbriqué dans InteractiveCard (bouton dans bouton) - probleme de nesting semantique
```

## src/app/(parcours)/[parcours]/page.tsx

```
:30  - BookOpen icon manque aria-hidden="true"
:45  - ArrowRight icon dans Button sans aria-hidden="true"
:54  - Card avec transition-colors mais pas hover: state explicite sur le lien wrapper — le <Link> wrapping Card est bon mais la Card devrait avoir la semantique complete
:59  - BookOpen icon manque aria-hidden="true"
:75  - Brain icon manque aria-hidden="true"
```

## src/app/(parcours)/[parcours]/apprendre/[moduleId]/page.tsx

```
:57  - BookOpen icon dans le welcome manque aria-hidden="true"
:68  - Target icon manque aria-hidden="true"
```

## src/app/(parcours)/[parcours]/apprendre/[moduleId]/loading.tsx

```
:4   - "Chargement..." devrait etre "Chargement\u2026" (ellipsis unicode)
```

## src/app/(parcours)/[parcours]/apprendre/[moduleId]/[activityId]/activity-client.tsx

```
:109 - CheckCircle2 icon manque aria-hidden="true"
:150 - CheckCircle2 icon manque aria-hidden="true"
:160 - CheckCircle2 icon dans Button manque aria-hidden="true"
```

## src/app/(parcours)/[parcours]/reviser/reviser-client.tsx

```
:68  - Trophy icon manque aria-hidden="true"
:79  - GraduationCap icon manque aria-hidden="true"
:90  - Check icon manque aria-hidden="true"
:177 - Check icon manque aria-hidden="true"
:179 - RotateCcw icon manque aria-hidden="true"
:181 - GraduationCap icon manque aria-hidden="true"
:209 - Clock icon manque aria-hidden="true"
:223 - ChevronRight icon manque aria-hidden="true"
```

## src/app/(parcours)/[parcours]/reviser/serie/[id]/page.tsx

```
:49  - BookOpen icon manque aria-hidden="true"
```

## src/app/(parcours)/[parcours]/reviser/serie/[id]/loading.tsx

```
:4   - "Chargement..." devrait etre "Chargement\u2026"
```

## src/app/(parcours)/[parcours]/reviser/serie/[id]/play/serie-player.tsx

```
:219 - CheckCircle2 icon manque aria-hidden="true"
:237 - CheckCircle2 icon manque aria-hidden="true"
:241 - CheckCircle2 icon dans Button manque aria-hidden="true"
:260 - CheckCircle icon dans Button manque aria-hidden="true"
```

## src/app/(parcours)/[parcours]/reviser/serie/[id]/[activityId]/serie-activity-client.tsx

```
:130 - CheckCircle2 icon manque aria-hidden="true"
:134 - CheckCircle2 icon dans Button manque aria-hidden="true"
```

## src/app/(parcours)/[parcours]/reviser/serie/[id]/result/page.tsx

```
:63  - RotateCcw icon dans Button manque aria-hidden="true"
:69  - Home icon dans Button manque aria-hidden="true"
```

## src/app/admin/content/page.tsx

```
:116 - pas de probleme majeur ; filtres URL-synced (bon)
```

## src/app/admin/content/atom-filters.tsx

```
:72  - Input de recherche manque name="q" pour meilleur autocomplete
:72  - Input de recherche manque aria-label (pas de <label> visible)
:98  - <button> wrappant <Badge> : les tags clickables n'ont pas de focus-visible:ring-*
:98  - <button> tags manquent aria-pressed pour indiquer l'etat actif/inactif
```

## src/app/admin/content/atom-list.tsx

```
:39  - ScrollArea avec hauteur calculee en CSS hardcode (calc(100svh-13rem)) — fragile si le layout change
```

## src/components/login-form.tsx

```
:122 - SVG Google icon a bien aria-hidden="true" : OK
:84  - placeholder "exemple@email.com" ne finit pas par "\u2026" — guideline: placeholders devraient finir par "\u2026"
```

## src/components/signup-form.tsx

```
:108 - placeholder "exemple@email.com" ne finit pas par "\u2026"
:180 - SVG Google icon a bien aria-hidden="true" : OK
```

## src/components/app-sidebar.tsx

```
:44  - BookOpen icon dans logo manque aria-hidden="true"
:67  - Home icon dans SidebarMenuButton : les icones dans les menus sont decoratives, manque aria-hidden="true"
:78  - Brain icon manque aria-hidden="true"
```

## src/components/site-header.tsx

```
:40  - SidebarTrigger : verifier que le composant shadcn a bien un aria-label
```

## src/components/parcours-banner.tsx

```
:43  - Info icon manque aria-hidden="true"
```

## src/components/landing-header.tsx

```
(pas de probleme majeur)
```

## src/components/nav-user.tsx

```
:69  - CircleUser icon manque aria-hidden="true"
:109 - EllipsisVertical icon manque aria-hidden="true"
:141 - CircleUser icon dans DropdownMenuItem — OK (decoratif dans menu)
:145 - Settings icon dans DropdownMenuItem — OK
:149 - LogOut icon dans DropdownMenuItem — OK
```

## src/components/nav-apprendre.tsx

```
(bien fait : aria-label sur CollapsibleTrigger, aria-hidden sur icones)
```

## src/components/profile-sheet.tsx

```
:66  - SheetContent: `overscroll-contain` est present dans className — bon
:155 - icon-only LogOut Button a aria-label="Se deconnecter" : OK mais faute d'accent ("deconnecter" au lieu de "deconnecter")
:245 - CheckCircle icon manque aria-hidden="true"
:259 - GraduationCap icon manque aria-hidden="true"
:273 - BookOpen icon manque aria-hidden="true"
:289 - Trophy icon manque aria-hidden="true"
:426 - "Chargement..." (ligne 426) devrait utiliser "\u2026"
```

## src/components/course-timeline.tsx

```
:229 - Check icon manque aria-hidden="true"
:237 - RotateCcw icon manque aria-hidden="true"
:252 - step index numbers dans <span> sans role approprié
:279 - ActivityItem <button> : transition-colors OK, mais manque focus-visible:ring-* explicite
:280 - pas de focus-visible outline sur le bouton d'activite (il y a outline dans globals.css base mais pas de ring)
:444 - ChevronUp icon manque aria-hidden="true"
:473 - Check icon dans objectives manque aria-hidden="true"
:484 - Gauge icon manque aria-hidden="true"
:489 - Clock icon manque aria-hidden="true"
:502 - ArrowRight icon manque aria-hidden="true"
:623 - SheetContent a overscroll-contain: OK
```

## src/components/patterns/activity-card.tsx

```
(utilise InteractiveCard avec role="button", tabIndex, onKeyDown: OK)
(focus-visible:ring-* herite d'InteractiveCard: OK)
:93  - Circle icon manque aria-hidden="true"
```

## src/components/patterns/activity-content.tsx

```
:40  - <Icon> dans CollapsibleSection manque aria-hidden="true"
```

## src/components/patterns/command-menu.tsx

```
:88  - item.icon (dynamique) manque aria-hidden="true"
:100 - BookOpen icon manque aria-hidden="true"
:104 - GraduationCap icon manque aria-hidden="true"
```

## src/components/patterns/module-card.tsx

```
:43  - <Image> avec fill mais sans explicit width/height — Next.js fill mode ne necessite pas width/height, mais le parent doit avoir des dimensions. Le parent <div> a aspect-video : OK
:51  - BookOpen placeholder icon manque aria-hidden="true"
```

## src/components/patterns/qcm-player.tsx

```
:211 - option buttons ont focus-visible:ring-2: OK
:253 - <kbd> elements sont decoratifs pour les raccourcis clavier — OK
:263 - explication a aria-live="polite": OK
:274 - score a aria-live="polite": OK
:172 - animate-spin sur Loader2 — pas de prefers-reduced-motion specifique (le global CSS le gere)
```

## src/components/patterns/scan-upload.tsx

```
:166 - <img> preview sans explicit width/height (CLS) — utiliser un conteneur a taille fixe ou width/height
:173 - "Analyse en cours..." devrait etre "Analyse en cours\u2026"
:174 - Loader2 animate-spin: prefers-reduced-motion gere globalement, OK
:209 - file input a aria-label: OK
:213 - drop zone <div> avec onDrop pas accessible au clavier — pas de tabIndex ni onKeyDown
:219 - Upload icon manque aria-hidden="true"
```

## Fichiers OK

```
src/app/login/page.tsx                                                  ✓ pass
src/app/signup/page.tsx                                                 ✓ pass
src/app/(landing)/layout.tsx                                            ✓ pass
src/app/(parcours)/[parcours]/apprendre/loading.tsx                     ✓ pass
src/app/(parcours)/[parcours]/apprendre/[moduleId]/layout.tsx           ✓ pass
src/app/(parcours)/[parcours]/apprendre/[moduleId]/course-timeline-wrapper.tsx  ✓ pass
src/app/(parcours)/[parcours]/apprendre/[moduleId]/[activityId]/page.tsx  ✓ pass
src/app/(parcours)/[parcours]/reviser/page.tsx                          ✓ pass
src/app/(parcours)/[parcours]/reviser/loading.tsx                       ✓ pass
src/app/(parcours)/[parcours]/reviser/serie/[id]/layout.tsx             ✓ pass
src/app/(parcours)/[parcours]/reviser/serie/[id]/serie-timeline-wrapper.tsx  ✓ pass
src/app/(parcours)/[parcours]/reviser/serie/[id]/play/page.tsx          ✓ pass
src/app/(parcours)/[parcours]/reviser/serie/[id]/[activityId]/page.tsx  ✓ pass
src/app/admin/layout.tsx                                                ✓ pass
src/app/admin/content/atom-preview.tsx                                  ✓ pass
src/components/landing-header.tsx                                       ✓ pass
src/components/nav-apprendre.tsx                                        ✓ pass
src/components/ui/interactive-card.tsx                                   ✓ pass
src/components/ui/field.tsx                                             ✓ pass
src/components/content/lesson-parts.tsx                                 ✓ pass
src/components/content/exercise-parts.tsx                               ✓ pass
src/components/content/mdx-components.tsx                               ✓ pass
src/components/content/qcm-parts.tsx                                    ✓ pass
```

---

## Top 3 chantiers

1. **`aria-hidden="true"` sur les icones decoratives Lucide** — ~25 fichiers, ~60 occurrences. La plupart des icones dans les boutons, cards et stats sont decoratives et doivent avoir `aria-hidden="true"`. Les fichiers content/ (lesson-parts, exercise-parts) le font deja correctement.
2. **Ellipsis unicode et typographie** — ~5 fichiers. Remplacer `"..."` par `"\u2026"` dans les textes de chargement (loading.tsx x2, scan-upload.tsx, profile-sheet.tsx). Ajouter `"\u2026"` a la fin des placeholders des inputs de recherche.
3. **`color-scheme: dark` + `touch-action: manipulation` + preconnect** — 3 fichiers (layout.tsx, globals.css). Ajouter `color-scheme: dark` sur `<html>` en mode sombre, `touch-action: manipulation` globalement, et des `<link rel="preconnect">` pour les domaines Firebase.
