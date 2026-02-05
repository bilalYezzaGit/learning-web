'use client'

/**
 * Profil Page
 *
 * User profile with stats and settings.
 * Shows guest state or authenticated profile with real stats.
 */

import * as React from 'react'
import Link from 'next/link'
import { BookOpen, Camera, Check, GraduationCap, LogOut, RotateCcw, Trophy, User } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'

export default function ProfilPage() {
  const { user, userId, isAuthenticated, isAnonymous, signOut } = useAuth()

  return (
    <div className="px-4 lg:px-6">
      <div className="mb-8">
        <h1 className="font-serif text-2xl font-semibold text-foreground">Profil</h1>
        <p className="mt-1 text-muted-foreground">Vos statistiques et paramètres</p>
      </div>

      {!isAuthenticated ? (
        <GuestProfile />
      ) : (
        <AuthenticatedProfile
          userId={userId!}
          email={user?.email}
          isAnonymous={isAnonymous}
          onSignOut={signOut}
        />
      )}
    </div>
  )
}

function GuestProfile() {
  return (
    <Card>
      <CardContent className="py-8 text-center">
        <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-muted">
          <User className="h-8 w-8 text-muted-foreground" />
        </div>
        <h2 className="text-lg font-semibold">Visiteur</h2>
        <p className="mt-2 text-sm text-muted-foreground">
          Connectez-vous pour sauvegarder votre progression et accéder à vos statistiques
        </p>
        <Button className="mt-4" asChild>
          <Link href="/login">Se connecter</Link>
        </Button>
      </CardContent>
    </Card>
  )
}

interface AuthenticatedProfileProps {
  userId: string
  email?: string | null
  isAnonymous: boolean
  onSignOut: () => void
}

function AuthenticatedProfile({ userId, email, isAnonymous, onSignOut }: AuthenticatedProfileProps) {
  const { progress } = useProgress(userId)

  // Calculate stats from progress
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

  const displayName = email || (isAnonymous ? 'Utilisateur anonyme' : 'Utilisateur')
  const initials = email ? email.charAt(0).toUpperCase() : 'U'

  return (
    <div className="space-y-6">
      {/* User Info */}
      <Card>
        <CardHeader>
          <CardTitle>Informations</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary/10 text-2xl font-semibold text-primary">
                {initials}
              </div>
              <div>
                <p className="font-medium">{displayName}</p>
                {isAnonymous && (
                  <p className="text-sm text-muted-foreground">
                    <Link href="/login" className="text-primary underline">
                      Créez un compte
                    </Link>{' '}
                    pour ne pas perdre votre progression
                  </p>
                )}
              </div>
            </div>
            <Button variant="ghost" size="sm" onClick={onSignOut}>
              <LogOut className="mr-2 h-4 w-4" />
              Déconnexion
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* Stats Overview */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Trophy className="h-5 w-5 text-primary" />
            Statistiques
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-2 gap-4">
            <StatCard
              icon={<Check className="h-5 w-5 text-green-600" />}
              value={stats.completed.toString()}
              label="Activités complétées"
              color="green"
            />
            <StatCard
              icon={<GraduationCap className="h-5 w-5 text-blue-600" />}
              value={`${stats.avgScore}%`}
              label="Score moyen QCM"
              color="blue"
            />
            <StatCard
              icon={<BookOpen className="h-5 w-5 text-amber-600" />}
              value={stats.exercisesDone.toString()}
              label="Exercices résolus"
              color="amber"
            />
            <StatCard
              icon={<Trophy className="h-5 w-5 text-primary" />}
              value={`${stats.successRate}%`}
              label="Taux de réussite"
              color="primary"
            />
          </div>
        </CardContent>
      </Card>

      {/* Detailed Stats */}
      <Card>
        <CardHeader>
          <CardTitle>Détails QCM</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex items-center justify-between border-b pb-3">
            <span className="text-muted-foreground">QCM complétés</span>
            <span className="font-medium">{stats.qcmDone}</span>
          </div>
          <div className="flex items-center justify-between border-b py-3">
            <span className="text-muted-foreground">QCM réussis (≥70%)</span>
            <span className="font-medium text-green-600">{stats.qcmSuccess}</span>
          </div>
          <div className="flex items-center justify-between pt-3">
            <span className="text-muted-foreground">À revoir</span>
            <span className="font-medium text-orange-600">{stats.qcmDone - stats.qcmSuccess}</span>
          </div>
        </CardContent>
      </Card>

      {/* Quick Actions */}
      <Card>
        <CardHeader>
          <CardTitle>Actions rapides</CardTitle>
        </CardHeader>
        <CardContent className="flex gap-3">
          <Button variant="outline" className="flex-1" asChild>
            <Link href="/reviser">
              <RotateCcw className="mr-2 h-4 w-4" />
              Réviser
            </Link>
          </Button>
          <Button variant="outline" className="flex-1" asChild>
            <Link href="/scan">
              <Camera className="mr-2 h-4 w-4" />
              Scanner
            </Link>
          </Button>
        </CardContent>
      </Card>
    </div>
  )
}

interface StatCardProps {
  icon: React.ReactNode
  value: string
  label: string
  color: 'green' | 'blue' | 'amber' | 'primary'
}

function StatCard({ icon, value, label, color }: StatCardProps) {
  const bgColors = {
    green: 'bg-green-50 dark:bg-green-950/20',
    blue: 'bg-blue-50 dark:bg-blue-950/20',
    amber: 'bg-amber-50 dark:bg-amber-950/20',
    primary: 'bg-primary/5',
  }

  return (
    <div className={`rounded-lg p-4 ${bgColors[color]}`}>
      <div className="flex items-center gap-2">
        {icon}
        <span className="text-2xl font-bold">{value}</span>
      </div>
      <p className="mt-1 text-xs text-muted-foreground">{label}</p>
    </div>
  )
}
