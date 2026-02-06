'use client'

/**
 * Profil Page
 *
 * User profile with tabs: Profil, Stats, Paramètres.
 * Shows guest state or authenticated profile.
 */

import * as React from 'react'
import { Suspense } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import {
  BookOpen,
  CheckCircle,
  GraduationCap,
  LogOut,
  Moon,
  Settings,
  Sun,
  Trophy,
  User,
} from 'lucide-react'
import { useTheme } from 'next-themes'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { Badge } from '@/components/ui/badge'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { useUserParcours, getAvailableParcours } from '@/lib/parcours'

function ProfilContent() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const { user, userId, isAuthenticated, signOut } = useAuth()
  const defaultTab = searchParams.get('tab') || 'stats'

  if (!isAuthenticated) {
    return (
      <div className="px-4 lg:px-6">
        <Card className="mx-auto max-w-md">
          <CardContent className="py-12 text-center">
            <div className="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-muted">
              <User className="h-10 w-10 text-muted-foreground" />
            </div>
            <h1 className="text-xl font-semibold">Visiteur</h1>
            <p className="mt-2 text-muted-foreground">
              Connectez-vous pour sauvegarder votre progression
            </p>
            <Button className="mt-6" size="lg" asChild>
              <Link href="/login">Se connecter</Link>
            </Button>
          </CardContent>
        </Card>
      </div>
    )
  }

  const displayName = user?.email || 'Utilisateur'
  const initials = user?.email ? user.email.charAt(0).toUpperCase() : 'U'
  const isAnonymous = user?.isAnonymous ?? false

  return (
    <div className="px-4 lg:px-6">
      {/* Header with avatar */}
      <div className="mb-6 flex items-center gap-4">
        <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary text-2xl font-semibold text-primary-foreground">
          {initials}
        </div>
        <div className="flex-1">
          <h1 className="text-xl font-semibold">{displayName}</h1>
          {isAnonymous && (
            <p className="text-sm text-muted-foreground">
              <Link href="/signup" className="text-primary underline">
                Créez un compte
              </Link>{' '}
              pour sauvegarder
            </p>
          )}
        </div>
        <Button variant="outline" size="sm" onClick={signOut}>
          <LogOut className="mr-2 h-4 w-4" />
          Déconnexion
        </Button>
      </div>

      {/* Tabs */}
      <Tabs defaultValue={defaultTab} className="w-full">
        <TabsList className="mb-6 grid w-full grid-cols-3">
          <TabsTrigger value="stats">
            <Trophy className="mr-2 h-4 w-4" />
            Stats
          </TabsTrigger>
          <TabsTrigger value="profil">
            <User className="mr-2 h-4 w-4" />
            Profil
          </TabsTrigger>
          <TabsTrigger value="settings">
            <Settings className="mr-2 h-4 w-4" />
            Paramètres
          </TabsTrigger>
        </TabsList>

        <TabsContent value="stats">
          <StatsTab userId={userId!} />
        </TabsContent>

        <TabsContent value="profil">
          <ProfilTab email={user?.email} isAnonymous={isAnonymous} />
        </TabsContent>

        <TabsContent value="settings">
          <SettingsTab />
        </TabsContent>
      </Tabs>
    </div>
  )
}

// =============================================================================
// Stats Tab
// =============================================================================

