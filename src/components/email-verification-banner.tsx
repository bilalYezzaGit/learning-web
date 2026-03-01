'use client'

import * as React from 'react'
import { Mail, X } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { useAuth } from '@/lib/context'
import { sendVerificationEmail } from '@/lib/services/user-service'

export function EmailVerificationBanner() {
  const { user, isAuthenticated } = useAuth()
  const [dismissed, setDismissed] = React.useState(false)
  const [sending, setSending] = React.useState(false)
  const [sent, setSent] = React.useState(false)

  if (!isAuthenticated || !user || user.emailVerified || dismissed) {
    return null
  }

  const handleResend = async () => {
    setSending(true)
    try {
      await sendVerificationEmail(user)
      setSent(true)
    } catch {
      // Silently fail — Firebase may throttle
    } finally {
      setSending(false)
    }
  }

  return (
    <div className="flex items-center gap-3 border-b bg-warning/10 px-4 py-2 text-sm">
      <Mail className="h-4 w-4 shrink-0 text-warning-foreground" aria-hidden="true" />
      <p className="flex-1 text-warning-foreground">
        {sent
          ? 'Email de vérification envoyé. Vérifiez votre boîte mail.'
          : 'Veuillez vérifier votre adresse email.'}
      </p>
      {!sent && (
        <Button variant="outline" size="sm" onClick={handleResend} disabled={sending}>
          {sending ? 'Envoi\u2026' : 'Renvoyer'}
        </Button>
      )}
      <Button
        variant="ghost"
        size="icon-sm"
        onClick={() => setDismissed(true)}
        aria-label="Fermer"
      >
        <X className="h-3.5 w-3.5" aria-hidden="true" />
      </Button>
    </div>
  )
}
