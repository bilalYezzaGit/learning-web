'use client'

/**
 * OnboardingOverlay — first-time user onboarding flow.
 *
 * Shows a 2-step overlay on first visit. Persists dismiss in localStorage.
 */

import * as React from 'react'
import Link from 'next/link'
import { QrCode, ArrowRight, BookOpen, X } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'

const ONBOARDED_KEY = 'aylan-onboarded'

const STEPS = [
  {
    icon: BookOpen,
    title: 'Bienvenue sur Aylan',
    description:
      'Aylan augmente ton livret de maths avec la correction IA, des QCM interactifs et un suivi de ta progression.',
  },
  {
    icon: QrCode,
    title: 'Scanne ton livret',
    description:
      'Chaque exercice de ton livret a un QR code. Scanne-le pour acc\u00e9der au contenu augment\u00e9.',
  },
]

export function OnboardingOverlay() {
  const [visible, setVisible] = React.useState(false)
  const [step, setStep] = React.useState(0)

  React.useEffect(() => {
    try {
      if (!localStorage.getItem(ONBOARDED_KEY)) {
        setVisible(true)
      }
    } catch {
      // localStorage unavailable
    }
  }, [])

  const handleDismiss = () => {
    setVisible(false)
    try {
      localStorage.setItem(ONBOARDED_KEY, 'true')
    } catch {
      // localStorage unavailable
    }
  }

  const handleNext = () => {
    if (step < STEPS.length - 1) {
      setStep((s) => s + 1)
    } else {
      handleDismiss()
    }
  }

  if (!visible) return null

  const currentStep = STEPS[step]
  if (!currentStep) return null

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
      <Card className="relative mx-auto w-full max-w-sm">
        <Button
          variant="ghost"
          size="icon"
          className="absolute right-2 top-2 h-8 w-8"
          onClick={handleDismiss}
          aria-label="Fermer"
        >
          <X className="h-4 w-4" aria-hidden="true" />
        </Button>
        <CardContent className="flex flex-col items-center gap-4 px-6 py-8 text-center">
          <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
            <currentStep.icon className="h-8 w-8 text-primary" aria-hidden="true" />
          </div>
          <h2 className="font-serif text-xl font-semibold">{currentStep.title}</h2>
          <p className="text-sm leading-relaxed text-muted-foreground">
            {currentStep.description}
          </p>

          {/* Step indicators */}
          <div className="flex gap-1.5" aria-hidden="true">
            {STEPS.map((_, i) => (
              <div
                key={i}
                className={`h-1.5 w-6 rounded-full transition-colors ${
                  i === step ? 'bg-primary' : 'bg-muted'
                }`}
              />
            ))}
          </div>

          {step < STEPS.length - 1 ? (
            <Button onClick={handleNext} className="w-full">
              Suivant
              <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
            </Button>
          ) : (
            <Button asChild className="w-full">
              <Link href="/app/scan" onClick={handleDismiss}>
                Scanne ton livret
                <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
