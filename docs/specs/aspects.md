# UI/UX Aspects

96 atomic rules organized by category. Each aspect = 1 verifiable truth about the UI.

---

## COL — Colors & Theming (15)

### A-COL-001 — Terracotta primary color
Primary color uses OkLCH terracotta hue in both modes.
- Light: `--primary: oklch(0.55 0.11 35)`
- Dark: `--primary: oklch(0.68 0.11 35)`
- **File**: `src/app/globals.css`

### A-COL-002 — Warm sand secondary
Secondary uses warm sand tone, not neutral gray.
- Light: `--secondary: oklch(0.94 0.015 80)`
- Dark: `--secondary: oklch(0.26 0.015 50)`
- **File**: `src/app/globals.css`

### A-COL-003 — Semantic success token exists
`--success` and `--success-foreground` defined in both modes.
- Light: `--success: oklch(0.55 0.12 155)`
- Dark: `--success: oklch(0.60 0.12 155)`
- **File**: `src/app/globals.css`

### A-COL-004 — Semantic info token exists
`--info` and `--info-foreground` defined in both modes.
- Light: `--info: oklch(0.55 0.10 235)`
- Dark: `--info: oklch(0.60 0.10 235)`
- **File**: `src/app/globals.css`

### A-COL-005 — Semantic warning token exists
`--warning` and `--warning-foreground` defined in both modes.
- Light: `--warning: oklch(0.70 0.12 80)`
- Dark: `--warning: oklch(0.72 0.12 80)`
- **File**: `src/app/globals.css`

### A-COL-006 — Dark mode warm background
Dark background uses warm hue (hue 50), not neutral gray.
- `--background: oklch(0.17 0.015 50)`
- **File**: `src/app/globals.css`

### A-COL-007 — Ring matches primary
`--ring` matches `--primary` in both modes for consistent focus indicators.
- Light: `--ring: oklch(0.55 0.11 35)`
- Dark: `--ring: oklch(0.68 0.11 35)`
- **File**: `src/app/globals.css`

### A-COL-008 — Chart palette uses warm hues
5 chart colors defined with warm/diverse hues, not default Tailwind colors.
- **File**: `src/app/globals.css`

### A-COL-009 — OkLCH color space
All CSS custom properties use `oklch()` notation, never `hsl()`, `rgb()`, or hex.
- **File**: `src/app/globals.css`

### A-COL-010 — Sidebar tokens match theme
Sidebar variables mirror the main theme (terracotta primary, warm surfaces).
- **File**: `src/app/globals.css`

### A-COL-011 — Destructive color exists
`--destructive` defined in both light and dark modes.
- Light: `--destructive: oklch(0.577 0.245 27.325)`
- Dark: `--destructive: oklch(0.704 0.191 22.216)`
- **File**: `src/app/globals.css`

### A-COL-012 — No hardcoded Tailwind color classes in app code
App components (`src/app/`, `src/components/`) must not use bare Tailwind colors like `bg-green-500`, `text-blue-600`. Use semantic tokens (`bg-success`, `text-primary`) instead. Exception: `lesson-parts.tsx` and `exercise-parts.tsx` use intentional multi-color schemes.
- **Files**: `src/app/**/*.tsx`, `src/components/**/*.tsx`

### A-COL-013 — Theme color meta tag
Viewport `themeColor` set to terracotta hex `#9F6B53`.
- **File**: `src/app/layout.tsx`

### A-COL-014 — Prose links use primary color
Links inside `.prose` use `text-primary` with underline decoration.
- **File**: `src/app/globals.css`

### A-COL-015 — Lesson parts color-coded
6 lesson part types have distinct color schemes: Definition (indigo), Theorem (violet), Property (sky), Example (emerald), Remark (amber), Attention (rose).
- **File**: `src/components/content/lesson-parts.tsx`

---

## TYP — Typography (10)

