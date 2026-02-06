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
import { getAvailableParcours } from '@/lib/parcours'

export default function LandingPage() {
  const parcoursList = getAvailableParcours()

  return (
    <div className="flex min-h-svh flex-col">
      {/* Nav */}
      <header className="border-b">
        <div className="mx-auto flex h-14 w-full max-w-7xl items-center justify-between px-4 md:px-6">
          <span className="text-lg font-semibold">Learning OS</span>
          <div className="flex items-center gap-2">
            <Button variant="ghost" size="sm" asChild>
              <Link href="/login">Se connecter</Link>
            </Button>
            <Button size="sm" asChild>
              <Link href="/signup">S&apos;inscrire</Link>
            </Button>
          </div>
        </div>
      </header>

      {/* Hero */}
      <section className="mx-auto flex w-full max-w-7xl flex-col items-center gap-6 px-4 py-16 text-center md:px-6 md:py-24">
        <Badge variant="secondary">Plateforme d&apos;apprentissage</Badge>
        <h1 className="max-w-2xl text-3xl font-bold tracking-tight md:text-5xl">
          Apprenez les maths à votre rythme
        </h1>
        <p className="max-w-lg text-muted-foreground md:text-lg">
          Des cours structurés, des exercices interactifs et un suivi de
          progression pour réussir du collège au lycée.
        </p>
        <div className="flex gap-3">
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
      <section className="mx-auto w-full max-w-7xl px-4 py-16 md:px-6">
        <div className="mb-10 text-center">
          <h2 className="text-2xl font-semibold">Comment ça marche</h2>
          <p className="mt-2 text-muted-foreground">
            Tout ce qu&apos;il faut pour progresser en mathématiques.
          </p>
        </div>
        <div className="mx-auto grid max-w-4xl gap-4 md:grid-cols-3">
          <Card>
            <CardHeader>
              <BookOpen className="h-8 w-8 text-primary" />
              <CardTitle>Cours structurés</CardTitle>
              <CardDescription>
                Des leçons claires organisées par chapitre, avec des exemples et
                des formules interactives.
              </CardDescription>
            </CardHeader>
          </Card>
          <Card>
            <CardHeader>
              <Brain className="h-8 w-8 text-primary" />
              <CardTitle>Exercices interactifs</CardTitle>
              <CardDescription>
                QCM, calculs et problèmes avec correction immédiate pour ancrer
                les connaissances.
              </CardDescription>
            </CardHeader>
          </Card>
          <Card>
            <CardHeader>
              <BarChart3 className="h-8 w-8 text-primary" />
              <CardTitle>Suivi de progression</CardTitle>
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
      <section className="mx-auto w-full max-w-7xl px-4 py-16 md:px-6">
        <div className="mb-10 text-center">
          <h2 className="text-2xl font-semibold">Choisissez votre parcours</h2>
          <p className="mt-2 text-muted-foreground">
            Sélectionnez le niveau qui correspond à vos besoins.
          </p>
        </div>
        <div className="mx-auto grid max-w-3xl gap-4 sm:grid-cols-2">
          {parcoursList.map((parcours) => (
            <Card key={parcours.slug} className="relative">
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
      <section className="mx-auto w-full max-w-7xl px-4 py-16 text-center md:px-6">
        <h2 className="text-2xl font-semibold">Prêt à commencer ?</h2>
        <p className="mt-2 text-muted-foreground">
          Créez un compte gratuit et commencez à progresser dès maintenant.
        </p>
        <div className="mt-6 flex justify-center gap-3">
          <Button size="lg" asChild>
            <Link href="/signup">Créer un compte</Link>
          </Button>
        </div>
      </section>

      {/* Footer */}
      <footer className="mt-auto border-t py-6">
        <div className="mx-auto w-full max-w-7xl px-4 text-center text-sm text-muted-foreground md:px-6">
          Learning OS &copy; {new Date().getFullYear()}
        </div>
      </footer>
    </div>
  )
}
