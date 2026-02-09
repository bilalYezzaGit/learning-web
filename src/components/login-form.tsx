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
import { doc, getDoc } from 'firebase/firestore'
import { useAuth } from '@/lib/context'
import { getDbInstance } from '@/lib/firebase/client'

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

      // Fetch user's parcours to redirect to the right dashboard
      const db = getDbInstance()
      const userDoc = await getDoc(doc(db, 'users', user.uid))
      const parcoursSlug = userDoc.data()?.parcours?.slug

      if (parcoursSlug) {
        router.push(`/${parcoursSlug}`)
      } else {
        router.push('/select-parcours')
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Erreur de connexion')
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

              <Field>
                <div className="flex items-center justify-between">
                  <FieldLabel htmlFor="password">Mot de passe</FieldLabel>
                  <Link
                    href="/reset-password"
                    className="text-xs underline-offset-2 hover:underline text-muted-foreground hover:text-primary"
                  >
                    Mot de passe oublié ?
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
              </Field>

              <Field>
                <Button type="submit" disabled={isLoading} className="w-full">
                  {isLoading ? 'Connexion\u2026' : 'Se connecter'}
                </Button>
              </Field>

              <FieldDescription className="text-center">
                Pas encore de compte ?{' '}
                <Link href="/signup" className="underline underline-offset-2 hover:text-primary">
                  S&apos;inscrire
                </Link>
              </FieldDescription>
            </FieldGroup>
          </form>

          <div className="bg-primary relative hidden md:block">
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="text-primary-foreground text-center p-8">
                <h2 className="text-3xl font-bold mb-4">Learning</h2>
                <p className="text-lg opacity-90">
                  Apprenez à votre rythme
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