function StatsTab({ userId }: { userId: string }) {
  const { progress } = useProgress(userId)

  const stats = React.useMemo(() => {
    let completed = 0
    let success = 0
    let qcmDone = 0
    let qcmSuccess = 0
    let exercisesDone = 0
    let totalScore = 0
    let totalPossible = 0

    progress.forEach((p) => {
      completed++
      if (p.status === 'success') success++

      if (p.activityType === 'qcm') {
        qcmDone++
        if (p.status === 'success') qcmSuccess++
        if (p.score !== undefined && p.total) {
          totalScore += p.score
          totalPossible += p.total
        }
      } else if (p.activityType === 'exercise') {
        exercisesDone++
      }
    })

    const avgScore = totalPossible > 0 ? Math.round((totalScore / totalPossible) * 100) : 0
    const successRate = completed > 0 ? Math.round((success / completed) * 100) : 0

    return { completed, success, qcmDone, qcmSuccess, exercisesDone, avgScore, successRate }
  }, [progress])

  return (
    <div className="space-y-6">
      {/* Stats Grid */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Card>
          <CardContent className="py-4">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-green-100 dark:bg-green-900/30">
                <CheckCircle className="h-5 w-5 text-green-600" />
              </div>
              <div>
                <p className="text-2xl font-bold">{stats.completed}</p>
                <p className="text-sm text-muted-foreground">Activités</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="py-4">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-blue-100 dark:bg-blue-900/30">
                <GraduationCap className="h-5 w-5 text-blue-600" />
              </div>
              <div>
                <p className="text-2xl font-bold">{stats.avgScore}%</p>
                <p className="text-sm text-muted-foreground">Score QCM</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="py-4">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-amber-100 dark:bg-amber-900/30">
                <BookOpen className="h-5 w-5 text-amber-600" />
              </div>
              <div>
                <p className="text-2xl font-bold">{stats.exercisesDone}</p>
                <p className="text-sm text-muted-foreground">Exercices</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="py-4">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-purple-100 dark:bg-purple-900/30">
                <Trophy className="h-5 w-5 text-purple-600" />
              </div>
              <div>
                <p className="text-2xl font-bold">{stats.successRate}%</p>
                <p className="text-sm text-muted-foreground">Réussite</p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* QCM Details */}
      <Card>
        <CardHeader>
          <CardTitle>Détails QCM</CardTitle>
        </CardHeader>
        <CardContent className="space-y-0">
          <div className="flex items-center justify-between border-b py-3">
            <span className="text-muted-foreground">QCM complétés</span>
            <span className="font-medium">{stats.qcmDone}</span>
          </div>
          <div className="flex items-center justify-between border-b py-3">
            <span className="text-muted-foreground">QCM réussis</span>
            <span className="font-medium text-green-600">{stats.qcmSuccess}</span>
          </div>
          <div className="flex items-center justify-between py-3">
            <span className="text-muted-foreground">À revoir</span>
            <span className="font-medium text-orange-600">{stats.qcmDone - stats.qcmSuccess}</span>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}

// =============================================================================
// Profil Tab
// =============================================================================

function ProfilTab({ email, isAnonymous }: { email?: string | null; isAnonymous: boolean }) {
  const { parcours, parcoursConfig } = useUserParcours()

  return (
    <div className="space-y-6">
      <Card>
        <CardHeader>
          <CardTitle>Informations du compte</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex items-center justify-between">
            <span className="text-muted-foreground">Email</span>
            <span className="font-medium">{email || 'Non renseigné'}</span>
          </div>
          <div className="flex items-center justify-between">
            <span className="text-muted-foreground">Type de compte</span>
            <span className="font-medium">{isAnonymous ? 'Anonyme' : 'Complet'}</span>
          </div>
          <div className="flex items-center justify-between">
            <span className="text-muted-foreground">Parcours</span>
            {parcoursConfig ? (
              <Badge variant="secondary">{parcoursConfig.label}</Badge>
            ) : (
              <span className="text-muted-foreground">Non défini</span>
            )}
          </div>
        </CardContent>
      </Card>

      {isAnonymous && (
        <Card className="border-primary/20 bg-primary/5">
          <CardContent className="py-6">
            <h3 className="font-semibold">Passez à un compte complet</h3>
            <p className="mt-1 text-sm text-muted-foreground">
              Créez un compte avec email pour ne jamais perdre votre progression.
            </p>
            <Button className="mt-4" asChild>
              <Link href="/signup">Créer un compte</Link>
            </Button>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

// =============================================================================
// Settings Tab
// =============================================================================

function SettingsTab() {
  const { theme, setTheme } = useTheme()
  const router = useRouter()
  const { parcours, parcoursConfig, setParcours, isLoading } = useUserParcours()
  const availableParcours = getAvailableParcours()
  const [changingParcours, setChangingParcours] = React.useState(false)

  const handleParcoursChange = async (slug: string) => {
    setChangingParcours(true)
    try {
      await setParcours(slug)
      router.push(`/${slug}`)
    } catch (e) {
      console.error('Failed to change parcours:', e)
    } finally {
      setChangingParcours(false)
    }
  }

  return (
    <div className="space-y-6">
      <Card>
        <CardHeader>
          <CardTitle>Apparence</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex items-center justify-between">
            <div>
              <p className="font-medium">Thème</p>
              <p className="text-sm text-muted-foreground">Choisissez votre préférence</p>
            </div>
            <div className="flex gap-2">
              <Button
                variant={theme === 'light' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setTheme('light')}
              >
                <Sun className="mr-2 h-4 w-4" />
                Clair
              </Button>
              <Button
                variant={theme === 'dark' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setTheme('dark')}
              >
                <Moon className="mr-2 h-4 w-4" />
                Sombre
              </Button>
            </div>
          </div>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Parcours</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            <div>
              <p className="font-medium">Parcours actuel</p>
              <p className="text-sm text-muted-foreground">
                {isLoading ? 'Chargement...' : parcoursConfig?.label || 'Non défini'}
              </p>
            </div>
            <div>
              <p className="mb-2 text-sm font-medium">Changer de parcours</p>
              <div className="grid gap-2 sm:grid-cols-2">
                {availableParcours.map((p) => (
                  <Button
                    key={p.slug}
                    variant={parcours?.slug === p.slug ? 'default' : 'outline'}
                    size="sm"
                    disabled={changingParcours || parcours?.slug === p.slug}
                    onClick={() => handleParcoursChange(p.slug)}
                  >
                    {p.label}
                  </Button>
                ))}
              </div>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}

// =============================================================================
// Page Export with Suspense
// =============================================================================

export default function ProfilPage() {
  return (
    <Suspense fallback={<div className="px-4 lg:px-6">Chargement...</div>}>
      <ProfilContent />
    </Suspense>
  )
}
