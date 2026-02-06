'use client'

import { useRouter, useSearchParams } from 'next/navigation'
import { useTransition } from 'react'

import { Input } from '@/components/ui/input'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'
import { Badge } from '@/components/ui/badge'
import type { AtomType } from '@/types/content'

const TYPE_OPTIONS: { value: AtomType; label: string }[] = [
  { value: 'lesson', label: 'Cours' },
  { value: 'exercise', label: 'Exercice' },
  { value: 'qcm', label: 'QCM' },
]

interface AtomFiltersProps {
  allTags: [string, number][]
}

export function AtomFilters({ allTags }: AtomFiltersProps) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [isPending, startTransition] = useTransition()

  const q = searchParams.get('q') ?? ''
  const activeTypes = searchParams.getAll('type')
  const activeTags = searchParams.getAll('tags')

  function navigate(updates: Record<string, string | string[] | null>) {
    const params = new URLSearchParams(searchParams.toString())

    // Remove atom selection when filters change
    params.delete('atom')

    for (const [key, value] of Object.entries(updates)) {
      params.delete(key)
      if (value === null) continue
      if (Array.isArray(value)) {
        for (const v of value) params.append(key, v)
      } else if (value) {
        params.set(key, value)
      }
    }

    startTransition(() => {
      router.push(`/admin/content?${params.toString()}`)
    })
  }

  function handleSearchChange(e: React.ChangeEvent<HTMLInputElement>) {
    navigate({ q: e.target.value || null })
  }

  function handleTypeToggle(type: AtomType, checked: boolean) {
    const next = checked
      ? [...activeTypes, type]
      : activeTypes.filter(t => t !== type)
    navigate({ type: next.length > 0 ? next : null })
  }

  function handleTagToggle(tag: string) {
    const next = activeTags.includes(tag)
      ? activeTags.filter(t => t !== tag)
      : [...activeTags, tag]
    navigate({ tags: next.length > 0 ? next : null })
  }

  return (
    <div className={`space-y-4 ${isPending ? 'opacity-70' : ''}`}>
      <Input
        placeholder="Rechercher par ID ou titre…"
        defaultValue={q}
        onChange={handleSearchChange}
      />

      <div className="flex items-center gap-4">
        {TYPE_OPTIONS.map(opt => (
          <div key={opt.value} className="flex items-center gap-1.5">
            <Checkbox
              id={`type-${opt.value}`}
              checked={activeTypes.includes(opt.value)}
              onCheckedChange={(checked) =>
                handleTypeToggle(opt.value, checked === true)
              }
            />
            <Label htmlFor={`type-${opt.value}`} className="text-sm">
              {opt.label}
            </Label>
          </div>
        ))}
      </div>

      {allTags.length > 0 && (
        <div className="flex flex-wrap gap-1.5">
          {allTags.map(([tag, count]) => (
            <button key={tag} onClick={() => handleTagToggle(tag)}>
              <Badge
                variant={activeTags.includes(tag) ? 'default' : 'outline'}
              >
                {tag} ({count})
              </Badge>
            </button>
          ))}
        </div>
      )}
    </div>
  )
}
