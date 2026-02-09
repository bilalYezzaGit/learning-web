'use client'

/**
 * Profile Sheet
 *
 * Side panel (right) showing user profile with tabs: Stats, Profil, Paramètres.
 * Opened from the NavUser dropdown instead of navigating to /profil.
 */

import * as React from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
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
import { ScrollArea } from '@/components/ui/scroll-area'
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
} from '@/components/ui/sheet'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { useUserParcours, getAvailableParcours } from '@/lib/parcours'

// =============================================================================
// ProfileSheet
// =============================================================================

interface ProfileSheetProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  defaultTab?: string
}

export function ProfileSheet({ open, onOpenChange, defaultTab = 'stats' }: ProfileSheetProps) {
  const [activeTab, setActiveTab] = React.useState(defaultTab)
  const { user, userId, isAuthenticated, signOut } = useAuth()

  // Sync defaultTab when sheet opens with a new tab
  React.useEffect(() => {
    if (open) {
      setActiveTab(defaultTab)
    }
  }, [open, defaultTab])

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent side="right" className="sm:max-w-md p-0 flex flex-col overscroll-contain">
        {!isAuthenticated ? (
          <GuestContent />
        ) : (
          <AuthenticatedContent
            user={user}
            userId={userId}
            activeTab={activeTab}
            onTabChange={setActiveTab}
            onSignOut={signOut}
            onClose={() => onOpenChange(false)}
          />
        )}
      </SheetContent>
    </Sheet>
  )
}

// =============================================================================
// Guest Content
// =============================================================================

function GuestContent() {
  return (
    <>
      <SheetHeader className="border-b px-6 py-4">
        <SheetTitle>Profil</SheetTitle>
        <SheetDescription>Connectez-vous pour accéder à votre profil</SheetDescription>
      </SheetHeader>
      <div className="flex flex-1 flex-col items-center justify-center p-6">
        <div className="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-muted">
          <User className="h-10 w-10 text-muted-foreground" />
        </div>
        <h2 className="text-xl font-semibold">Visiteur</h2>
        <p className="mt-2 text-center text-muted-foreground">
          Connectez-vous pour sauvegarder votre progression
        </p>
        <Button className="mt-6" size="lg" asChild>
          <Link href="/login">Se connecter</Link>
        </Button>
      </div>
    </>
  )
}

// =============================================================================
// Authenticated Content
// =============================================================================

interface AuthenticatedContentProps {
  user: ReturnType<typeof useAuth>['user']
  userId: string | null
  activeTab: string
  onTabChange: (tab: string) => void
  onSignOut: () => Promise<void>
  onClose: () => void
}

function AuthenticatedContent({
  user,
  userId,
  activeTab,
  onTabChange,
  onSignOut,
  onClose,
}: AuthenticatedContentProps) {
  const displayName = user?.displayName || user?.email || 'Utilisateur'
  const userEmail = user?.email || ''
  const initials = user?.displayName
    ? user.displayName.charAt(0).toUpperCase()
    : user?.email
      ? user.email.charAt(0).toUpperCase()
      : 'U'

  return (
    <>
      {/* Header */}
      <SheetHeader className="border-b px-6 py-4">
        <div className="flex items-center gap-3">
          <Avatar className="h-12 w-12">
            <AvatarImage src={user?.photoURL || undefined} alt={displayName} />
            <AvatarFallback className="bg-primary text-primary-foreground">
              {initials}
            </AvatarFallback>
          </Avatar>
          <div className="flex-1 min-w-0">
            <SheetTitle className="truncate">{displayName}</SheetTitle>
            <SheetDescription className="truncate">{userEmail}</SheetDescription>
          </div>
          <Button variant="outline" size="sm" onClick={() => onSignOut()} aria-label="Se deconnecter">
            <LogOut className="h-4 w-4" />
          </Button>
        </div>
      </SheetHeader>

      {/* Tabs */}
      <Tabs value={activeTab} onValueChange={onTabChange} className="flex flex-1 flex-col overflow-hidden">
        <div className="px-6 pt-4">
          <TabsList className="grid w-full grid-cols-3">
            <TabsTrigger value="stats">
              <Trophy className="mr-1.5 h-3.5 w-3.5" />
              Stats
            </TabsTrigger>
            <TabsTrigger value="profil">
              <User className="mr-1.5 h-3.5 w-3.5" />
              Profil
            </TabsTrigger>
            <TabsTrigger value="settings">
              <Settings className="mr-1.5 h-3.5 w-3.5" />
              Paramètres
            </TabsTrigger>
          </TabsList>
        </div>

        <ScrollArea className="flex-1">
          <div className="px-6 py-4">
            <TabsContent value="stats" className="mt-0">
              {userId && <StatsTab userId={userId} />}
            </TabsContent>

            <TabsContent value="profil" className="mt-0">
              <ProfilTab email={user?.email} />
            </TabsContent>

            <TabsContent value="settings" className="mt-0">
              <SettingsTab onClose={onClose} />
            </TabsContent>
          </div>
        </ScrollArea>
      </Tabs>
    </>
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
    let totalPercentage = 0
    let qcmWithScore = 0

    progress.forEach((p) => {
      completed++
      if (p.status === 'success') success++

      if (p.activityType === 'qcm') {
        qcmDone++
        if (p.status === 'success') qcmSuccess++
        if (p.score !== undefined) {
          totalPercentage += p.score
          qcmWithScore++
        }
      } else if (p.activityType === 'exercise') {
        exercisesDone++
      }
    })

    const avgScore = qcmWithScore > 0 ? Math.min(Math.round(totalPercentage / qcmWithScore), 100) : 0
    const successRate = completed > 0 ? Math.round((success / completed) * 100) : 0

    return { completed, success, qcmDone, qcmSuccess, exercisesDone, avgScore, successRate }
  }, [progress])

  return (
    <div className="space-y-4">
      {/* Stats Grid — 2 columns for sheet width */}
      <div className="grid grid-cols-2 gap-3">
        <Card>
          <CardContent className="py-3">
            <div className="flex items-center gap-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-green-100 dark:bg-green-900/30">
                <CheckCircle className="h-4 w-4 text-green-600" />
              </div>
              <div>
                <p className="tabular-nums text-xl font-bold">{stats.completed}</p>
                <p className="text-xs text-muted-foreground">Activités</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="py-3">
            <div className="flex items-center gap-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-blue-100 dark:bg-blue-900/30">
                <GraduationCap className="h-4 w-4 text-blue-600" />
              </div>
              <div>
                <p className="tabular-nums text-xl font-bold">{stats.avgScore}%</p>
                <p className="text-xs text-muted-foreground">Score QCM</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="py-3">
            <div className="flex items-center gap-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-amber-100 dark:bg-amber-900/30">
                <BookOpen className="h-4 w-4 text-amber-600" />
              </div>
              <div>
                <p className="tabular-nums text-xl font-bold">{stats.exercisesDone}</p>
                <p className="text-xs text-muted-foreground">Exercices</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="py-3">
            <div className="flex items-center gap-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-purple-100 dark:bg-purple-900/30">
                <Trophy className="h-4 w-4 text-purple-600" />
              </div>
              <div>
                <p className="tabular-nums text-xl font-bold">{stats.successRate}%</p>
                <p className="text-xs text-muted-foreground">Réussite</p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* QCM Details */}
      <Card>
        <CardHeader className="pb-2">
          <CardTitle className="text-sm">Détails QCM</CardTitle>
        </CardHeader>
        <CardContent className="space-y-0">
          <div className="flex items-center justify-between border-b py-2.5">
            <span className="text-sm text-muted-foreground">QCM complétés</span>
            <span className="text-sm font-medium">{stats.qcmDone}</span>
          </div>
          <div className="flex items-center justify-between border-b py-2.5">
            <span className="text-sm text-muted-foreground">QCM réussis</span>
            <span className="text-sm font-medium text-green-600">{stats.qcmSuccess}</span>
          </div>
          <div className="flex items-center justify-between py-2.5">
            <span className="text-sm text-muted-foreground">À revoir</span>
            <span className="text-sm font-medium text-orange-600">{stats.qcmDone - stats.qcmSuccess}</span>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}

