# Components

> shadcn/ui patterns, component structure, provider setup.

- CMP-001 [auto] Lesson parts: 6 config objects (definition, theorem, property, example, remark, attention), aside element, prose wrapper, aria-hidden icons
- CMP-002 [auto] InteractiveCard for clickable cards — no bare Card with onClick
- CMP-003 [auto] Toaster component present in root layout
- CMP-004 [auto] PwaInstallPrompt present in root layout
- CMP-005 [auto] Providers nesting order: QueryProvider > AuthProvider
- CMP-006 [auto] Metadata completeness: title.default, description, manifest, openGraph, twitter, appleWebApp, themeColor
- CMP-007 [manual] Loading states: submit buttons show loading text and disabled during async
  > Read login-form.tsx, signup-form.tsx — verify disabled={isLoading} pattern
