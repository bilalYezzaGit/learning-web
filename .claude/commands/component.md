Genere un composant React pour le Design System.

**Argument**: $ARGUMENTS (obligatoire)

## Usage

```
/component Button atoms
/component ModuleCard molecules
/component Header organisms
```

**Format**: `/component <NomComposant> <categorie>`

- `<NomComposant>` : PascalCase (ex: `Button`, `ModuleCard`)
- `<categorie>` : `atoms` | `molecules` | `organisms`

---

## Templates par categorie

### Atoms (ui/)

Composants de base, sans logique metier, hautement reutilisables.

```tsx
// src/components/ui/{nom-kebab}.tsx
import { cva, type VariantProps } from 'class-variance-authority'
import { cn } from '@/lib/utils/cn'

const {nom}Variants = cva(
  // Base styles
  'inline-flex items-center justify-center',
  {
    variants: {
      variant: {
        default: '',
        // Ajouter variants
      },
      size: {
        sm: '',
        md: '',
        lg: '',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'md',
    },
  }
)

export interface {Nom}Props
  extends React.HTMLAttributes<HTMLElement>,
    VariantProps<typeof {nom}Variants> {
  // Props additionnelles
}

export function {Nom}({ className, variant, size, ...props }: {Nom}Props) {
  return (
    <element
      className={cn({nom}Variants({ variant, size }), className)}
      {...props}
    />
  )
}
```

### Molecules (patterns/)

Combinaisons d'atoms, peuvent avoir un peu de logique UI.

```tsx
// src/components/patterns/{nom-kebab}.tsx
'use client'

import { cn } from '@/lib/utils/cn'
import { Button } from '@/components/ui/button'
// Autres imports atoms

export interface {Nom}Props {
  // Props typees
  className?: string
}

export function {Nom}({ className, ...props }: {Nom}Props) {
  return (
    <div className={cn('', className)}>
      {/* Composition d'atoms */}
    </div>
  )
}
```

### Organisms (sections/)

Sections completes, peuvent utiliser des hooks et stores.

```tsx
// src/components/sections/{nom-kebab}.tsx
'use client'

import { cn } from '@/lib/utils/cn'
import { useContentStore } from '@/lib/stores/content-store'
// Imports patterns et atoms

export interface {Nom}Props {
  className?: string
}

export function {Nom}({ className }: {Nom}Props) {
  // Hooks et state si necessaire

  return (
    <section className={cn('', className)}>
      {/* Structure complexe */}
    </section>
  )
}
```

---

## Checklist de generation

1. **Creer le fichier** dans le bon dossier:
   - atoms → `src/components/ui/`
   - molecules → `src/components/patterns/`
   - organisms → `src/components/sections/`

2. **Nommage fichier**: kebab-case (`module-card.tsx`)

3. **Ajouter au barrel export**:
   ```tsx
   // src/components/ui/index.ts
   export * from './{nom-kebab}'
   ```

4. **Verifier**:
   ```bash
   npm run type-check && npm run lint
   ```

---

## Mapping tokens Flutter → Tailwind

### Colors
| Flutter | Tailwind |
|---------|----------|
| `AppColors.primary` | `brown-600` |
| `AppColors.background` | `stone-50` |
| `AppColors.surface` | `white` |
| `AppColors.text` | `stone-900` |
| `AppColors.textSecondary` | `stone-500` |
| `AppColors.border` | `stone-200` |
| `AppColors.success` | `emerald-500` |
| `AppColors.error` | `red-500` |

### Spacing
| Flutter | Tailwind |
|---------|----------|
| `AppSpacing.xs` (4) | `p-1`, `gap-1` |
| `AppSpacing.sm` (8) | `p-2`, `gap-2` |
| `AppSpacing.md` (16) | `p-4`, `gap-4` |
| `AppSpacing.lg` (24) | `p-6`, `gap-6` |
| `AppSpacing.xl` (32) | `p-8`, `gap-8` |

### Border radius
| Flutter | Tailwind |
|---------|----------|
| `AppSpacing.radiusSm` | `rounded` |
| `AppSpacing.radiusMd` | `rounded-lg` |
| `AppSpacing.radiusLg` | `rounded-xl` |

### Typography
| Flutter | Tailwind |
|---------|----------|
| `AppTypography.h1` | `text-3xl font-bold` |
| `AppTypography.h2` | `text-2xl font-semibold` |
| `AppTypography.h3` | `text-xl font-semibold` |
| `AppTypography.body` | `text-base` |
| `AppTypography.caption` | `text-sm text-stone-500` |

---

## Exemple complet

Commande: `/component ProgressBar atoms`

Genere:

```tsx
// src/components/ui/progress-bar.tsx
import { cva, type VariantProps } from 'class-variance-authority'
import { cn } from '@/lib/utils/cn'

const progressBarVariants = cva(
  'h-2 rounded-full overflow-hidden bg-stone-200',
  {
    variants: {
      variant: {
        default: '',
        success: '',
      },
      size: {
        sm: 'h-1',
        md: 'h-2',
        lg: 'h-3',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'md',
    },
  }
)

const fillVariants = cva(
  'h-full transition-all duration-300',
  {
    variants: {
      variant: {
        default: 'bg-brown-600',
        success: 'bg-emerald-500',
      },
    },
    defaultVariants: {
      variant: 'default',
    },
  }
)

export interface ProgressBarProps
  extends React.HTMLAttributes<HTMLDivElement>,
    VariantProps<typeof progressBarVariants> {
  value: number // 0-100
  max?: number
}

export function ProgressBar({
  className,
  variant,
  size,
  value,
  max = 100,
  ...props
}: ProgressBarProps) {
  const percentage = Math.min(100, Math.max(0, (value / max) * 100))

  return (
    <div
      role="progressbar"
      aria-valuenow={value}
      aria-valuemin={0}
      aria-valuemax={max}
      className={cn(progressBarVariants({ variant, size }), className)}
      {...props}
    >
      <div
        className={fillVariants({ variant })}
        style={{ width: `${percentage}%` }}
      />
    </div>
  )
}
```

Puis ajouter dans `src/components/ui/index.ts`:
```tsx
export * from './progress-bar'
```