### A-TYP-001 — DM Sans as primary font
`--font-sans` resolves to DM Sans loaded via `next/font/google`.
- Variable: `--font-dm-sans`
- **File**: `src/app/layout.tsx`, `src/app/globals.css`

### A-TYP-002 — Lora as serif font
`--font-serif` resolves to Lora loaded via `next/font/google`.
- Variable: `--font-lora`
- **File**: `src/app/layout.tsx`, `src/app/globals.css`

### A-TYP-003 — text-balance on headings
Major headings (`h1`, `h2`) use `text-balance` for even line wrapping.
- **Files**: `src/app/**/*.tsx`, `src/components/**/*.tsx`

### A-TYP-004 — tabular-nums on numeric displays
Score displays, counters, and progress percentages use `tabular-nums` for stable column alignment.
- **Files**: `src/components/**/*.tsx`

### A-TYP-005 — No text smaller than 14px on mobile
Minimum text size is `text-sm` (14px). No `text-[11px]`, `text-[12px]`, or `text-[13px]` for content text (exceptions: badges, captions).
- **Files**: `src/app/**/*.tsx`, `src/components/**/*.tsx`

### A-TYP-006 — Typographic ellipsis character
Loading states and truncation use `\u2026` (Unicode ellipsis), never three dots `...` in user-facing text.
- **Files**: `src/app/**/*.tsx`, `src/components/**/*.tsx`

### A-TYP-007 — Font variable applied to body
Body element receives both `${dmSans.variable}` and `${lora.variable}` class names.
- **File**: `src/app/layout.tsx`

### A-TYP-008 — Mono font defined
`--font-mono` resolves to Geist Mono for code blocks.
- **File**: `src/app/globals.css`

### A-TYP-009 — Brand name uses serif font
The "Learning" wordmark in sidebar header uses `font-serif`.
- **File**: `src/components/app-sidebar.tsx`

### A-TYP-010 — antialiased rendering
Body applies `antialiased` class and `font-synthesis-weight: none` + `text-rendering: optimizeLegibility`.
- **File**: `src/app/globals.css`, `src/app/layout.tsx`

---

## SPC — Spacing & Layout (8)

### A-SPC-001 — Consistent border radius scale
Radius scale defined via `--radius: 0.625rem` with computed sm/md/lg/xl/2xl/3xl/4xl variants.
- **File**: `src/app/globals.css`

