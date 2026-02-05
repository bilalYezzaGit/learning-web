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
import { BookOpen, Mail, User, AlertCircle, Loader2, CheckCircle } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Separator } from '@/components/ui/separator'
import { Alert, AlertDescription } from '@/components/ui/alert'
import { signInWithEmail, signInAnonymouslyFn, createAccount, resetPassword } from '@/lib/services/auth-service'

export default function LoginPage() {
  const router = useRouter()
  const [isLoading, setIsLoading] = React.useState(false)
  const [showEmailForm, setShowEmailForm] = React.useState(false)
  const [isSignupMode, setIsSignupMode] = React.useState(false)
  const [isForgotPasswordMode, setIsForgotPasswordMode] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)
  const [successMessage, setSuccessMessage] = React.useState<string | null>(null)

  const handleAnonymousLogin = async () => {
    setIsLoading(true)
    setError(null)
    try {
      await signInAnonymouslyFn()
      router.push('/')
    } catch (err) {
      const firebaseError = err as { code?: string; message?: string }
      if (firebaseError.code === 'auth/operation-not-allowed') {
        setError('La connexion anonyme n\'est pas activée.')
      } else {
        setError('Erreur de connexion. Veuillez réessayer.')
        console.error('Anonymous login error:', firebaseError)
      }
    } finally {
      setIsLoading(false)
    }
  }

  const handleEmailLogin = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setIsLoading(true)
    setError(null)

    const formData = new FormData(e.currentTarget)
    const email = formData.get('email') as string
    const password = formData.get('password') as string

    try {
      await signInWithEmail(email, password)
      router.push('/')
    } catch (err) {
      const firebaseError = err as { code?: string; message?: string }

      // Map Firebase error codes to user-friendly messages
      switch (firebaseError.code) {
        case 'auth/invalid-email':
          setError('Adresse email invalide.')
          break
        case 'auth/user-disabled':
          setError('Ce compte a été désactivé.')
          break
        case 'auth/user-not-found':
          setError('Aucun compte trouvé avec cet email.')
          break
        case 'auth/wrong-password':
          setError('Mot de passe incorrect.')
          break
        case 'auth/invalid-credential':
          setError('Email ou mot de passe incorrect.')
          break
        case 'auth/too-many-requests':
          setError('Trop de tentatives. Réessayez plus tard.')
          break
        default:
          setError('Erreur de connexion. Veuillez réessayer.')
          console.error('Login error:', firebaseError)
      }
    } finally {
      setIsLoading(false)
    }
  }

  const handleSignup = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setIsLoading(true)
    setError(null)

    const formData = new FormData(e.currentTarget)
    const email = formData.get('email') as string
    const password = formData.get('password') as string

    try {
      await createAccount(email, password)
      router.push('/')
    } catch (err) {
      const firebaseError = err as { code?: string; message?: string }

      switch (firebaseError.code) {
        case 'auth/email-already-in-use':
          setError('Cette adresse email est déjà utilisée.')
          break
        case 'auth/invalid-email':
          setError('Adresse email invalide.')
          break
        case 'auth/weak-password':
          setError('Le mot de passe doit contenir au moins 6 caractères.')
          break
        case 'auth/operation-not-allowed':
          setError('La création de compte n\'est pas activée.')
          break
        default:
          setError('Erreur lors de la création du compte.')
          console.error('Signup error:', firebaseError)
      }
    } finally {
      setIsLoading(false)
    }
  }

  const handleForgotPassword = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setIsLoading(true)
    setError(null)
    setSuccessMessage(null)

    const formData = new FormData(e.currentTarget)
    const email = formData.get('email') as string

    try {
      await resetPassword(email)
      setSuccessMessage('Un email de réinitialisation a été envoyé.')
    } catch (err) {
      const firebaseError = err as { code?: string; message?: string }

      switch (firebaseError.code) {
        case 'auth/invalid-email':
          setError('Adresse email invalide.')
          break
        case 'auth/user-not-found':
          setError('Aucun compte trouvé avec cet email.')
          break
        default:
          setError('Erreur lors de l\'envoi. Veuillez réessayer.')
          console.error('Forgot password error:', firebaseError)
      }
    } finally {
      setIsLoading(false)
    }
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
          ) : isForgotPasswordMode ? (
            <form onSubmit={handleForgotPassword} className="space-y-4">
              {error && (
                <Alert variant="destructive">
                  <AlertCircle className="h-4 w-4" />
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}

              {successMessage && (
                <Alert>
                  <CheckCircle className="h-4 w-4 text-green-600" />
                  <AlertDescription className="text-green-600">{successMessage}</AlertDescription>
                </Alert>
              )}

              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <Input
                  id="email"
                  name="email"
                  type="email"
                  placeholder="vous@example.com"
                  required
                  disabled={isLoading}
                />
              </div>

              <Button type="submit" className="w-full" disabled={isLoading || !!successMessage}>
                {isLoading ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    Envoi...
                  </>
                ) : (
                  'Envoyer le lien'
                )}
              </Button>

              <Button
                type="button"
                variant="ghost"
                className="w-full"
                onClick={() => {
                  setIsForgotPasswordMode(false)
                  setError(null)
                  setSuccessMessage(null)
                }}
                disabled={isLoading}
              >
                Retour à la connexion
              </Button>
            </form>
          ) : (
            <form onSubmit={isSignupMode ? handleSignup : handleEmailLogin} className="space-y-4">
              {error && (
                <Alert variant="destructive">
                  <AlertCircle className="h-4 w-4" />
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}

              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <Input
                  id="email"
                  name="email"
                  type="email"
                  placeholder="vous@example.com"
                  required
                  disabled={isLoading}
                />
              </div>
              <div className="space-y-2">
                <div className="flex items-center justify-between">
                  <Label htmlFor="password">Mot de passe</Label>
                  {!isSignupMode && (
                    <button
                      type="button"
                      className="text-xs text-muted-foreground hover:text-primary hover:underline"
                      onClick={() => {
                        setIsForgotPasswordMode(true)
                        setError(null)
                      }}
                      disabled={isLoading}
                    >
                      Mot de passe oublié ?
                    </button>
                  )}
                </div>
                <Input
                  id="password"
                  name="password"
                  type="password"
                  placeholder="••••••••"
                  required
                  minLength={6}
                  disabled={isLoading}
                />
              </div>

              <Button type="submit" className="w-full" disabled={isLoading}>
                {isLoading ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    {isSignupMode ? 'Création...' : 'Connexion...'}
                  </>
                ) : (
                  isSignupMode ? 'Créer un compte' : 'Se connecter'
                )}
              </Button>

              <div className="text-center text-sm">
                {isSignupMode ? (
                  <p className="text-muted-foreground">
                    Déjà un compte ?{' '}
                    <button
                      type="button"
                      className="font-medium text-primary hover:underline"
                      onClick={() => {
                        setIsSignupMode(false)
                        setError(null)
                      }}
                      disabled={isLoading}
                    >
                      Se connecter
                    </button>
                  </p>
                ) : (
                  <p className="text-muted-foreground">
                    Pas de compte ?{' '}
                    <button
                      type="button"
                      className="font-medium text-primary hover:underline"
                      onClick={() => {
                        setIsSignupMode(true)
                        setError(null)
                      }}
                      disabled={isLoading}
                    >
                      Créer un compte
                    </button>
                  </p>
                )}
              </div>

              <Button
                type="button"
                variant="ghost"
                className="w-full"
                onClick={() => {
                  setShowEmailForm(false)
                  setIsSignupMode(false)
                  setError(null)
                }}
                disabled={isLoading}
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
