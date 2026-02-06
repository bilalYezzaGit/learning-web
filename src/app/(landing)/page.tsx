import Link from 'next/link'
import { BookOpen, Brain, BarChart3, ArrowRight } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'
import { LandingHeader } from '@/components/landing-header'
import { getAvailableParcours } from '@/lib/parcours'

export default function LandingPage() {
  const parcoursList = getAvailableParcours()

  return (
    <div className="flex min-h-svh flex-col">
      <LandingHeader />

      {/* Hero */}
      <section className="mx-auto flex w-full max-w-7xl flex-col items-center gap-6 px-4 py-20 text-center md:px-6 md:py-32">
        <Badge variant="secondary" className="text-sm">
          Plateforme d&apos;apprentissage
        </Badge>
        <h1 className="max-w-3xl text-balance text-4xl font-bold tracking-tight md:text-6xl">
          Apprenez les maths à votre rythme
        </h1>
        <p className="max-w-xl text-lg text-muted-foreground md:text-xl">
          Des cours structurés, des exercices interactifs et un suivi de
          progression pour réussir du collège au lycée.
        </p>
        <div className="flex gap-3 pt-2">
          <Button size="lg" asChild>
            <Link href="/signup">
              Commencer gratuitement
              <ArrowRight />
            </Link>
          </Button>
          <Button size="lg" variant="outline" asChild>
            <Link href="/login">J&apos;ai un compte</Link>
          </Button>
        </div>
      </section>

      <Separator />

      {/* Features */}
      <section className="mx-auto w-full max-w-7xl px-4 py-20 md:px-6">
        <div className="mb-12 text-center">
          <h2 className="text-balance text-3xl font-semibold">Comment ça marche</h2>
          <p className="mt-3 text-lg text-muted-foreground">
            Tout ce qu&apos;il faut pour progresser en mathématiques.
          </p>
        </div>
        <div className="mx-auto grid max-w-4xl gap-6 md:grid-cols-3">
          <Card>
            <CardHeader>
              <div className="flex h-12 w-12 items-center justify-center rounded-lg bg-primary/10">
                <BookOpen className="h-6 w-6 text-primary" aria-hidden="true" />
              </div>
              <CardTitle className="pt-2">Cours structurés</CardTitle>
              <CardDescription>
                Des leçons claires organisées par chapitre, avec des exemples et
                des formules interactives.
              </CardDescription>
            </CardHeader>
          </Card>
          <Card>
            <CardHeader>
              <div className="flex h-12 w-12 items-center justify-center rounded-lg bg-primary/10">
                <Brain className="h-6 w-6 text-primary" aria-hidden="true" />
              </div>
              <CardTitle className="pt-2">Exercices interactifs</CardTitle>
              <CardDescription>
                QCM, calculs et problèmes avec correction immédiate pour ancrer
                les connaissances.
              </CardDescription>
            </CardHeader>
          </Card>
          <Card>
            <CardHeader>
              <div className="flex h-12 w-12 items-center justify-center rounded-lg bg-primary/10">
                <BarChart3 className="h-6 w-6 text-primary" aria-hidden="true" />
              </div>
              <CardTitle className="pt-2">Suivi de progression</CardTitle>
              <CardDescription>
                Visualisez votre avancement et identifiez les points à
                travailler.
              </CardDescription>
            </CardHeader>
          </Card>
        </div>
      </section>

      <Separator />

      {/* Parcours */}
      <section className="mx-auto w-full max-w-7xl px-4 py-20 md:px-6">
        <div className="mb-12 text-center">
          <h2 className="text-balance text-3xl font-semibold">Choisissez votre parcours</h2>
          <p className="mt-3 text-lg text-muted-foreground">
            Sélectionnez le niveau qui correspond à vos besoins.
          </p>
        </div>
        <div className="mx-auto grid max-w-3xl gap-4 sm:grid-cols-2">
          {parcoursList.map((parcours) => (
            <Card key={parcours.slug}>
              <CardHeader>
                <CardTitle>{parcours.label}</CardTitle>
                <CardDescription>{parcours.description}</CardDescription>
              </CardHeader>
              <CardContent>
                <Button variant="outline" className="w-full" asChild>
                  <Link href={`/${parcours.slug}`}>
                    Découvrir
                    <ArrowRight />
                  </Link>
                </Button>
              </CardContent>
            </Card>
          ))}
        </div>
      </section>

      <Separator />

      {/* CTA */}
      <section className="mx-auto w-full max-w-7xl px-4 py-20 text-center md:px-6">
        <Card className="mx-auto max-w-2xl bg-primary text-primary-foreground">
          <CardContent className="flex flex-col items-center gap-4 py-12">
            <h2 className="text-balance text-2xl font-semibold">Prêt à commencer ?</h2>
            <p className="text-primary-foreground/80">
              Créez un compte gratuit et commencez à progresser dès maintenant.
            </p>
            <Button size="lg" variant="secondary" asChild>
              <Link href="/signup">Créer un compte</Link>
            </Button>
          </CardContent>
        </Card>
      </section>

      {/* Footer */}
      <footer className="mt-auto border-t">
        <div className="mx-auto flex w-full max-w-7xl flex-col items-center gap-4 px-4 py-8 text-sm text-muted-foreground md:flex-row md:justify-between md:px-6">
          <span className="font-medium text-foreground">Learning OS</span>
          <div className="flex gap-6">
            <Link href="/terms" className="hover:text-foreground transition-colors">
              Conditions
            </Link>
            <Link href="/privacy" className="hover:text-foreground transition-colors">
              Confidentialité
            </Link>
          </div>
          <span>&copy; {new Date().getFullYear()} Learning OS</span>
        </div>
      </footer>
    </div>
  )
}
