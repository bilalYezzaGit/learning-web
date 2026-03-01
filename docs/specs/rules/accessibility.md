# Accessibility

> WCAG compliance, ARIA, keyboard navigation, touch targets.

- A11-001 [auto] html element has lang="fr"
- A11-002 [auto] Skip-to-content link: a href="#main-content" with sr-only focus:not-sr-only in root layout
- A11-003 [auto] main-content target: id="main-content" exists in parcours layout
- A11-004 [auto] Touch targets: @media (pointer: coarse) enforces min-height 2.75rem, min-width 2.75rem
- A11-005 [auto] No main tag in layout files — prevents nested landmarks
- A11-006 [auto] Form inputs have labels: htmlFor/id pairing or FieldLabel component
- A11-007 [auto] Error alerts use role="alert" for screen reader announcement
- A11-009 [auto] No mobile bottom nav (removed — navigation is header-only)
- A11-010 [auto] Decorative icons have aria-hidden="true" (Lucide icons in interactive contexts)
- A11-011 [manual] Password toggle buttons have aria-label and icons have aria-hidden
  > Read login-form.tsx and signup-form.tsx, verify toggle button accessibility
