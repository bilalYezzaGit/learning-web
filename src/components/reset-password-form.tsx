'use client'

import { useState } from 'react'
import Link from 'next/link'
import { ArrowLeft, Mail } from 'lucide-react'
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
    <div className={cn("flex flex-col gap-6", className)} {...props}>
      <Card className="overflow-hidden p-0">
        <CardContent className="grid p-0 md:grid-cols-2">
          {success ? (
            <div className="flex flex-col items-center justify-center gap-4 p-6 md:p-8">
              <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                <Mail className="h-8 w-8 text-primary" aria-hidden="true" />
              </div>
              <div className="text-center">
                <h1 className="text-2xl font-bold">Email envoyé</h1>
                <p className="mt-2 text-sm text-muted-foreground text-balance">
                  Si un compte existe avec cette adresse, vous recevrez un lien
                  pour réinitialiser votre mot de passe.
                </p>
              </div>
              <Button asChild className="mt-2">
                <Link href="/login">Retour à la connexion</Link>
              </Button>
            </div>
          ) : (
            <form className="p-6 md:p-8" onSubmit={handleSubmit}>
              <FieldGroup>
                <div className="flex flex-col items-center gap-2 text-center">
                  <h1 className="text-2xl font-bold">Mot de passe oublié</h1>
                  <p className="text-muted-foreground text-sm text-balance">
                    Entrez votre adresse email pour recevoir un lien de réinitialisation
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
                  <Button type="submit" disabled={isLoading} className="w-full">
                    {isLoading ? 'Envoi\u2026' : 'Envoyer le lien'}
                  </Button>
                </Field>

                <FieldDescription className="text-center">
                  <Link
                    href="/login"
                    className="inline-flex items-center gap-1 underline underline-offset-2 hover:text-primary"
                  >
                    <ArrowLeft className="h-3 w-3" />
                    Retour à la connexion
                  </Link>
                </FieldDescription>
              </FieldGroup>
            </form>
          )}

          <div className="bg-primary relative hidden md:block">
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="text-primary-foreground text-center p-8">
                <h2 className="text-3xl font-bold mb-4">Learning</h2>
                <p className="text-lg opacity-90">
                  Réinitialisez votre mot de passe
                </p>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
