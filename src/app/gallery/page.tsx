'use client'

import * as React from 'react'
import {
  BookOpen,
  Check,
  ChevronRight,
  Home,
  Settings,
  User,
} from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Badge } from '@/components/ui/badge'
import { Skeleton } from '@/components/ui/skeleton'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { Separator } from '@/components/ui/separator'

import { Chip } from '@/components/ui/chip'
import { Icon } from '@/components/ui/icon'
import { ModuleCard } from '@/components/patterns/module-card'
import { ActivityCard } from '@/components/patterns/activity-card'
import { SearchBar } from '@/components/patterns/search-bar'
import { QCMOption } from '@/components/qcm/qcm-option'
import { QCMQuestion } from '@/components/qcm/qcm-question'
import { QCMResult } from '@/components/qcm/qcm-result'
import { ContentRenderer } from '@/content'

export default function GalleryPage() {
  const [searchValue, setSearchValue] = React.useState('')

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="sticky top-0 z-50 border-b bg-background/95 backdrop-blur">
        <div className="container flex h-14 items-center">
          <h1 className="font-serif text-xl font-semibold text-primary">
            Component Gallery
          </h1>
        </div>
      </header>

      <main className="container py-8">
        <Tabs defaultValue="atoms" className="space-y-8">
          <TabsList>
            <TabsTrigger value="atoms">Atoms</TabsTrigger>
            <TabsTrigger value="molecules">Molecules</TabsTrigger>
            <TabsTrigger value="organisms">Organisms</TabsTrigger>
            <TabsTrigger value="qcm">QCM</TabsTrigger>
            <TabsTrigger value="content">Content</TabsTrigger>
          </TabsList>

          {/* ATOMS */}
          <TabsContent value="atoms" className="space-y-8">
            {/* Buttons */}
            <Section title="Button">
              <div className="flex flex-wrap gap-4">
                <Button>Default</Button>
                <Button variant="secondary">Secondary</Button>
                <Button variant="outline">Outline</Button>
                <Button variant="ghost">Ghost</Button>
                <Button variant="destructive">Destructive</Button>
                <Button variant="link">Link</Button>
              </div>
              <div className="flex flex-wrap gap-4">
                <Button size="sm">Small</Button>
                <Button size="default">Default</Button>
                <Button size="lg">Large</Button>
                <Button size="icon">
                  <Settings className="h-4 w-4" />
                </Button>
              </div>
            </Section>

            <Separator />

            {/* Input */}
            <Section title="Input">
              <div className="grid max-w-sm gap-4">
                <div className="space-y-2">
                  <Label htmlFor="email">Email</Label>
                  <Input id="email" type="email" placeholder="email@example.com" />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="disabled">Disabled</Label>
                  <Input id="disabled" disabled placeholder="Disabled input" />
                </div>
              </div>
            </Section>

            <Separator />

            {/* Badge */}
            <Section title="Badge">
              <div className="flex flex-wrap gap-4">
                <Badge>Default</Badge>
                <Badge variant="secondary">Secondary</Badge>
                <Badge variant="outline">Outline</Badge>
                <Badge variant="destructive">Destructive</Badge>
              </div>
            </Section>

            <Separator />

            {/* Chip */}
            <Section title="Chip (Custom)">
              <div className="flex flex-wrap gap-4">
                <Chip>Default</Chip>
                <Chip variant="primary">Primary</Chip>
                <Chip variant="outline">Outline</Chip>
                <Chip variant="success">Success</Chip>
                <Chip variant="warning">Warning</Chip>
                <Chip variant="destructive">Destructive</Chip>
              </div>
              <div className="flex flex-wrap gap-4">
                <Chip size="sm">Small</Chip>
                <Chip size="md">Medium</Chip>
                <Chip size="lg">Large</Chip>
              </div>
              <div className="flex flex-wrap gap-4">
                <Chip selected>Selected</Chip>
                <Chip removable onRemove={() => alert('Removed!')}>
                  Removable
                </Chip>
              </div>
            </Section>

            <Separator />

            {/* Icon */}
            <Section title="Icon (Custom)">
              <div className="flex flex-wrap items-center gap-4">
                <Icon icon={Home} size="xs" />
                <Icon icon={Home} size="sm" />
                <Icon icon={Home} size="md" />
                <Icon icon={Home} size="lg" />
                <Icon icon={Home} size="xl" />
              </div>
            </Section>

            <Separator />

            {/* Skeleton */}
            <Section title="Skeleton">
              <div className="space-y-4">
                <Skeleton className="h-4 w-64" />
                <Skeleton className="h-4 w-48" />
                <div className="flex items-center gap-4">
                  <Skeleton className="h-12 w-12 rounded-full" />
                  <div className="space-y-2">
                    <Skeleton className="h-4 w-32" />
                    <Skeleton className="h-4 w-24" />
                  </div>
                </div>
              </div>
            </Section>
          </TabsContent>

          {/* MOLECULES */}
          <TabsContent value="molecules" className="space-y-8">
            {/* Card */}
            <Section title="Card">
              <div className="grid max-w-md gap-4">
                <Card>
                  <CardHeader>
                    <CardTitle>Card Title</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="text-muted-foreground">
                      This is the card content. Cards can contain any content.
                    </p>
                  </CardContent>
                </Card>
              </div>
            </Section>

            <Separator />

            {/* Progress */}
            <Section title="Progress">
              <div className="grid max-w-md gap-4">
                <Progress value={0} />
                <Progress value={25} />
                <Progress value={50} />
                <Progress value={75} />
                <Progress value={100} />
              </div>
            </Section>

            <Separator />

            {/* SearchBar */}
            <Section title="SearchBar (Custom)">
              <div className="max-w-md">
                <SearchBar
                  value={searchValue}
                  onChange={setSearchValue}
                  onSearch={(v) => console.log('Search:', v)}
                  placeholder="Rechercher un module..."
                />
                <p className="mt-2 text-sm text-muted-foreground">
                  Value: {searchValue || '(empty)'}
                </p>
              </div>
            </Section>

            <Separator />

            {/* ModuleCard */}
            <Section title="ModuleCard (Custom)">
              <div className="grid max-w-sm gap-4">
                <ModuleCard
                  title="Les fonctions"
                  description="Découvrez les fonctions mathématiques et leurs propriétés."
                  progress={65}
                  activityCount={12}
                  onClick={() => alert('Module clicked!')}
                />
                <ModuleCard
                  title="Module sans image"
                  progress={0}
                  activityCount={8}
                />
              </div>
            </Section>

            <Separator />

            {/* ActivityCard */}
            <Section title="ActivityCard (Custom)">
              <div className="grid max-w-md gap-2">
                <ActivityCard
                  title="Introduction aux fonctions"
                  type="cours"
                  status="completed"
                  duration="10 min"
                />
                <ActivityCard
                  title="Exercices de base"
                  type="exercice"
                  status="in_progress"
                  duration="15 min"
                />
                <ActivityCard
                  title="QCM de révision"
                  type="qcm"
                  status="available"
                  duration="5 min"
                />
                <ActivityCard
                  title="Exercices avancés"
                  type="exercice"
                  status="locked"
                  duration="20 min"
                />
              </div>
            </Section>
          </TabsContent>

          {/* ORGANISMS */}
          <TabsContent value="organisms" className="space-y-8">
            <Section title="Header, Sidebar, BottomNav">
              <p className="text-muted-foreground">
                Ces composants sont des layouts qui s&apos;affichent au niveau de
                l&apos;application. Voir les pages principales pour les visualiser.
              </p>
            </Section>

            <Separator />

            <Section title="ModuleList">
              <p className="text-muted-foreground">
                Grille responsive de ModuleCard. Utilisé sur la page /cours.
              </p>
            </Section>

            <Separator />

            <Section title="ActivityList">
              <p className="text-muted-foreground">
                Liste verticale d&apos;ActivityCard. Utilisé sur la page de détail
                d&apos;un module.
              </p>
            </Section>
          </TabsContent>

          {/* CONTENT */}
          <TabsContent value="content" className="space-y-8">
            {/* Math */}
            <Section title="Math (KaTeX)">
              <div className="space-y-4">
                <p className="text-muted-foreground">Inline math:</p>
                <ContentRenderer
                  html="<p>La formule <math>x^2 + y^2 = r^2</math> représente un cercle de rayon <math>r</math>.</p>"
                />
                <p className="text-muted-foreground">Block math:</p>
                <ContentRenderer
                  html="<math-block>\\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}</math-block>"
                />
                <ContentRenderer
                  html="<math-block>\\int_0^\\infty e^{-x^2} dx = \\frac{\\sqrt{\\pi}}{2}</math-block>"
                />
              </div>
            </Section>

            <Separator />

            {/* Graph */}
            <Section title="Graph (Recharts)">
              <div className="space-y-4">
                <p className="text-muted-foreground">Fonction quadratique:</p>
                <ContentRenderer
                  html='<graph function="x^2-2*x-1" range="[-2,4]"/>'
                />
                <p className="text-muted-foreground">Fonction avec formule cachée:</p>
                <ContentRenderer
                  html='<graph function="sin(x)" range="[-6.28,6.28]" hide-formula="true"/>'
                />
              </div>
            </Section>

            <Separator />

            {/* Variations */}
            <Section title="Variations Table">
              <div className="space-y-4">
                <p className="text-muted-foreground">Table de signes:</p>
                <ContentRenderer
                  html={`<variations var="x" intervals="[-∞,-2,1,+∞]">
                    <row label="(x-1)(x+2)" kind="sign" values="[+,0,-,0,+]"/>
                  </variations>`}
                />
                <p className="text-muted-foreground">Table de variations:</p>
                <ContentRenderer
                  html={`<variations var="x" intervals="[-∞,0,2,+∞]">
                    <row label="f'(x)" kind="sign" values="[+,0,-,0,+]"/>
                    <row label="f" kind="var" values="[-∞,3,-1,+∞]"/>
                  </variations>`}
                />
              </div>
            </Section>

            <Separator />

            {/* YouTube */}
            <Section title="YouTube Embed">
              <ContentRenderer
                html='<youtube id="dQw4w9WgXcQ" title="Exemple de vidéo YouTube"/>'
              />
            </Section>

            <Separator />

            {/* Combined */}
            <Section title="Combined Content">
              <ContentRenderer
                html={`
                  <h2>Dérivée d'une fonction</h2>
                  <p>La dérivée de <math>f(x) = x^2</math> est <math>f'(x) = 2x</math>.</p>
                  <p>Formule générale de la dérivée d'une puissance:</p>
                  <math-block>\\frac{d}{dx}(x^n) = nx^{n-1}</math-block>
                  <p>Voici le graphe de <math>f(x) = x^2</math>:</p>
                  <graph function="x^2" range="[-3,3]"/>
                `}
              />
            </Section>
          </TabsContent>

          {/* QCM */}
          <TabsContent value="qcm" className="space-y-8">
            {/* QCMOption */}
            <Section title="QCMOption">
              <div className="grid max-w-md gap-2">
                <QCMOption label="Option par défaut" index={0} state="default" />
                <QCMOption label="Option sélectionnée" index={1} state="selected" />
                <QCMOption
                  label="Réponse correcte"
                  index={2}
                  state="correct"
                  showResult
                />
                <QCMOption
                  label="Réponse incorrecte"
                  index={3}
                  state="incorrect"
                  showResult
                />
              </div>
            </Section>

            <Separator />

            {/* QCMQuestion */}
            <Section title="QCMQuestion">
              <div className="max-w-lg">
                <QCMQuestion
                  questionNumber={1}
                  questionText="Quelle est la dérivée de f(x) = x² ?"
                  options={[
                    { id: 'a', label: "f'(x) = x" },
                    { id: 'b', label: "f'(x) = 2x" },
                    { id: 'c', label: "f'(x) = 2" },
                    { id: 'd', label: "f'(x) = x²" },
                  ]}
                  selectedOptionId="b"
                  correctOptionId="b"
                  showResult
                />
              </div>
            </Section>

            <Separator />

            {/* QCMResult */}
            <Section title="QCMResult">
              <div className="max-w-md">
                <QCMResult
                  score={8}
                  totalQuestions={10}
                  timeSpent="3:45"
                  onReview={() => alert('Review clicked!')}
                  onRetry={() => alert('Retry clicked!')}
                />
              </div>
            </Section>
          </TabsContent>
        </Tabs>
      </main>
    </div>
  )
}

function Section({
  title,
  children,
}: {
  title: string
  children: React.ReactNode
}) {
  return (
    <section className="space-y-4">
      <h2 className="font-serif text-xl font-semibold">{title}</h2>
      {children}
    </section>
  )
}
