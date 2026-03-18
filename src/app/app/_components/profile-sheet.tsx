'use client'

/**
 * Profile Sheet
 *
 * Side panel (right) showing user profile info.
 * Opened from the NavUser dropdown.
 */

import Link from 'next/link'
import {
  LogOut,
  User,
} from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
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

// =============================================================================
// ProfileSheet
// =============================================================================

interface ProfileSheetProps {
  open: boolean
  onOpenChange: (open: boolean) => void
}

export function ProfileSheet({ open, onOpenChange }: ProfileSheetProps) {
  const { user, isAuthenticated, signOut } = useAuth()

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent side="right" className="sm:max-w-md p-0 flex flex-col overscroll-contain">
        {!isAuthenticated ? (
          <GuestContent />
        ) : (
          <AuthenticatedContent
            user={user}
            onSignOut={signOut}
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
        <SheetDescription>Connecte-toi pour utiliser la correction IA</SheetDescription>
      </SheetHeader>
      <div className="flex flex-1 flex-col items-center justify-center p-6">
        <div className="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-muted">
          <User className="h-10 w-10 text-muted-foreground" />
        </div>
        <h2 className="text-xl font-semibold">Visiteur</h2>
        <p className="mt-2 text-center text-muted-foreground">
          Connecte-toi pour utiliser la correction IA
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
  onSignOut: () => Promise<void>
}

function AuthenticatedContent({
  user,
  onSignOut,
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
          <Button variant="outline" size="sm" onClick={() => onSignOut()} aria-label="Se déconnecter">
            <LogOut className="h-4 w-4" />
          </Button>
        </div>
      </SheetHeader>

      {/* Account info */}
      <ScrollArea className="flex-1">
        <div className="px-6 py-4">
          <Card>
            <CardHeader className="pb-2">
              <CardTitle className="text-sm">Informations du compte</CardTitle>
            </CardHeader>
            <CardContent className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-sm text-muted-foreground">Email</span>
                <span className="text-sm font-medium">{userEmail || 'Non renseigné'}</span>
              </div>
            </CardContent>
          </Card>
        </div>
      </ScrollArea>
    </>
  )
}