// =============================================================================
// Profil Tab
// =============================================================================

function ProfilTab({
  email,
}: {
  email?: string | null
}) {
  const { parcoursConfig } = useUserParcours()

  return (
    <div className="space-y-4">
      <Card>
        <CardHeader className="pb-2">
          <CardTitle className="text-sm">Informations du compte</CardTitle>
        </CardHeader>
        <CardContent className="space-y-3">
          <div className="flex items-center justify-between">
            <span className="text-sm text-muted-foreground">Email</span>
            <span className="text-sm font-medium">{email || 'Non renseigné'}</span>
          </div>
          <div className="flex items-center justify-between">
            <span className="text-sm text-muted-foreground">Parcours</span>
            {parcoursConfig ? (
              <Badge variant="secondary">{parcoursConfig.label}</Badge>
            ) : (
              <span className="text-sm text-muted-foreground">Non défini</span>
            )}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}

// =============================================================================
// Settings Tab
// =============================================================================

function SettingsTab({ onClose }: { onClose: () => void }) {
  const { theme, setTheme } = useTheme()
  const router = useRouter()
  const { parcours, parcoursConfig, setParcours, isLoading } = useUserParcours()
  const availableParcours = getAvailableParcours()
  const [changingParcours, setChangingParcours] = React.useState(false)

  const handleParcoursChange = async (slug: string) => {
    setChangingParcours(true)
    try {
      await setParcours(slug)
      onClose()
      router.push(`/${slug}`)
    } catch (e) {
      console.error('Failed to change parcours:', e)
    } finally {
      setChangingParcours(false)
    }
  }

  return (
    <div className="space-y-4">
      <Card>
        <CardHeader className="pb-2">
          <CardTitle className="text-sm">Apparence</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium">Thème</p>
              <p className="text-xs text-muted-foreground">Choisissez votre préférence</p>
            </div>
            <div className="flex gap-1.5">
              <Button
                variant={theme === 'light' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setTheme('light')}
              >
                <Sun className="mr-1.5 h-3.5 w-3.5" />
                Clair
              </Button>
              <Button
                variant={theme === 'dark' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setTheme('dark')}
              >
                <Moon className="mr-1.5 h-3.5 w-3.5" />
                Sombre
              </Button>
            </div>
          </div>
        </CardContent>
      </Card>

      <Card>
        <CardHeader className="pb-2">
          <CardTitle className="text-sm">Parcours</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="space-y-3">
            <div>
              <p className="text-sm font-medium">Parcours actuel</p>
              <p className="text-xs text-muted-foreground">
                {isLoading ? 'Chargement...' : parcoursConfig?.label || 'Non défini'}
              </p>
            </div>
            <div>
              <p className="mb-2 text-xs font-medium">Changer de parcours</p>
              <div className="grid grid-cols-2 gap-2">
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
