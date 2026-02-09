# Colors & Theming

> Semantic color tokens, theme variables, oklch color space.

- COL-001 [auto] Light mode: :root defines --primary oklch(0.55 0.11 35), --secondary, --success, --info, --warning, --ring, 5 chart colors in oklch()
- COL-002 [auto] Dark mode: .dark defines --primary oklch(0.68 0.11 35), --background, --ring, --success, --info, --warning, --destructive, --sidebar in oklch()
- COL-003 [auto] No hardcoded Tailwind color classes (bg-red-500) — use semantic tokens. Exclude: lesson-parts.tsx, exercise-parts.tsx, mdx-components.tsx
- COL-004 [manual] WCAG AA contrast 4.5:1 on all text in both light and dark modes
  > Visual inspection: use DevTools color picker or axe extension on all main pages
