'use client'

/**
 * Scan Page
 *
 * Allows users to scan their work for AI analysis.
 * Requires selecting an activity to provide context.
 */

import * as React from 'react'
import Link from 'next/link'
import { ArrowLeft, Camera, Search } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { ScanUpload } from '@/components/patterns/scan-upload'
import { useAuth } from '@/lib/context'

export default function ScanPage() {
  const { userId, isAuthenticated } = useAuth()
  const [selectedActivity, setSelectedActivity] = React.useState<{
    id: string
    moduleId: string
    title: string
  } | null>(null)

  // For now, we'll have a simple interface where users can enter activity details
  // In a full implementation, this would have a search/browse for activities
  const [activityId, setActivityId] = React.useState('')
  const [moduleId, setModuleId] = React.useState('')

  const handleSelectActivity = () => {
    if (activityId && moduleId) {
      setSelectedActivity({
        id: activityId,
        moduleId: moduleId,
        title: `Activité ${activityId}`,
      })
    }
  }

  if (!isAuthenticated) {
    return (
      <div className="container max-w-2xl py-12">
        <Card>
          <CardContent className="py-12 text-center">
            <Camera className="mx-auto mb-4 h-12 w-12 text-muted-foreground" />
            <h1 className="text-xl font-semibold">Connexion requise</h1>
            <p className="mt-2 text-muted-foreground">
              Connectez-vous pour scanner vos copies et obtenir un feedback IA.
            </p>
            <Button className="mt-6" asChild>
              <Link href="/login">Se connecter</Link>
            </Button>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="container max-w-2xl py-6">
      {/* Header */}
      <div className="mb-8">
        <h1 className="font-serif text-2xl font-semibold">Scanner ma copie</h1>
        <p className="mt-1 text-muted-foreground">
          Prenez une photo de votre travail pour obtenir une correction IA
        </p>
      </div>

      {selectedActivity ? (
        <>
          {/* Back button */}
          <Button
            variant="ghost"
            size="sm"
            className="mb-4"
            onClick={() => setSelectedActivity(null)}
          >
            <ArrowLeft className="mr-2 h-4 w-4" />
            Changer d&apos;activité
          </Button>

          {/* Activity info */}
          <Card className="mb-6">
            <CardContent className="py-4">
              <p className="text-sm text-muted-foreground">Activité sélectionnée</p>
              <p className="font-medium">{selectedActivity.title}</p>
              <p className="text-xs text-muted-foreground">
                Module: {selectedActivity.moduleId}
              </p>
            </CardContent>
          </Card>

          {/* Scan upload */}
          <ScanUpload
            activityId={selectedActivity.id}
            moduleId={selectedActivity.moduleId}
          />
        </>
      ) : (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Search className="h-5 w-5" />
              Sélectionner une activité
            </CardTitle>
          </CardHeader>
          <CardContent>
            <p className="mb-4 text-sm text-muted-foreground">
              Entrez l&apos;identifiant de l&apos;activité que vous souhaitez faire corriger.
            </p>

            <div className="space-y-4">
              <div>
                <label className="mb-1.5 block text-sm font-medium">
                  ID du module
                </label>
                <Input
                  placeholder="ex: continuite"
                  value={moduleId}
                  onChange={(e) => setModuleId(e.target.value)}
                />
              </div>

              <div>
                <label className="mb-1.5 block text-sm font-medium">
                  ID de l&apos;activité
                </label>
                <Input
                  placeholder="ex: ex-cont-01"
                  value={activityId}
                  onChange={(e) => setActivityId(e.target.value)}
                />
              </div>

              <Button
                className="w-full"
                disabled={!activityId || !moduleId}
                onClick={handleSelectActivity}
              >
                Continuer
              </Button>
            </div>

            <p className="mt-4 text-center text-xs text-muted-foreground">
              Astuce : Vous trouverez les IDs dans la page d&apos;un exercice.
            </p>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
