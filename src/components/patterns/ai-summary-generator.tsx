'use client'

/**
 * AI Summary / Revision Sheet Generator
 *
 * Generates comprehensive revision sheets from lesson content.
 * Includes formulas, definitions, mnemonics, and review questions.
 */

import * as React from 'react'
import { FileText, Loader2, BookMarked, Calculator, Brain, HelpCircle } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader } from '@/components/ui/card'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { cn } from '@/lib/utils'
import { generateSummary, AIError } from '@/lib/services/ai-service'
import { trackAISummaryGenerated } from '@/lib/services/analytics-service'
import type { SummaryResponse } from '@/types/ai'

interface AISummaryGeneratorProps {
  lessonContent: string
  title: string
  className?: string
}

export function AISummaryGenerator({ lessonContent, title, className }: AISummaryGeneratorProps) {
  const [summary, setSummary] = React.useState<SummaryResponse | null>(null)
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  const handleGenerate = async () => {
    setIsLoading(true)
    setError(null)

    try {
      trackAISummaryGenerated(title)
      const result = await generateSummary({
        lessonContent,
        title,
        includeFormulas: true,
        includeExamples: true,
      })
      setSummary(result)
    } catch (e) {
      const msg = e instanceof AIError ? e.message : 'Erreur lors de la génération'
      setError(msg)
    } finally {
      setIsLoading(false)
    }
  }

  if (!summary) {
    return (
      <div className={cn(className)}>
        <Button
          variant="outline"
          size="sm"
          onClick={handleGenerate}
          disabled={isLoading}
          className="gap-2"
        >
          {isLoading ? (
            <Loader2 className="h-4 w-4 animate-spin" />
          ) : (
            <FileText className="h-4 w-4" />
          )}
          {isLoading ? 'Génération de la fiche...' : 'Générer une fiche de révision'}
        </Button>
        {error && <p className="mt-1 text-xs text-destructive">{error}</p>}
      </div>
    )
  }

  return (
    <Card className={cn(className)}>
      <CardHeader className="px-4 py-3">
        <div className="flex items-center gap-2">
          <FileText className="h-4 w-4 text-primary" />
          <h3 className="text-sm font-semibold">Fiche de révision : {title}</h3>
        </div>
      </CardHeader>
      <CardContent className="px-4 pb-4 pt-0">
        <Tabs defaultValue="resume">
          <TabsList className="w-full">
            <TabsTrigger value="resume" className="flex-1 gap-1 text-xs">
              <BookMarked className="h-3 w-3" />
              Résumé
            </TabsTrigger>
            <TabsTrigger value="formules" className="flex-1 gap-1 text-xs">
              <Calculator className="h-3 w-3" />
              Formules
            </TabsTrigger>
            <TabsTrigger value="astuces" className="flex-1 gap-1 text-xs">
              <Brain className="h-3 w-3" />
              Astuces
            </TabsTrigger>
            <TabsTrigger value="quiz" className="flex-1 gap-1 text-xs">
              <HelpCircle className="h-3 w-3" />
              Quiz
            </TabsTrigger>
          </TabsList>

          {/* Résumé tab */}
          <TabsContent value="resume" className="mt-3">
            <div className="prose prose-sm dark:prose-invert max-w-none text-sm whitespace-pre-wrap">
              {summary.summary}
            </div>

            {summary.keyDefinitions.length > 0 && (
              <div className="mt-4 space-y-2">
                <h4 className="text-xs font-semibold text-muted-foreground uppercase">
                  Définitions clés
                </h4>
                {summary.keyDefinitions.map((def, i) => (
                  <div key={i} className="rounded-lg border p-2.5">
                    <span className="text-xs font-bold text-primary">{def.term}</span>
                    <p className="mt-0.5 text-xs text-foreground/80">{def.definition}</p>
                  </div>
                ))}
              </div>
            )}
          </TabsContent>

          {/* Formules tab */}
          <TabsContent value="formules" className="mt-3">
            {summary.keyFormulas.length > 0 ? (
              <div className="space-y-2">
                {summary.keyFormulas.map((formula, i) => (
                  <div
                    key={i}
                    className="rounded-lg border bg-muted/30 p-3 text-center text-sm"
                  >
                    {formula}
                  </div>
                ))}
              </div>
            ) : (
              <p className="py-4 text-center text-sm text-muted-foreground">
                Aucune formule clé identifiée
              </p>
            )}
          </TabsContent>

          {/* Astuces tab */}
          <TabsContent value="astuces" className="mt-3">
            {summary.mnemonics.length > 0 ? (
              <div className="space-y-2">
                {summary.mnemonics.map((mnemonic, i) => (
                  <div
                    key={i}
                    className="flex items-start gap-2 rounded-lg border bg-amber-500/5 p-3"
                  >
                    <Brain className="mt-0.5 h-4 w-4 shrink-0 text-amber-600 dark:text-amber-400" />
                    <p className="text-sm text-foreground/90">{mnemonic}</p>
                  </div>
                ))}
              </div>
            ) : (
              <p className="py-4 text-center text-sm text-muted-foreground">
                Aucune astuce disponible
              </p>
            )}
          </TabsContent>

          {/* Quiz tab */}
          <TabsContent value="quiz" className="mt-3">
            {summary.reviewQuestions.length > 0 ? (
              <div className="space-y-2">
                {summary.reviewQuestions.map((question, i) => (
                  <div
                    key={i}
                    className="flex items-start gap-2 rounded-lg border p-3"
                  >
                    <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-primary/10 text-[10px] font-bold text-primary">
                      {i + 1}
                    </span>
                    <p className="text-sm text-foreground/90">{question}</p>
                  </div>
                ))}
              </div>
            ) : (
              <p className="py-4 text-center text-sm text-muted-foreground">
                Aucune question de révision
              </p>
            )}
          </TabsContent>
        </Tabs>

        <Button
          variant="ghost"
          size="sm"
          onClick={() => setSummary(null)}
          className="mt-4 w-full text-xs"
        >
          Fermer la fiche
        </Button>
      </CardContent>
    </Card>
  )
}
