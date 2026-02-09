# React &amp; Next.js

> Server/Client components, import patterns, framework conventions.

- RCT-001 [auto] Files with React hooks (useState, useEffect, useContext) must have 'use client' directive
- RCT-002 [auto] No direct Firebase imports in src/components/ — use services from src/lib/services/
- RCT-003 [auto] No bare img tags — use next/image for optimization
- RCT-004 [auto] Component files use kebab-case naming (e.g., module-card.tsx not ModuleCard.tsx)
- RCT-005 [manual] Server Components by default — 'use client' only when hooks or event handlers are needed
  > Check if any 'use client' files could be Server Components instead
