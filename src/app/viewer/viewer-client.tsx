'use client'

import { useCallback, useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import {
  BookOpen,
  Check,
  Clock,
  FileText,
  Loader2,
  ListChecks,
  Target,
  Hash,
  Layers,
  BarChart3,
  X,
} from 'lucide-react'
import { toast } from 'sonner'

import { Badge } from '@/components/ui/badge'
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbList,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectLabel,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { Separator } from '@/components/ui/separator'

import type { MoleculeEntry } from './page'
import type { ResolvedActivity } from '@/types/content'

// ─── Atom content types ──────────────────────────────────────────────
interface AtomHtml {
  type: 'html'
  id: string
  html: string
}

interface QcmData {
  id: string
  enonce: string
  options: string[]
  correctIndex: number
  explication?: string
  timeMinutes: number
}

interface AtomQcm {
  type: 'qcm'
  id: string
  qcm: QcmData
}

type AtomContent = AtomHtml | AtomQcm

// ─── Props ───────────────────────────────────────────────────────────
interface ViewerClientProps {
  programmes: { id: string; label: string }[]
  molecules: MoleculeEntry[]
}

export function ViewerClient({ programmes, molecules }: ViewerClientProps) {
  const router = useRouter()
  const [selectedProgrammeId, setSelectedProgrammeId] = useState(
    programmes[0]?.id ?? '',
  )
  const filteredMolecules = molecules.filter(
    (m) => m.programmeId === selectedProgrammeId,
  )
  const [selectedSlug, setSelectedSlug] = useState(
    filteredMolecules[0]?.slug ?? '',
  )
  const [isToggling, setIsToggling] = useState(false)

  // Atom viewer state
  const [selectedActivityId, setSelectedActivityId] = useState<string | null>(
    null,
  )
  const [atomContent, setAtomContent] = useState<AtomContent | null>(null)
  const [isLoadingAtom, setIsLoadingAtom] = useState(false)

  const cours = filteredMolecules.filter((m) => m.kind === 'cours')
  const series = filteredMolecules.filter((m) => m.kind === 'serie')
  const selected = molecules.find((m) => m.slug === selectedSlug) ?? null

  // Collect all activities for the selected molecule
  const allActivities: ResolvedActivity[] = selected
    ? selected.sections
      ? selected.sections.flatMap((s) => s.activities)
      : selected.activities ?? []
    : []

  // Fetch atom content when an activity is selected
  const fetchAtom = useCallback(async (activityId: string) => {
    setIsLoadingAtom(true)
    setAtomContent(null)
    try {
      const res = await fetch(`/api/content/atom/${activityId}`)
      if (!res.ok) throw new Error(`HTTP ${res.status}`)
      const data = (await res.json()) as AtomContent
      setAtomContent(data)
    } catch {
      toast.error(`Impossible de charger l'atome "${activityId}"`)
    } finally {
      setIsLoadingAtom(false)
    }
  }, [])

  // Auto-fetch when activity changes
  useEffect(() => {
    if (selectedActivityId) {
      fetchAtom(selectedActivityId)
    } else {
      setAtomContent(null)
    }
  }, [selectedActivityId, fetchAtom])

  // Reset activity selection when molecule changes
  useEffect(() => {
    setSelectedActivityId(null)
  }, [selectedSlug])

  function handleProgrammeChange(id: string) {
    setSelectedProgrammeId(id)
    const first = molecules.find((m) => m.programmeId === id)
    setSelectedSlug(first?.slug ?? '')
    setSelectedActivityId(null)
  }

  async function handleToggleVisible() {
    if (!selected || isToggling) return
    setIsToggling(true)
    try {
      const res = await fetch('/api/content/toggle-visible', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          slug: selected.slug,
          kind: selected.kind,
          programmeId: selected.programmeId,
        }),
      })
      if (!res.ok) {
        const data = (await res.json()) as { error?: string }
        throw new Error(data.error ?? `HTTP ${res.status}`)
      }
      router.refresh()
    } catch (e) {
      const message = e instanceof Error ? e.message : 'Toggle failed'
      toast.error(message)
    } finally {
      setIsToggling(false)
    }
  }

  return (
    <div className="mx-auto w-full max-w-7xl p-6">
      {/* Breadcrumb bar */}
      <div className="mb-6 flex flex-wrap items-center gap-3 border-b pb-4">
        <Breadcrumb>
          <BreadcrumbList>
            <BreadcrumbItem>
              <Select
                value={selectedProgrammeId}
                onValueChange={handleProgrammeChange}
              >
                <SelectTrigger size="sm">
                  <SelectValue placeholder="Programme" />
                </SelectTrigger>
                <SelectContent>
                  {programmes.map((p) => (
                    <SelectItem key={p.id} value={p.id}>
                      {p.label}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <Select value={selectedSlug} onValueChange={setSelectedSlug}>
                <SelectTrigger size="sm">
                  <SelectValue placeholder="Molecule" />
                </SelectTrigger>
                <SelectContent>
                  {cours.length > 0 && (
                    <SelectGroup>
                      <SelectLabel>Cours</SelectLabel>
                      {cours.map((m) => (
                        <SelectItem key={m.slug} value={m.slug}>
                          {m.title}
                        </SelectItem>
                      ))}
                    </SelectGroup>
                  )}
                  {series.length > 0 && (
                    <SelectGroup>
                      <SelectLabel>Series</SelectLabel>
                      {series.map((m) => (
                        <SelectItem key={m.slug} value={m.slug}>
                          {m.title}
                        </SelectItem>
                      ))}
                    </SelectGroup>
                  )}
                </SelectContent>
              </Select>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {selected && (
          <div className="flex items-center gap-2">
            <Badge variant="secondary">
              {selected.kind === 'cours' ? 'Cours' : 'Serie'}
            </Badge>
            <button
              type="button"
              onClick={handleToggleVisible}
              disabled={isToggling}
              className="cursor-pointer"
            >
              <Badge variant={selected.visible ? 'default' : 'destructive'}>
                {isToggling ? (
                  <Loader2 className="size-3 animate-spin" aria-hidden />
                ) : selected.visible ? (
                  'Visible'
                ) : (
                  'Masque'
                )}
              </Badge>
            </button>
          </div>
        )}
      </div>

      {/* Split layout */}
      {selected ? (
        <div className="grid gap-6 lg:grid-cols-[340px_1fr]">
          {/* Left panel: molecule info + activity list */}
          <div className="space-y-4">
            {/* Molecule metadata card */}
            <Card>
              <CardHeader className="pb-0">
                <CardTitle className="text-lg">{selected.title}</CardTitle>
                <p className="text-muted-foreground text-sm">
                  {selected.description}
                </p>
              </CardHeader>
              <CardContent className="space-y-3">
                <div className="flex flex-wrap gap-1.5">
                  {selected.trimester && (
                    <Badge variant="outline">
                      <Hash className="size-3" aria-hidden />
                      T{selected.trimester}
                    </Badge>
                  )}
                  {selected.order != null && (
                    <Badge variant="outline">
                      <Layers className="size-3" aria-hidden />
                      Ordre {selected.order}
                    </Badge>
                  )}
                  <Badge variant="outline">
                    <Clock className="size-3" aria-hidden />
                    {selected.estimatedMinutes} min
                  </Badge>
                  <Badge variant="outline">
                    <ListChecks className="size-3" aria-hidden />
                    {selected.totalActivities} activites
                  </Badge>
                  {selected.difficulty != null && (
                    <Badge variant="outline">
                      <BarChart3 className="size-3" aria-hidden />
                      Diff. {selected.difficulty}
                    </Badge>
                  )}
                  {selected.type && (
                    <Badge variant="outline">{selected.type}</Badge>
                  )}
                </div>

                {selected.modules && selected.modules.length > 0 && (
                  <div className="flex flex-wrap gap-1">
                    {selected.modules.map((mod) => (
                      <Badge key={mod} variant="secondary">
                        {mod}
                      </Badge>
                    ))}
                  </div>
                )}

                {selected.tags && selected.tags.length > 0 && (
                  <div className="flex flex-wrap gap-1">
                    {selected.tags.map((tag) => (
                      <Badge key={tag} variant="secondary">
                        {tag}
                      </Badge>
                    ))}
                  </div>
                )}

                {selected.objectives && selected.objectives.length > 0 && (
                  <>
                    <Separator />
                    <div>
                      <h3 className="mb-1.5 flex items-center gap-1.5 text-xs font-medium">
                        <Target className="size-3" aria-hidden />
                        Objectifs
                      </h3>
                      <ul className="text-muted-foreground list-inside list-disc space-y-0.5 text-xs">
                        {selected.objectives.map((obj) => (
                          <li key={obj}>{obj}</li>
                        ))}
                      </ul>
                    </div>
                  </>
                )}
              </CardContent>
            </Card>

            {/* Activity list */}
            <Card>
              <CardHeader className="pb-0">
                <CardTitle className="text-sm">Activites</CardTitle>
              </CardHeader>
              <CardContent>
                {selected.sections ? (
                  <div className="space-y-3">
                    {selected.sections.map((section) => (
                      <div key={section.id}>
                        <h4 className="text-muted-foreground mb-1 flex items-center gap-1 text-xs font-medium">
                          <BookOpen className="size-3" aria-hidden />
                          {section.label}
                        </h4>
                        <div className="space-y-0.5">
                          {section.activities.map((activity) => (
                            <ActivityRow
                              key={activity.id}
                              activity={activity}
                              isSelected={
                                selectedActivityId === activity.id
                              }
                              onClick={() =>
                                setSelectedActivityId(
                                  selectedActivityId === activity.id
                                    ? null
                                    : activity.id,
                                )
                              }
                            />
                          ))}
                        </div>
                      </div>
                    ))}
                  </div>
                ) : (
                  <div className="space-y-0.5">
                    {allActivities.map((activity) => (
                      <ActivityRow
                        key={activity.id}
                        activity={activity}
                        isSelected={selectedActivityId === activity.id}
                        onClick={() =>
                          setSelectedActivityId(
                            selectedActivityId === activity.id
                              ? null
                              : activity.id,
                          )
                        }
                      />
                    ))}
                  </div>
                )}
              </CardContent>
            </Card>
          </div>

          {/* Right panel: atom content */}
          <Card className="min-h-[400px]">
            {selectedActivityId ? (
              <>
                <CardHeader className="flex-row items-center justify-between pb-0">
                  <CardTitle className="text-sm font-medium">
                    {selectedActivityId}
                  </CardTitle>
                  <button
                    type="button"
                    onClick={() => setSelectedActivityId(null)}
                    className="text-muted-foreground hover:text-foreground cursor-pointer"
                  >
                    <X className="size-4" aria-hidden />
                  </button>
                </CardHeader>
                <CardContent>
                  {isLoadingAtom ? (
                    <div className="flex items-center justify-center py-12">
                      <Loader2
                        className="text-muted-foreground size-6 animate-spin"
                        aria-hidden
                      />
                    </div>
                  ) : atomContent?.type === 'html' ? (
                    <article
                      className="prose prose-stone dark:prose-invert max-w-none"
                      dangerouslySetInnerHTML={{ __html: atomContent.html }}
                    />
                  ) : atomContent?.type === 'qcm' ? (
                    <QcmPreview qcm={atomContent.qcm} />
                  ) : null}
                </CardContent>
              </>
            ) : (
              <CardContent className="flex h-full items-center justify-center py-12">
                <div className="text-muted-foreground text-center">
                  <FileText
                    className="mx-auto mb-2 size-8 opacity-50"
                    aria-hidden
                  />
                  <p className="text-sm">
                    Cliquer sur une activite pour voir son contenu
                  </p>
                </div>
              </CardContent>
            )}
          </Card>
        </div>
      ) : (
        <Card>
          <CardContent className="py-12 text-center">
            <p className="text-muted-foreground">Aucune molecule trouvee.</p>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

// ─── Sub-components ──────────────────────────────────────────────────

function ActivityRow({
  activity,
  isSelected,
  onClick,
}: {
  activity: ResolvedActivity
  isSelected: boolean
  onClick: () => void
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`flex w-full cursor-pointer items-center gap-2 rounded-md px-2 py-1.5 text-left text-sm transition-colors ${
        isSelected
          ? 'bg-accent text-accent-foreground'
          : 'text-muted-foreground hover:bg-muted'
      }`}
    >
      <Badge variant="outline" className="shrink-0 text-xs">
        {activity.type}
      </Badge>
      <span className="min-w-0 truncate">{activity.id}</span>
      <span className="ml-auto shrink-0 text-xs">{activity.timeMinutes}m</span>
    </button>
  )
}

function QcmPreview({ qcm }: { qcm: QcmData }) {
  return (
    <div className="space-y-4">
      <div
        className="prose prose-stone dark:prose-invert max-w-none text-sm font-medium"
        dangerouslySetInnerHTML={{ __html: qcm.enonce }}
      />
      <div className="space-y-2">
        {qcm.options.map((option, i) => (
          <div
            key={i}
            className={`flex items-start gap-2 rounded-md border p-3 text-sm ${
              i === qcm.correctIndex
                ? 'border-emerald-500/50 bg-emerald-50 dark:bg-emerald-950/20'
                : ''
            }`}
          >
            <span className="mt-0.5 shrink-0">
              {i === qcm.correctIndex ? (
                <Check className="size-4 text-emerald-600" aria-hidden />
              ) : (
                <X
                  className="text-muted-foreground size-4 opacity-30"
                  aria-hidden
                />
              )}
            </span>
            <div
              className="prose prose-stone dark:prose-invert prose-sm max-w-none"
              dangerouslySetInnerHTML={{ __html: option }}
            />
          </div>
        ))}
      </div>
      {qcm.explication && (
        <>
          <Separator />
          <div>
            <h4 className="mb-1 text-xs font-medium">Explication</h4>
            <div
              className="prose prose-stone dark:prose-invert prose-sm text-muted-foreground max-w-none"
              dangerouslySetInnerHTML={{ __html: qcm.explication }}
            />
          </div>
        </>
      )}
    </div>
  )
}
