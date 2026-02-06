'use client'

import { useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { ArrowRight, Check } from 'lucide-react'
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import {
  Field,
  FieldDescription,
  FieldGroup,
  FieldLabel,
  FieldSeparator,
} from "@/components/ui/field"
import { Input } from "@/components/ui/input"
import { useAuth } from '@/lib/hooks/use-auth'
import { getAvailableParcours, type ParcoursConfig } from '@/lib/parcours'
import { doc, setDoc } from 'firebase/firestore'
import { getDbInstance } from '@/lib/firebase/client'

export function SignupForm({
  className,
  ...props
}: React.ComponentProps<"div">) {
  const router = useRouter()
  const { signUp } = useAuth()
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [step, setStep] = useState<'credentials' | 'parcours'>('credentials')
  const [selectedParcours, setSelectedParcours] = useState<string | null>(null)
  const [userId, setUserId] = useState<string | null>(null)

  const availableParcours = getAvailableParcours()

  const handleCredentialsSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setError(null)

    const formData = new FormData(e.currentTarget)
    const email = formData.get('email') as string
    const password = formData.get('password') as string
    const confirmPassword = formData.get('confirm-password') as string

    if (password !== confirmPassword) {
      setError('Les mots de passe ne correspondent pas')
      return
    }

    if (password.length < 8) {
      setError('Le mot de passe doit contenir au moins 8 caractères')
      return
    }

    setIsLoading(true)

    try {
      const user = await signUp(email, password)
      setUserId(user.uid)
      setStep('parcours')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Erreur lors de l\'inscription')
    } finally {
      setIsLoading(false)
    }
  }

  const handleParcoursSelect = async (parcoursSlug: string) => {
    if (!userId) return

    setSelectedParcours(parcoursSlug)
    setIsLoading(true)

    try {
      const db = getDbInstance()
      const userRef = doc(db, 'users', userId)
      await setDoc(userRef, {
        parcours: {
          slug: parcoursSlug,
          selectedAt: new Date().toISOString(),
        },
        createdAt: new Date().toISOString(),
      }, { merge: true })

      router.push(`/${parcoursSlug}`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Erreur lors de la sélection du parcours')
      setSelectedParcours(null)
    } finally {
      setIsLoading(false)
    }
  }

  // Step 2: Parcours selection
  if (step === 'parcours') {
    return (
      <div className={cn("flex flex-col gap-6", className)} {...props}>
        <Card className="overflow-hidden p-0">
          <CardContent className="p-6 md:p-8">
            <div className="flex flex-col items-center gap-2 text-center mb-6">
              <h1 className="text-2xl font-bold">Choisissez votre parcours</h1>
              <p className="text-muted-foreground text-sm text-balance">
                Sélectionnez le niveau qui correspond à vos besoins
              </p>
            </div>

            {error && (
              <div className="mb-4 rounded-md bg-destructive/10 p-3 text-sm text-destructive">
                {error}
              </div>
            )}

            <div className="grid gap-3 sm:grid-cols-2">
              {availableParcours.map((parcours) => (
                <button
                  key={parcours.slug}
                  onClick={() => handleParcoursSelect(parcours.slug)}
                  disabled={isLoading}
                  className={cn(
                    "flex flex-col items-start rounded-lg border p-4 text-left transition-all hover:border-primary hover:bg-primary/5",
                    selectedParcours === parcours.slug && "border-primary bg-primary/5"
                  )}
                >
                  <div className="flex w-full items-center justify-between">
                    <span className="font-medium">{parcours.label}</span>
                    {selectedParcours === parcours.slug && (
                      <Check className="h-4 w-4 text-primary" />
                    )}
                  </div>
                  <span className="mt-1 text-sm text-muted-foreground">
                    {parcours.description}
                  </span>
                </button>
              ))}
            </div>

            {isLoading && (
              <p className="mt-4 text-center text-sm text-muted-foreground">
                Configuration en cours...
              </p>
            )}
          </CardContent>
        </Card>
      </div>
    )
  }

  // Step 1: Credentials
  return (
    <div className={cn("flex flex-col gap-6", className)} {...props}>
      <Card className="overflow-hidden p-0">
        <CardContent className="grid p-0 md:grid-cols-2">
          <form className="p-6 md:p-8" onSubmit={handleCredentialsSubmit}>
            <FieldGroup>
              <div className="flex flex-col items-center gap-2 text-center">
                <h1 className="text-2xl font-bold">Créer un compte</h1>
                <p className="text-muted-foreground text-sm text-balance">
                  Entrez vos informations pour créer votre compte
                </p>
              </div>

              {error && (
                <div className="rounded-md bg-destructive/10 p-3 text-sm text-destructive">
                  {error}
                </div>
              )}

              <Field>
                <FieldLabel htmlFor="email">Email</FieldLabel>
                <Input
                  id="email"
                  name="email"
                  type="email"
                  placeholder="exemple@email.com"
                  required
                  disabled={isLoading}
                />
              </Field>

              <Field className="grid grid-cols-2 gap-4">
                <Field>
                  <FieldLabel htmlFor="password">Mot de passe</FieldLabel>
                  <Input
                    id="password"
                    name="password"
                    type="password"
                    required
                    disabled={isLoading}
                  />
                </Field>
                <Field>
                  <FieldLabel htmlFor="confirm-password">Confirmer</FieldLabel>
                  <Input
                    id="confirm-password"
                    name="confirm-password"
                    type="password"
                    required
                    disabled={isLoading}
                  />
                </Field>
              </Field>
              <FieldDescription className="text-xs">
                Minimum 8 caractères
              </FieldDescription>

              <Field>
                <Button type="submit" disabled={isLoading} className="w-full">
                  {isLoading ? 'Création...' : 'Continuer'}
                  <ArrowRight className="ml-2 h-4 w-4" />
                </Button>
              </Field>

              <FieldSeparator className="*:data-[slot=field-separator-content]:bg-card">
                Ou continuer avec
              </FieldSeparator>

              <Field>
                <Button
                  variant="outline"
                  type="button"
                  disabled
                  className="w-full"
                  title="Bientôt disponible"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" className="h-5 w-5 mr-2">
                    <path
                      d="M12.48 10.92v3.28h7.84c-.24 1.84-.853 3.187-1.787 4.133-1.147 1.147-2.933 2.4-6.053 2.4-4.827 0-8.6-3.893-8.6-8.72s3.773-8.72 8.6-8.72c2.6 0 4.507 1.027 5.907 2.347l2.307-2.307C18.747 1.44 16.133 0 12.48 0 5.867 0 .307 5.387.307 12s5.56 12 12.173 12c3.573 0 6.267-1.173 8.373-3.36 2.16-2.16 2.84-5.213 2.84-7.667 0-.76-.053-1.467-.173-2.053H12.48z"
                      fill="currentColor"
                    />
                  </svg>
                  Google (bientôt)
                </Button>
              </Field>

              <FieldDescription className="text-center">
                Déjà un compte ?{' '}
                <Link href="/login" className="underline underline-offset-2 hover:text-primary">
                  Se connecter
                </Link>
              </FieldDescription>
            </FieldGroup>
          </form>

          <div className="bg-primary relative hidden md:block">
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="text-primary-foreground text-center p-8">
                <h2 className="text-3xl font-bold mb-4">Learning</h2>
                <p className="text-lg opacity-90">
                  Commencez votre apprentissage
                </p>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>

      <FieldDescription className="px-6 text-center text-xs text-muted-foreground">
        En continuant, vous acceptez nos{' '}
        <Link href="/terms" className="underline hover:text-primary">
          Conditions d&apos;utilisation
        </Link>{' '}
        et notre{' '}
        <Link href="/privacy" className="underline hover:text-primary">
          Politique de confidentialité
        </Link>
      </FieldDescription>
    </div>
  )
}
