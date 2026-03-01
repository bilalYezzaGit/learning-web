'use client'

import { useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { Eye, EyeOff } from 'lucide-react'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { AuthFormCard } from '@/app/(auth)/_components/auth-form-card'
import { useAuth } from '@/lib/context'
import { getUserParcoursSlug } from '@/lib/services/user-service'
import { getFirebaseErrorMessage } from '@/lib/utils/firebase-errors'

export function LoginForm({
  className,
  ...props
}: React.ComponentProps<"div">) {
  const router = useRouter()
  const { signIn } = useAuth()
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [showPassword, setShowPassword] = useState(false)

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setError(null)
    setIsLoading(true)

    const formData = new FormData(e.currentTarget)
    const email = formData.get('email') as string
    const password = formData.get('password') as string

    try {
      const user = await signIn(email, password)
      const parcoursSlug = await getUserParcoursSlug(user.uid)

      if (parcoursSlug) {
        router.push(`/${parcoursSlug}`)
      } else {
        router.push('/select-parcours')
      }
    } catch (err) {
      setError(getFirebaseErrorMessage(err))
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <AuthFormCard className={className} rightPanelSubtitle="Apprenez a votre rythme" {...props}>
      <form className="p-6 md:p-8" onSubmit={handleSubmit}>
        <div className="flex flex-col gap-6">
          <div className="flex flex-col items-center gap-2 text-center">
            <h1 className="text-2xl font-bold">Bienvenue</h1>
            <p className="text-muted-foreground text-balance">
              Connectez-vous pour sauvegarder votre progression
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

          <div className="flex flex-col gap-2">
            <div className="flex items-center justify-between">
              <Label htmlFor="password">Mot de passe</Label>
              <Link
                href="/reset-password"
                className="text-xs underline-offset-2 hover:underline text-muted-foreground hover:text-primary"
              >
                Mot de passe oublie ?
              </Link>
            </div>
            <div className="relative">
              <Input
                id="password"
                name="password"
                type={showPassword ? 'text' : 'password'}
                autoComplete="current-password"
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

          <Button type="submit" disabled={isLoading} className="w-full">
            {isLoading ? 'Connexion\u2026' : 'Se connecter'}
          </Button>

          <p className="text-center text-sm text-muted-foreground">
            Pas encore de compte ?{' '}
            <Link href="/signup" className="underline underline-offset-2 hover:text-primary">
              S&apos;inscrire
            </Link>
          </p>
        </div>
      </form>
    </AuthFormCard>
  )
}
