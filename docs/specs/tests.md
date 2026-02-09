# UI/UX Tests

25 executable test procedures. Each test uses only Claude Code read-only primitives: `Read`, `Grep`, `Glob`, `Bash` (read-only commands).

---

### T-001 — Verify light mode color variables

**Steps:**
1. Read `src/app/globals.css`
2. In `:root` block, verify these values exist:
   - `--primary: oklch(0.55 0.11 35)`
   - `--secondary: oklch(0.94 0.015 80)`
   - `--success: oklch(0.55 0.12 155)`
   - `--info: oklch(0.55 0.10 235)`
   - `--warning: oklch(0.70 0.12 80)`
   - `--ring: oklch(0.55 0.11 35)`
3. Verify all 5 chart colors exist (`--chart-1` through `--chart-5`)

**Expected:** All values present and matching exactly.
**Covers:** A-COL-001, A-COL-002, A-COL-003, A-COL-004, A-COL-005, A-COL-007, A-COL-008, A-COL-009

---

### T-002 — Verify dark mode color variables

**Steps:**
1. Read `src/app/globals.css`
2. In `.dark` block, verify:
   - `--primary: oklch(0.68 0.11 35)`
   - `--background: oklch(0.17 0.015 50)`
   - `--ring: oklch(0.68 0.11 35)`
   - `--success: oklch(0.60 0.12 155)`
   - `--info: oklch(0.60 0.10 235)`
   - `--warning: oklch(0.72 0.12 80)`
   - `--destructive: oklch(0.704 0.191 22.216)`
3. Verify sidebar variables exist in `.dark` block

**Expected:** All dark mode values present and matching.
**Covers:** A-COL-001, A-COL-006, A-COL-007, A-COL-010, A-COL-011

---

### T-003 — No hardcoded Tailwind color classes

**Steps:**
1. Grep `src/` for pattern `(bg|text|border|ring)-(red|green|blue|yellow|purple|pink|orange|teal|cyan|lime|fuchsia|rose|violet|indigo|emerald|sky|amber|stone)-\d{2,3}` in `*.tsx` files
2. Exclude `lesson-parts.tsx` and `exercise-parts.tsx` from results (intentional color coding)
3. Exclude `globals.css` (prose overrides use `stone` intentionally)

**Expected:** Zero matches outside excluded files.
**Covers:** A-COL-012

---

### T-004 — Decorative icons have aria-hidden

**Steps:**
1. Grep `src/components/` for Lucide icon usage pattern: `<[A-Z][a-zA-Z]+ className="h-` in `*.tsx`
2. For each match, verify the same line or JSX element includes `aria-hidden="true"`
3. Count total icons vs icons with aria-hidden

**Expected:** All decorative icons have `aria-hidden="true"`. Icons used as the sole content of a button may omit it if the button has `aria-label`.
**Covers:** A-A11-003

---

### T-005 — No transition-all usage

**Steps:**
1. Grep `src/` for `transition-all` in `*.tsx` and `*.css` files
2. Exclude `node_modules/`

**Expected:** Zero matches.
**Covers:** A-MOT-006

---

### T-006 — Root layout structure

**Steps:**
1. Read `src/app/layout.tsx`
2. Verify `<html lang="fr" suppressHydrationWarning>`
3. Verify body has `${dmSans.variable}` and `${lora.variable}` and `antialiased`
4. Verify skip-to-content link: `<a href="#main-content"` with `sr-only focus:not-sr-only`
5. Verify provider nesting: ThemeProvider > QueryProvider > AuthProvider
6. Verify `<Toaster />` component present
7. Verify metadata includes `title.default`, `description`, `openGraph`, `twitter`, `manifest`
8. Verify viewport has `themeColor: '#9F6B53'`

**Expected:** All checks pass.
**Covers:** A-A11-001, A-A11-009, A-A11-013, A-A11-014, A-TYP-001, A-TYP-002, A-TYP-007, A-TYP-010, A-CMP-003, A-CMP-011, A-CMP-012, A-BRD-001, A-BRD-003, A-BRD-004, A-BRD-005, A-COL-013

---

### T-007 — Parcours layout structure

**Steps:**
1. Read `src/app/(parcours)/[parcours]/layout.tsx`
2. Verify `<SidebarProvider>` wraps everything
3. Verify `<AppSidebar>` present
4. Verify `<SidebarInset>` has `max-h-[calc(100svh-3.5rem)] md:max-h-svh overflow-hidden`
5. Verify `id="main-content"` exists
6. Verify `@container/main` class present
7. Verify `<MobileBottomNav>` present
8. Verify content padding: `gap-4 py-4 md:gap-6 md:py-6`

**Expected:** All structural elements present.
**Covers:** A-NAV-001, A-A11-002, A-RES-006, A-RES-007, A-SPC-004, A-SPC-008

---

### T-008 — Mobile bottom nav