### A-SPC-002 — No bare container class
Never use Tailwind `container` class alone (it doesn't auto-center in v4). Use `mx-auto w-full max-w-7xl` instead.
- **Files**: `src/app/**/*.tsx`, `src/components/**/*.tsx`

### A-SPC-003 — Header height token
`--header-height` defined as `calc(var(--spacing) * 14)` for consistent header sizing.
- **File**: `src/app/globals.css`

### A-SPC-004 — Parcours content padding
Parcours content area uses `gap-4 py-4 md:gap-6 md:py-6` for consistent vertical rhythm.
- **File**: `src/app/(parcours)/[parcours]/layout.tsx`

### A-SPC-005 — Card padding pattern
Auth cards use `overflow-hidden p-0` with inner `p-6 md:p-8` for form areas.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-SPC-006 — Sidebar variant inset
AppSidebar uses `variant="inset"` with `collapsible="icon"` configuration.
- **File**: `src/components/app-sidebar.tsx`

### A-SPC-007 — Safe area insets
Mobile bottom nav respects `env(safe-area-inset-bottom)` for notched devices.
- **File**: `src/components/mobile-bottom-nav.tsx`

### A-SPC-008 — SidebarInset overflow management
SidebarInset constrains height with `max-h-[calc(100svh-3.5rem)] md:max-h-svh overflow-hidden`.
- **File**: `src/app/(parcours)/[parcours]/layout.tsx`

---

## RES — Responsive (8)

### A-RES-001 — Viewport meta
Viewport configured with `width: device-width`, `initialScale: 1`, no `maximumScale` (allows zoom for accessibility).
- **File**: `src/app/layout.tsx`

### A-RES-002 — 100svh not 100vh
All full-height layouts use `svh` (small viewport height), never `vh` which causes layout issues on mobile browsers.
- **Files**: `src/app/**/*.tsx`, `src/components/**/*.tsx`

### A-RES-003 — Mobile bottom nav hidden on desktop
MobileBottomNav uses `md:hidden` to only show on mobile.
- **File**: `src/components/mobile-bottom-nav.tsx`

### A-RES-004 — Auth forms two-column on desktop
Login and signup cards use `grid md:grid-cols-2` for side-by-side layout on desktop, single column on mobile.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-RES-005 — Print hidden mobile nav
Mobile bottom nav uses `print:hidden` class.
- **File**: `src/components/mobile-bottom-nav.tsx`

### A-RES-006 — Container query on main content
Main content area uses `@container/main` for container-query-based responsive design.
- **File**: `src/app/(parcours)/[parcours]/layout.tsx`

### A-RES-007 — Sidebar collapses to icon on mobile
Sidebar uses `collapsible="icon"` with SidebarProvider managing open/closed state.
- **File**: `src/app/(parcours)/[parcours]/layout.tsx`

### A-RES-008 — Auth panel hidden on mobile
The colored brand panel in auth cards uses `hidden md:block`.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

---

## A11 — Accessibility (15)

### A-A11-001 — Skip-to-content link
Root layout contains a visually-hidden skip link targeting `#main-content`, with `sr-only focus:not-sr-only` pattern.
- **File**: `src/app/layout.tsx`

### A-A11-002 — main-content landmark target
The `id="main-content"` exists on the main content area in the parcours layout.
- **File**: `src/app/(parcours)/[parcours]/layout.tsx`

### A-A11-003 — Decorative icons aria-hidden
All decorative Lucide icons have `aria-hidden="true"` attribute.
- **Files**: `src/components/**/*.tsx`

### A-A11-004 — Touch targets 44px minimum
Global CSS enforces `min-height: 2.75rem; min-width: 2.75rem` on interactive elements when `pointer: coarse`.
- **File**: `src/app/globals.css`

### A-A11-005 — Touch target selector coverage
Touch target rule applies to `button`, `a[role="button"]`, `[role="tab"]`, `[data-slot="button"]`.
- **File**: `src/app/globals.css`

### A-A11-006 — Theme toggle has aria-label
Dark mode toggle button has dynamic `aria-label` describing current action.
- **File**: `src/components/app-sidebar.tsx`

### A-A11-007 — Form inputs have labels
All form inputs have associated `<label>` elements (via `htmlFor`/`id` pairing or `FieldLabel` component).
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-A11-008 — Error alerts use role="alert"
Form error messages use `role="alert"` for screen reader announcement.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-A11-009 — HTML lang attribute
Root `<html>` element has `lang="fr"` attribute.
- **File**: `src/app/layout.tsx`

### A-A11-010 — No nested main elements
Only one `<main>` element exists in any rendered page hierarchy. Nested layouts must not both contain `<main>`.
- **Files**: `src/app/**/layout.tsx`

### A-A11-011 — Interactive cards keyboard accessible
Clickable cards use the `InteractiveCard` component with `role`, `tabIndex`, `onKeyDown` handlers.
- **Files**: `src/components/**/*.tsx`

### A-A11-012 — Password visibility toggle accessible
Password show/hide buttons have `aria-label` describing action and icons have `aria-hidden="true"`.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-A11-013 — Theme provider with system default
ThemeProvider configured with `defaultTheme="system"` and `enableSystem`.
- **File**: `src/app/layout.tsx`

### A-A11-014 — suppressHydrationWarning on html
`<html>` element has `suppressHydrationWarning` to prevent theme flash mismatch.
- **File**: `src/app/layout.tsx`

### A-A11-015 — Mobile nav has aria-label
Mobile bottom nav has `aria-label="Navigation mobile"`.
- **File**: `src/components/mobile-bottom-nav.tsx`

---

## NAV — Navigation (6)

### A-NAV-001 — Sidebar navigation structure
AppSidebar uses shadcn `Sidebar` with `SidebarHeader`, `SidebarContent`, `SidebarFooter` structure.
- **File**: `src/components/app-sidebar.tsx`

### A-NAV-002 — Mobile bottom nav pattern
Mobile navigation uses a fixed bottom bar with 3 items: Dashboard, Apprendre, Reviser.
- **File**: `src/components/mobile-bottom-nav.tsx`

### A-NAV-003 — Active link highlighting
Both sidebar and mobile nav indicate active route via `isActive` prop or conditional `text-primary` class.
- **Files**: `src/components/app-sidebar.tsx`, `src/components/mobile-bottom-nav.tsx`

### A-NAV-004 — Sidebar active state uses isActive
SidebarMenuButton uses the `isActive` prop for current route highlighting.
- **File**: `src/components/app-sidebar.tsx`

### A-NAV-005 — Mobile nav uses semantic tokens
Mobile nav active state uses `text-primary`, inactive uses `text-muted-foreground`.
- **File**: `src/components/mobile-bottom-nav.tsx`

### A-NAV-006 — Sidebar footer has theme toggle
SidebarFooter contains a dark/light mode toggle button and NavUser component.
- **File**: `src/components/app-sidebar.tsx`

---

## CMP — Components (12)

### A-CMP-001 — InteractiveCard for clickable cards
All clickable card patterns must use the `InteractiveCard` component, not bare `Card` with onClick.
- **Files**: `src/components/**/*.tsx`

### A-CMP-002 — shadcn Field component for forms
Forms use `Field`, `FieldLabel`, `FieldGroup`, `FieldDescription` from `@/components/ui/field`.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-CMP-003 — Toaster component present
Root layout includes the `<Toaster />` component from sonner for notifications.
- **File**: `src/app/layout.tsx`

### A-CMP-004 — Lesson parts use aside element
All lesson part components (Definition, Theorem, etc.) render as `<aside>` elements.
- **File**: `src/components/content/lesson-parts.tsx`

### A-CMP-005 — Lesson parts have icon badges
Each lesson part type has a circular icon badge with `rounded-full` and color-matched background.
- **File**: `src/components/content/lesson-parts.tsx`

### A-CMP-006 — Lesson parts inner prose
Lesson part content wrapped in `prose prose-stone dark:prose-invert max-w-none`.
- **File**: `src/components/content/lesson-parts.tsx`

### A-CMP-007 — Radio group for parcours selection
Signup form uses `RadioGroup` + `RadioGroupItem` for parcours selection.
- **File**: `src/components/signup-form.tsx`

### A-CMP-008 — Password toggle pattern
Password fields use a relative-positioned container with absolute-positioned toggle button.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-CMP-009 — Auth card colored panel
Auth cards have a `bg-primary` right panel with centered brand text, hidden on mobile.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-CMP-010 — Loading states with disabled
Submit buttons show loading text and `disabled={isLoading}` during async operations.
- **Files**: `src/components/login-form.tsx`, `src/components/signup-form.tsx`

### A-CMP-011 — PwaInstallPrompt present
Root layout includes `<PwaInstallPrompt />` component.
- **File**: `src/app/layout.tsx`

### A-CMP-012 — Providers nesting order
Root layout nests providers as: ThemeProvider > QueryProvider > AuthProvider.
- **File**: `src/app/layout.tsx`

---

## MOT — Motion & Animation (6)

### A-MOT-001 — prefers-reduced-motion respected
Global CSS disables animations and transitions via `animation-duration: 0.01ms`, `transition-duration: 0.01ms` when reduced motion preferred.
- **File**: `src/app/globals.css`

### A-MOT-002 — Reduced motion applies to all elements
Reduced motion rule uses universal selector `*, *::before, *::after`.
- **File**: `src/app/globals.css`

### A-MOT-003 — Theme toggle icon transition
Sun/Moon icons use `transition-transform` with rotate/scale for smooth theme switching.
- **File**: `src/components/app-sidebar.tsx`

### A-MOT-004 — Mobile nav transition on hover
Mobile nav items use `transition-colors` for hover state changes.
- **File**: `src/components/mobile-bottom-nav.tsx`

### A-MOT-005 — Prose link hover transition
Prose links use `transition-colors` for underline opacity change on hover.
- **File**: `src/app/globals.css`

### A-MOT-006 — No transition-all
Components must not use `transition-all` (performance cost). Use specific properties: `transition-colors`, `transition-transform`, `transition-opacity`.
- **Files**: `src/app/**/*.tsx`, `src/components/**/*.tsx`

---

## CNT — Content & MDX (6)

### A-CNT-001 — Prose headings have decorative underline
`.prose h3` has a `::after` pseudo-element creating a primary-colored underline accent.
- **File**: `src/app/globals.css`

### A-CNT-002 — Prose tables styled
`.prose table` has rounded corners, shadow, border, themed header row, and hover on rows.
- **File**: `src/app/globals.css`

### A-CNT-003 — Prose list markers use primary
Ordered list markers are `font-bold text-primary`. Unordered markers are `text-primary/60`.
- **File**: `src/app/globals.css`

### A-CNT-004 — Prose blockquotes styled
Blockquotes use `border-l-primary/40 bg-primary/5`, not italic.
- **File**: `src/app/globals.css`

### A-CNT-005 — KaTeX display math styled
`.katex-display` has rounded border, gradient background, and shadow.
- **File**: `src/app/globals.css`

### A-CNT-006 — Prose HR as gradient
`hr` elements in prose use a gradient line (`from-transparent via-stone-300 to-transparent`).
- **File**: `src/app/globals.css`

---

## PRT — Print (5)

### A-PRT-001 — Navigation hidden in print
`nav`, `aside`, `footer`, `header`, `[data-sidebar]`, `[data-slot="button"]`, `.fixed` all have `display: none !important` in print.
- **File**: `src/app/globals.css`

### A-PRT-002 — Print body white background
Body gets `background: white !important; color: black !important` in print.
- **File**: `src/app/globals.css`

### A-PRT-003 — Print main full width
`main` gets `width: 100% !important; max-width: 100% !important; padding: 0; margin: 0` in print.
- **File**: `src/app/globals.css`

### A-PRT-004 — Print prose sizing
`.prose` gets `max-width: 100% !important; font-size: 12pt !important` in print.
- **File**: `src/app/globals.css`

### A-PRT-005 — Print shows link URLs
`.prose a::after` adds URL text `content: " (" attr(href) ")"` in print. Cards avoid page breaks with `break-inside: avoid`.
- **File**: `src/app/globals.css`

---

## BRD — Brand & Identity (5)

### A-BRD-001 — App title
Metadata title defaults to `Learning OS — Maths du lycee tunisien` with template `%s | Learning OS`.
- **File**: `src/app/layout.tsx`

### A-BRD-002 — Sidebar brand display
Sidebar header shows "Learning" in serif font with parcours badge below.
- **File**: `src/components/app-sidebar.tsx`

### A-BRD-003 — OpenGraph metadata
OG tags configured with `type: website`, `locale: fr_FR`, `siteName: Learning OS`.
- **File**: `src/app/layout.tsx`

### A-BRD-004 — Twitter card metadata
Twitter card configured with `summary_large_image` type.
- **File**: `src/app/layout.tsx`

### A-BRD-005 — PWA configuration
`manifest` set to `/manifest.json`, `appleWebApp` configured with `capable: true` and title `Learning OS`.
- **File**: `src/app/layout.tsx`
