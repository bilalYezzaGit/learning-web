'use client'

import { useState } from 'react'
import Link from 'next/link'
import { ArrowLeft, Mail } from 'lucide-react'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { AuthFormCard } from '@/components/patterns/auth-form-card'
import { resetPassword } from '@/lib/services'

export function ResetPasswordForm({
  className,
  ...props
}: React.ComponentProps<"div">) {
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [success, setSuccess] = useState(false)

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setError(null)
    setIsLoading(true)

    const formData = new FormData(e.currentTarget)
    const email = formData.get('email') as string

    try {
      await resetPassword(email)
      setSuccess(true)
    } catch (err) {
      setError(
        err instanceof Error ? err.message : 'Erreur lors de l\'envoi du email'
      )
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <AuthFormCard className={className} rightPanelSubtitle="Reinitialisez votre mot de passe" {...props}>
      {success ? (
        <div className="flex flex-col items-center justify-center gap-4 p-6 md:p-8">
          <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
            <Mail className="h-8 w-8 text-primary" aria-hidden="true" />
          </div>
          <div className="text-center">
            <h1 className="text-2xl font-bold">Email envoye</h1>
            <p className="mt-2 text-sm text-muted-foreground text-balance">
              Si un compte existe avec cette adresse, vous recevrez un lien
              pour reinitialiser votre mot de passe.
            </p>
          </div>
          <Button asChild className="mt-2">
            <Link href="/login">Retour a la connexion</Link>
          </Button>
        </div>
      ) : (
        <form className="p-6 md:p-8" onSubmit={handleSubmit}>
          <div className="flex flex-col gap-6">
            <div className="flex flex-col items-center gap-2 text-center">
              <h1 className="text-2xl font-bold">Mot de passe oublie</h1>
              <p className="text-muted-foreground text-sm text-balance">
                Entrez votre adresse email pour recevoir un lien de reinitialisation
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

            <Button type="submit" disabled={isLoading} className="w-full">
              {isLoading ? 'Envoi\u2026' : 'Envoyer le lien'}
            </Button>

            <p className="text-center text-sm text-muted-foreground">
              <Link
                href="/login"
                className="inline-flex items-center gap-1 underline underline-offset-2 hover:text-primary"
              >
                <ArrowLeft className="h-3 w-3" />
                Retour a la connexion
              </Link>
            </p>
          </div>
        </form>
      )}
    </AuthFormCard>
  )
}
