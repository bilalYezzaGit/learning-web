/**
 * AI Hub Page
 *
 * Central dashboard for all AI-powered features.
 * Shows the tutor chat, weakness analysis, and quick access to AI tools.
 */

import { Bot, Sparkles, Lightbulb, Dices, BookOpen, Zap, FileText, BarChart3 } from 'lucide-react'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { AIHubClient } from './ai-hub-client'

interface PageProps {
  params: Promise<{ parcours: string }>
}

const AI_FEATURES = [
  {
    icon: Bot,
    title: 'Tuteur IA',
    description: 'Pose tes questions de maths à ton tuteur personnel',
    color: 'bg-blue-500/10 text-blue-600 dark:text-blue-400',
    feature: 'chat' as const,
  },
  {
    icon: Lightbulb,
    title: 'Indices progressifs',
    description: 'Obtiens des indices de plus en plus détaillés sur un exercice',
    color: 'bg-amber-500/10 text-amber-600 dark:text-amber-400',
    feature: 'hint' as const,
  },
  {
    icon: BookOpen,
    title: 'Explication pas-à-pas',
    description: 'Comprends la solution étape par étape',
    color: 'bg-green-500/10 text-green-600 dark:text-green-400',
    feature: 'explain' as const,
  },
  {
    icon: Dices,
    title: 'Générateur d\'exercices',
    description: 'Génère des exercices similaires pour t\'entraîner',
    color: 'bg-purple-500/10 text-purple-600 dark:text-purple-400',
    feature: 'generate' as const,
  },
  {
    icon: Zap,
    title: 'Simplificateur',
    description: 'Comprends les concepts avec des analogies simples',
    color: 'bg-red-500/10 text-red-600 dark:text-red-400',
    feature: 'simplify' as const,
  },
  {
    icon: FileText,
    title: 'Fiches de révision',
    description: 'Génère des fiches de révision à partir des leçons',
    color: 'bg-cyan-500/10 text-cyan-600 dark:text-cyan-400',
    feature: 'summary' as const,
  },
  {
    icon: BarChart3,
    title: 'Analyse des faiblesses',
    description: 'Identifie tes points forts et faibles avec un plan d\'étude',
    color: 'bg-orange-500/10 text-orange-600 dark:text-orange-400',
    feature: 'weakness' as const,
  },
]

export default async function AIHubPage({ params }: PageProps) {
  const { parcours } = await params

  return (
    <div className="px-4 lg:px-6">
      {/* Header */}
      <div className="mb-6">
        <div className="flex items-center gap-3">
          <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-primary text-primary-foreground">
            <Sparkles className="h-6 w-6" />
          </div>
          <div>
            <h1 className="text-xl font-bold">Assistant IA</h1>
            <p className="text-sm text-muted-foreground">
              Ton compagnon d&apos;apprentissage intelligent
            </p>
          </div>
        </div>
      </div>

      {/* Feature grid */}
      <div className="mb-6 grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {AI_FEATURES.map((feature) => (
          <Card key={feature.feature} className="transition-colors hover:bg-muted/50">
            <CardHeader className="pb-2">
              <div className="flex items-center gap-3">
                <div className={`flex h-9 w-9 items-center justify-center rounded-lg ${feature.color}`}>
                  <feature.icon className="h-4 w-4" aria-hidden="true" />
                </div>
                <div>
                  <CardTitle className="text-sm">{feature.title}</CardTitle>
                </div>
              </div>
            </CardHeader>
            <CardContent className="pt-0">
              <CardDescription className="text-xs">{feature.description}</CardDescription>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Interactive section */}
      <AIHubClient parcours={parcours} />
    </div>
  )
}
