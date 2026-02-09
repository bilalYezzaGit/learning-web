'use client'

import { useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { Eye, EyeOff } from 'lucide-react'
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import {
  Field,
  FieldDescription,
  FieldGroup,
  FieldLabel,
} from "@/components/ui/field"
import { Input } from "@/components/ui/input"
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group"
import { Label } from "@/components/ui/label"
import { useAuth } from '@/lib/context'
import { getActiveParcours } from '@/lib/parcours'
import { doc, setDoc } from 'firebase/firestore'
import { getDbInstance } from '@/lib/firebase/client'
import { getFirebaseErrorMessage } from '@/lib/utils/firebase-errors'

export function SignupForm({
  className,
  ...props
}: React.ComponentProps<"div">) {
  const router = useRouter()
  const { signUp } = useAuth()
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [showPassword, setShowPassword] = useState(false)
  const [selectedParcours, setSelectedParcours] = useState<string>('')

  const availableParcours = getActiveParcours()

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
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

    if (!selectedParcours) {
      setError('Veuillez choisir un parcours')
      return
    }

    setIsLoading(true)

    try {
      const user = await signUp(email, password)

      const db = getDbInstance()
      const userRef = doc(db, 'users', user.uid)
      await setDoc(userRef, {
        parcours: {
          slug: selectedParcours,
          selectedAt: new Date().toISOString(),
        },
        createdAt: new Date().toISOString(),
      }, { merge: true })

      router.push(`/${selectedParcours}`)
    } catch (err) {
      setError(getFirebaseErrorMessage(err))
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className={cn("flex flex-col gap-6", className)} {...props}>
      <Card className="overflow-hidden p-0">
        <CardContent className="grid p-0 md:grid-cols-2">
          <form className="p-6 md:p-8" onSubmit={handleSubmit}>
            <FieldGroup>
              <div className="flex flex-col items-center gap-2 text-center">
                <h1 className="text-2xl font-bold">Créer un compte</h1>
                <p className="text-muted-foreground text-sm text-balance">
                  Entrez vos informations pour créer votre compte
                </p>
              </div>

              {error && (
                <div role="alert" className="rounded-md bg-destructive/10 p-3 text-sm text-destructive">
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
                  autoComplete="email"
                  spellCheck={false}
                  required
                  disabled={isLoading}
                />
              </Field>

              <Field className="grid gap-4 sm:grid-cols-2">
                <Field>
                  <FieldLabel htmlFor="password">Mot de passe</FieldLabel>
                  <div className="relative">
                    <Input
                      id="password"
                      name="password"
                      type={showPassword ? 'text' : 'password'}
                      autoComplete="new-password"
                      required
                      disabled={isLoading}
                      className="pr-10"
                    />
                    <button
                      type="button"
                      onClick={() => setShowPassword(!showPassword)}
                      className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                      aria-label={showPassword ? 'Masquer le mot de passe' : 'Afficher le mot de passe'}
                    >
                      {showPassword ? (
                        <EyeOff className="h-4 w-4" aria-hidden="true" />
                      ) : (
                        <Eye className="h-4 w-4" aria-hidden="true" />
                      )}
                    </button>
                  </div>
                </Field>
                <Field>
                  <FieldLabel htmlFor="confirm-password">Confirmer</FieldLabel>
                  <Input
                    id="confirm-password"
                    name="confirm-password"
                    type={showPassword ? 'text' : 'password'}
                    autoComplete="new-password"
                    required
                    disabled={isLoading}
                  />
                </Field>
              </Field>
              <FieldDescription className="text-xs">
                Minimum 8 caractères
              </FieldDescription>

              <Field>
                <FieldLabel>Parcours</FieldLabel>
                <RadioGroup
                  value={selectedParcours}
                  onValueChange={setSelectedParcours}
                  disabled={isLoading}
                >
                  {availableParcours.map((parcours) => (
                    <div key={parcours.slug} className="flex min-h-11 items-center gap-2">
                      <RadioGroupItem value={parcours.slug} id={`parcours-${parcours.slug}`} />
                      <Label htmlFor={`parcours-${parcours.slug}`} className="flex-1 cursor-pointer font-normal">
                        {parcours.label}
                      </Label>
                    </div>
                  ))}
                </RadioGroup>
              </Field>

              <Field>
                <Button type="submit" disabled={isLoading} className="w-full">
                  {isLoading ? 'Cr\u00e9ation\u2026' : 'S\'inscrire'}
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
