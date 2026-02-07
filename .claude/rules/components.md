# Composants React

- **Server Components par defaut** (pas de `'use client'`)
- `'use client'` uniquement si hooks React ou event handlers
- Nommage fichiers en kebab-case : `module-card.tsx`
- Utiliser `cn()` de `@/lib/utils/cn` pour merger className
- Design System shadcn/ui : composants dans `src/components/ui/`
- Ajouter composants via `npx shadcn@latest add <nom>`
- Personnalisation via CSS variables dans `globals.css`

## Debug checklist

1. **Build fails** → `npm run type-check` puis `npm run lint`
2. **Hydration mismatch** → verifier `'use client'` sur composants avec state, pas de `window`/`document` dans Server Components
3. **Firebase error** → verifier `.env.local` et variables `NEXT_PUBLIC_FIREBASE_*`
4. **Tailwind ne s'applique pas** → verifier `content` dans config et import `globals.css` dans layout
