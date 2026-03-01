'use client'

import { useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { Eye, EyeOff } from 'lucide-react'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group"
import { AuthFormCard } from '@/app/(auth)/_components/auth-form-card'
import { useAuth } from '@/lib/context'
import { getActiveParcours } from '@/lib/parcours'
import { saveUserParcours } from '@/lib/services/user-service'
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
      setError('Le mot de passe doit contenir au moins 8 caracteres')
      return
    }

    if (!selectedParcours) {
      setError('Veuillez choisir un parcours')
      return
    }

    setIsLoading(true)

    try {
      const user = await signUp(email, password)
      await saveUserParcours(user.uid, selectedParcours)
      router.push(`/${selectedParcours}`)
    } catch (err) {
      setError(getFirebaseErrorMessage(err))
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <AuthFormCard className={className} rightPanelSubtitle="Commencez votre apprentissage" {...props}>
      <form className="p-6 md:p-8" onSubmit={handleSubmit}>
        <div className="flex flex-col gap-6">
          <div className="flex flex-col items-center gap-2 text-center">
            <h1 className="text-2xl font-bold">Creer un compte</h1>
            <p className="text-muted-foreground text-sm text-balance">
              Entrez vos informations pour creer votre compte
            </p>
          </div>

          {error && (
            <div role="alert" className="rounded-md bg-destructive/10 p-3 text-sm text-destructive">
              {error}
            </div>
          )}

          <div className="flex flex-col gap-2">
            <Label htmlFor="email">Email</Label>
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
          </div>

          <div className="grid gap-4 sm:grid-cols-2">
            <div className="flex flex-col gap-2">
              <Label htmlFor="password">Mot de passe</Label>
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
            </div>
            <div className="flex flex-col gap-2">
              <Label htmlFor="confirm-password">Confirmer</Label>
              <Input
                id="confirm-password"
                name="confirm-password"
                type={showPassword ? 'text' : 'password'}
                autoComplete="new-password"
                required
                disabled={isLoading}
              />
            </div>
          </div>
          <p className="text-xs text-muted-foreground -mt-4">
            Minimum 8 caracteres
          </p>

          <div className="flex flex-col gap-2">
            <Label>Parcours</Label>
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
          </div>

          <Button type="submit" disabled={isLoading} className="w-full">
            {isLoading ? 'Creation\u2026' : 'S\'inscrire'}
          </Button>

          <p className="text-center text-sm text-muted-foreground">
            Deja un compte ?{' '}
            <Link href="/login" className="underline underline-offset-2 hover:text-primary">
              Se connecter
            </Link>
          </p>
        </div>
      </form>
    </AuthFormCard>
  )
}