**Steps:**
1. Read `src/components/mobile-bottom-nav.tsx`
2. Verify `md:hidden` class (hidden on desktop)
3. Verify `print:hidden` class
4. Verify `aria-label="Navigation mobile"` on `<nav>`
5. Verify `pb-[env(safe-area-inset-bottom)]`
6. Verify 3 nav items: Dashboard, Apprendre, Reviser
7. Verify active state uses `text-primary`
8. Verify inactive uses `text-muted-foreground`
9. Verify icons have `aria-hidden="true"`
10. Verify `transition-colors` on items

**Expected:** All checks pass.
**Covers:** A-NAV-002, A-NAV-003, A-NAV-005, A-RES-003, A-RES-005, A-A11-003, A-A11-015, A-SPC-007, A-MOT-004

---

### T-009 — Lesson parts color coding

**Steps:**
1. Read `src/components/content/lesson-parts.tsx`
2. Verify 6 config objects exist: `definitionConfig`, `theoremConfig`, `propertyConfig`, `exampleConfig`, `remarkConfig`, `attentionConfig`
3. Verify each has `accentClass`, `bgClass`, `iconClass`, `badgeClass`
4. Verify component renders `<aside>` element
5. Verify icons have `aria-hidden="true"`
6. Verify inner content has `prose prose-stone dark:prose-invert max-w-none`
7. Verify each type uses distinct color (indigo, violet, sky, emerald, amber, rose)

**Expected:** All 6 types properly configured with distinct colors.
**Covers:** A-COL-015, A-CMP-004, A-CMP-005, A-CMP-006, A-A11-003

---

### T-010 — Reduced motion media query

**Steps:**
1. Read `src/app/globals.css`
2. Verify `@media (prefers-reduced-motion: reduce)` block exists
3. Verify it targets `*, *::before, *::after`
4. Verify `animation-duration: 0.01ms !important`
5. Verify `animation-iteration-count: 1 !important`
6. Verify `transition-duration: 0.01ms !important`

**Expected:** All reduced motion declarations present.
**Covers:** A-MOT-001, A-MOT-002

---

### T-011 — Print styles

**Steps:**
1. Read `src/app/globals.css`
2. Verify `@media print` block exists
3. Verify hidden elements: `nav, aside, footer, header, [data-sidebar], [data-slot="button"], .fixed` with `display: none !important`
4. Verify body: `background: white !important; color: black !important`
5. Verify main: `width: 100% !important; max-width: 100% !important`
6. Verify `.prose`: `max-width: 100% !important; font-size: 12pt !important`
7. Verify `.prose a::after` with `content: " (" attr(href) ")"`
8. Verify `[data-slot="card"]` has `break-inside: avoid`

**Expected:** All print rules present.
**Covers:** A-PRT-001, A-PRT-002, A-PRT-003, A-PRT-004, A-PRT-005

---

### T-012 — Touch target sizing

**Steps:**
1. Read `src/app/globals.css`
2. Verify `@media (pointer: coarse)` block exists
3. Verify selectors: `button`, `a[role="button"]`, `[role="tab"]`, `[data-slot="button"]`
4. Verify `min-height: 2.75rem` (44px)
5. Verify `min-width: 2.75rem`

**Expected:** Touch target rules correctly defined.
**Covers:** A-A11-004, A-A11-005

---

### T-013 — Font variable declarations

**Steps:**
1. Read `src/app/globals.css`
2. In `@theme inline` block, verify:
   - `--font-sans: var(--font-dm-sans), ui-sans-serif, system-ui, sans-serif`
   - `--font-serif: var(--font-lora), ui-serif, Georgia, serif`
   - `--font-mono: var(--font-geist-mono), ui-monospace, monospace`
3. Read `src/app/layout.tsx`, verify DM_Sans and Lora imports from `next/font/google`

**Expected:** All font stacks properly defined.
**Covers:** A-TYP-001, A-TYP-002, A-TYP-007, A-TYP-008

---

### T-014 — text-balance on headings

**Steps:**
1. Grep `src/` for `text-balance` in `*.tsx` files
2. Verify matches include major heading contexts (h1, h2, or descriptive paragraphs)
3. Check that key pages use text-balance: login-form, signup-form, parcours dashboard

**Expected:** At least 3 distinct usages of `text-balance` on heading/description text.
**Covers:** A-TYP-003

---

### T-015 — tabular-nums on numeric displays

**Steps:**
1. Grep `src/` for `tabular-nums` in `*.tsx` files
2. Verify matches are on score, counter, or percentage elements

**Expected:** At least 1 usage of `tabular-nums` on numeric content.
**Covers:** A-TYP-004

---

### T-016 — No triple-dot literal in UI text

**Steps:**
1. Grep `src/` for the literal string `"..."` or `'...'` or `` `...` `` in `*.tsx` files
2. Exclude import statements, spread operators (`...props`, `...rest`), and `line-clamp` truncation
3. Focus on user-facing text: loading messages, placeholders, button labels

**Expected:** No triple-dot in user-facing text. Use `\u2026` instead.
**Covers:** A-TYP-006

---

