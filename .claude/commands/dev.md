Guide de developpement Next.js.

**Argument**: $ARGUMENTS

## Utilisation

- `/dev` : Affiche ce guide complet
- `/dev setup` : Instructions setup initial
- `/dev patterns` : Patterns et conventions
- `/dev debug <issue>` : Aide au debug

---

## Structure du projet

```
src/
├── app/                    # App Router (pages)
│   ├── (auth)/            # Routes auth (login, onboarding)
│   ├── (main)/            # Routes principales
│   │   ├── cours/         # Feature cours
│   │   ├── objectifs/     # Feature objectifs
│   │   └── profil/        # Feature profil
│   ├── layout.tsx         # Root layout
│   └── globals.css        # Styles globaux
├── components/            # Design System
│   ├── ui/               # Atoms (Button, Input...)
│   ├── patterns/         # Molecules
│   └── sections/         # Organisms
├── lib/                   # Core logic
│   ├── firebase/         # Firebase config
│   ├── services/         # Services metier
│   ├── stores/           # Zustand stores
│   ├── hooks/            # Custom hooks
│   └── utils/            # Helpers
├── content/              # HTML extensions rendering
└── types/                # TypeScript interfaces
```

---

## Commandes

```bash
npm run dev              # Dev server (localhost:3000)
npm run build            # Build production
npm run start            # Serve build local
npm run lint             # ESLint
npm run type-check       # TypeScript strict
```

---

## Patterns obligatoires

### 1. Server vs Client Components

```tsx
// Par defaut = Server Component (pas de state, pas de hooks)
export default function Page() {
  return <div>Server rendered</div>
}

// Client Component = ajouter "use client"
'use client'
import { useState } from 'react'
export default function Counter() {
  const [count, setCount] = useState(0)
  return <button onClick={() => setCount(c => c + 1)}>{count}</button>
}
```

**Regle** : Maximiser les Server Components, "use client" uniquement si necessaire.

### 2. Data Fetching

```tsx
// Server Component - fetch direct
async function Page() {
  const data = await fetch('https://api.example.com/data')
  return <div>{data}</div>
}

// Client Component - Zustand + hooks
'use client'
import { useContent } from '@/lib/hooks/use-content'
function ClientPage() {
  const { modules, loading } = useContent()
  if (loading) return <Skeleton />
  return <ModuleList modules={modules} />
}
```

### 3. Zustand Store Pattern

```tsx
// src/lib/stores/content-store.ts
import { create } from 'zustand'

interface ContentState {
  modules: Module[]
  loading: boolean
  fetchModules: () => Promise<void>
}

export const useContentStore = create<ContentState>((set) => ({
  modules: [],
  loading: false,
  fetchModules: async () => {
    set({ loading: true })
    const modules = await contentService.fetchModules()
    set({ modules, loading: false })
  },
}))
```

### 4. Firebase Service Pattern

```tsx
// src/lib/services/auth-service.ts
import { auth } from '@/lib/firebase/client'
import { signInAnonymously, onAuthStateChanged } from 'firebase/auth'

export const authService = {
  signInAnonymously: () => signInAnonymously(auth),
  onAuthStateChanged: (callback: (user: User | null) => void) =>
    onAuthStateChanged(auth, callback),
}
```

### 5. Component Pattern (shadcn/ui)

```tsx
// src/components/ui/button.tsx
import { cva, type VariantProps } from 'class-variance-authority'
import { cn } from '@/lib/utils/cn'

const buttonVariants = cva(
  'inline-flex items-center justify-center rounded-md font-medium transition-colors',
  {
    variants: {
      variant: {
        primary: 'bg-brown-600 text-white hover:bg-brown-700',
        secondary: 'bg-brown-100 text-brown-900 hover:bg-brown-200',
        ghost: 'hover:bg-brown-100',
      },
      size: {
        sm: 'h-8 px-3 text-sm',
        md: 'h-10 px-4',
        lg: 'h-12 px-6 text-lg',
      },
    },
    defaultVariants: {
      variant: 'primary',
      size: 'md',
    },
  }
)
```

---

## Conventions de code

### Imports (ordre)

```tsx
// 1. React/Next
import { useState } from 'react'
import Link from 'next/link'

// 2. Libs externes
import { motion } from 'framer-motion'

// 3. Alias internes
import { Button } from '@/components/ui/button'
import { useAuth } from '@/lib/hooks/use-auth'
import { cn } from '@/lib/utils/cn'

// 4. Types
import type { Module } from '@/types/models'
```

### Naming

- **Components** : PascalCase (`ModuleCard.tsx`)
- **Hooks** : camelCase avec `use` prefix (`useAuth.ts`)
- **Stores** : kebab-case (`content-store.ts`)
- **Utils** : kebab-case (`cn.ts`)

---

## Debug checklist

Si argument = `debug`:

1. **Build fails** ?
   ```bash
   npm run type-check  # Errors TypeScript
   npm run lint        # Errors ESLint
   ```

2. **Hydration mismatch** ?
   - Verifier `'use client'` sur composants avec state
   - Pas de `window`/`document` dans Server Components

3. **Firebase error** ?
   - Verifier `.env.local` existe
   - Verifier variables `NEXT_PUBLIC_FIREBASE_*`

4. **Tailwind ne s'applique pas** ?
   - Verifier `content` dans `tailwind.config.ts`
   - Verifier import `globals.css` dans layout
