'use client'

import * as React from 'react'
import { GraduationCap, X } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'

const ONBOARDING_KEY = 'onboarding-dismissed'

export function OnboardingBanner() {
  const [visible, setVisible] = React.useState(false)

  React.useEffect(() => {
    try {
      if (!localStorage.getItem(ONBOARDING_KEY)) {
        setVisible(true)
      }
    } catch { /* localStorage unavailable */ }
  }, [])

  const dismiss = () => {
    setVisible(false)
    try {
      localStorage.setItem(ONBOARDING_KEY, '1')
    } catch { /* ok */ }
  }

  if (!visible) return null

  return (
    <Card className="mx-4 border-primary/20 bg-primary/5 md:mx-6">
      <CardContent className="flex items-start gap-3 py-4">
        <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary/10">
          <GraduationCap className="h-5 w-5 text-primary" aria-hidden="true" />
        </div>
        <div className="flex-1 min-w-0">
          <p className="text-sm font-medium">Bienvenue sur Learning !</p>
          <p className="mt-0.5 text-xs text-muted-foreground">
            Explorez vos cours dans &quot;Apprendre&quot; et testez-vous avec les séries dans &quot;Réviser&quot;.
            Votre progression est sauvegardée automatiquement.
          </p>
        </div>
        <Button
          variant="ghost"
          size="icon-sm"
          onClick={dismiss}
          aria-label="Fermer le message de bienvenue"
        >
          <X className="h-3.5 w-3.5" aria-hidden="true" />
        </Button>
      </CardContent>
    </Card>
  )
}