### T-017 — No 100vh usage

**Steps:**
1. Grep `src/` for `100vh` in `*.tsx` and `*.css` files
2. Exclude `node_modules/`
3. Allow `100svh` (correct form)

**Expected:** Zero matches of `100vh` (should all be `100svh`).
**Covers:** A-RES-002

---

### T-018 — Skip-to-content link

**Steps:**
1. Read `src/app/layout.tsx`
2. Verify `<a href="#main-content"` exists
3. Verify it has `sr-only` and `focus:not-sr-only` classes
4. Verify text content is "Aller au contenu principal"
5. Read `src/app/(parcours)/[parcours]/layout.tsx`
6. Verify `id="main-content"` exists on a container element

**Expected:** Skip link in root layout, target ID in parcours layout.
**Covers:** A-A11-001, A-A11-002

---

### T-019 — InteractiveCard usage

**Steps:**
1. Grep `src/` for `onClick` on elements containing `Card` in `*.tsx` files
2. Verify clickable cards use `InteractiveCard` component (not bare `Card` with onClick)
3. Grep for `InteractiveCard` imports to verify the component is used

**Expected:** No bare `Card` with `onClick`. All use `InteractiveCard`.
**Covers:** A-CMP-001, A-A11-011

---

### T-020 — Metadata completeness

**Steps:**
1. Read `src/app/layout.tsx`
2. Verify `metadata` export contains:
   - `title.default` with "Learning OS"
   - `description` (non-empty)
   - `manifest: '/manifest.json'`
   - `openGraph.type: 'website'`
   - `openGraph.locale: 'fr_FR'`
   - `twitter.card: 'summary_large_image'`
   - `appleWebApp.capable: true`
   - `icons.icon` defined
3. Verify `viewport` export contains `themeColor: '#9F6B53'`

**Expected:** All metadata fields present.
**Covers:** A-BRD-001, A-BRD-003, A-BRD-004, A-BRD-005, A-COL-013

---

### T-021 — Prose styling rules

**Steps:**
1. Read `src/app/globals.css`
2. Verify `.prose h3` has `after:bg-primary/40` decorative underline
3. Verify `.prose table` has `rounded-lg border` styling
4. Verify `.prose ol > li::marker` has `text-primary`
5. Verify `.prose ul > li::marker` has `text-primary/60`
6. Verify `.prose a` has `text-primary` with `decoration-primary/30`
7. Verify `.prose blockquote` has `border-l-primary/40 bg-primary/5 not-italic`
8. Verify `.katex-display` has styled container
9. Verify `.prose hr` has gradient styling

**Expected:** All prose customizations present.
**Covers:** A-CNT-001, A-CNT-002, A-CNT-003, A-CNT-004, A-CNT-005, A-CNT-006, A-COL-014

---

### T-022 — Sidebar structure

**Steps:**
1. Read `src/components/app-sidebar.tsx`
2. Verify `variant="inset"` and `collapsible="icon"` on `<Sidebar>`
3. Verify `SidebarHeader` contains brand link with `font-serif` text "Learning"
4. Verify `SidebarContent` has nav items
5. Verify `SidebarFooter` contains theme toggle and `<NavUser />`
6. Verify theme toggle has `aria-label`
7. Verify all icons have `aria-hidden="true"`
8. Verify parcours badge uses `Badge` component

**Expected:** All sidebar structural requirements met.
**Covers:** A-NAV-001, A-NAV-004, A-NAV-006, A-SPC-006, A-BRD-002, A-TYP-009, A-A11-003, A-A11-006

---

### T-023 — Form accessibility

**Steps:**
1. Read `src/components/login-form.tsx`
2. Verify each `<Input>` has matching `<FieldLabel htmlFor="...">` and `id="..."`
3. Verify error display uses `role="alert"`
4. Verify password toggle has `aria-label`
5. Verify toggle icons have `aria-hidden="true"`
6. Read `src/components/signup-form.tsx`
7. Repeat checks 2-5
8. Verify `autoComplete` attributes on email and password inputs

**Expected:** All form accessibility requirements met.
**Covers:** A-A11-007, A-A11-008, A-A11-012, A-CMP-002, A-CMP-008, A-CMP-010

---

### T-024 — No nested main elements

**Steps:**
1. Grep `src/app/` for `<main` in `*.tsx` files
2. Count occurrences per layout file
3. Verify that in any path from root to leaf layout, at most one layout contains `<main>`

**Expected:** No `<main>` tag in layout files (content uses `id="main-content"` on a `<div>` instead, with the skip link targeting it).
**Covers:** A-A11-010

---

### T-025 — No bare container class

**Steps:**
1. Grep `src/` for `className=` values containing the word `container` in `*.tsx` files
2. Filter to cases where `container` is used as a standalone Tailwind class (not `@container` or `container/`)
3. Verify none use bare `container` without explicit centering

**Expected:** Zero bare `container` usage. All use `mx-auto w-full max-w-7xl` or `@container`.
**Covers:** A-SPC-002
