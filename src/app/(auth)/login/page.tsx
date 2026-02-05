'use client'

/**
 * Login Page
 *
 * Simple auth page with anonymous and email options.
 * Non-blocking - user can skip and browse as guest.
 */

import * as React from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { BookOpen, Mail, User } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Separator } from '@/components/ui/separator'

export default function LoginPage() {
  const router = useRouter()
  const [isLoading, setIsLoading] = React.useState(false)
  const [showEmailForm, setShowEmailForm] = React.useState(false)

  const handleAnonymousLogin = async () => {
    setIsLoading(true)
    // TODO: Implement Firebase anonymous auth
    // await signInAnonymously(auth)
    setTimeout(() => {
      router.push('/')
    }, 500)
  }

  const handleEmailLogin = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setIsLoading(true)
    // TODO: Implement Firebase email auth
    setTimeout(() => {
      router.push('/')
    }, 500)
  }

  return (
    <div className="flex min-h-screen items-center justify-center bg-muted/30 p-4">
      <Card className="w-full max-w-md">
        <CardHeader className="text-center">
          <div className="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-primary">
            <BookOpen className="h-6 w-6 text-primary-foreground" />
          </div>
          <CardTitle className="font-serif text-2xl">Bienvenue</CardTitle>
          <p className="mt-2 text-sm text-muted-foreground">
            Connectez-vous pour sauvegarder votre progression
          </p>
        </CardHeader>

        <CardContent className="space-y-4">
          {!showEmailForm ? (
            <>
              {/* Quick anonymous login */}
              <Button
                className="w-full"
                size="lg"
                onClick={handleAnonymousLogin}
                disabled={isLoading}
              >
                <User className="mr-2 h-4 w-4" />
                Continuer en tant qu&apos;invité
              </Button>

              <div className="relative">
                <div className="absolute inset-0 flex items-center">
                  <Separator />
                </div>
                <div className="relative flex justify-center text-xs uppercase">
                  <span className="bg-card px-2 text-muted-foreground">ou</span>
                </div>
              </div>

              {/* Email option */}
              <Button
                variant="outline"
                className="w-full"
                size="lg"
                onClick={() => setShowEmailForm(true)}
              >
                <Mail className="mr-2 h-4 w-4" />
                Se connecter avec un email
              </Button>
            </>
          ) : (
            <form onSubmit={handleEmailLogin} className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <Input
                  id="email"
                  type="email"
                  placeholder="vous@example.com"
                  required
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="password">Mot de passe</Label>
                <Input
                  id="password"
                  type="password"
                  placeholder="••••••••"
                  required
                />
              </div>

              <Button type="submit" className="w-full" disabled={isLoading}>
                Se connecter
              </Button>

              <Button
                type="button"
                variant="ghost"
                className="w-full"
                onClick={() => setShowEmailForm(false)}
              >
                Retour
              </Button>
            </form>
          )}

          {/* Skip option */}
          <div className="pt-4 text-center">
            <p className="text-sm text-muted-foreground">
              Vous pouvez aussi{' '}
              <Link href="/" className="font-medium text-primary hover:underline">
                explorer sans compte
              </Link>
            </p>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
