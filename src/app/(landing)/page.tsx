import Link from 'next/link'
import { ArrowRight, Sparkles, BookOpen, Brain, BarChart3, Lock } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { LandingHeader } from '@/components/landing-header'

const PARCOURS_DISPLAY = [
  {
    slug: '1ere-tc',
    label: '1ere TC',
    description: 'Tronc Commun',
    emoji: '🚀',
    available: true,
    color: 'violet' as const,
  },
  {
    slug: '3eme-math',
    label: '3eme Maths',
    description: '3eme annee',
    emoji: '🔢',
    available: false,
    color: 'pink' as const,
  },
  {
    slug: '2nde-math',
    label: '2nde Maths',
    description: '2nde annee',
    emoji: '📐',
    available: false,
    color: 'cyan' as const,
  },
  {
    slug: '1ere-math',
    label: '1ere Maths',
    description: '1ere annee',
    emoji: '🧮',
    available: false,
    color: 'yellow' as const,
  },
  {
    slug: 'term-math',
    label: 'Terminale',
    description: 'Bac Maths',
    emoji: '🎓',
    available: false,
    color: 'pink' as const,
  },
] as const

const FEATURES = [
  {
    icon: BookOpen,
    title: 'Cours interactifs',
    description: 'Des lecons claires avec des formules KaTeX, des exemples et des animations.',
    emoji: '📖',
    colorClass: 'bg-violet-light text-violet',
  },
  {
    icon: Brain,
    title: 'QCM & Exercices',
    description: 'Teste tes connaissances avec des quiz et des corrections instantanees.',
    emoji: '🧠',
    colorClass: 'bg-pink-light text-pink',
  },
  {
    icon: BarChart3,
    title: 'Suivi de progression',
    description: 'Visualise tes stats, tes points forts et ce qui reste a travailler.',
    emoji: '📊',
    colorClass: 'bg-cyan-light text-cyan',
  },
] as const

const COLOR_BORDERS: Record<string, string> = {
  violet: 'border-violet/30 hover:border-violet/60',
  pink: 'border-pink/30 hover:border-pink/60',
  cyan: 'border-cyan/30 hover:border-cyan/60',
  yellow: 'border-yellow/30 hover:border-yellow/60',
}

const COLOR_BADGES: Record<string, string> = {
  violet: 'bg-violet-light text-violet',
  pink: 'bg-pink-light text-pink',
  cyan: 'bg-cyan-light text-cyan',
  yellow: 'bg-yellow-light text-yellow',
}

export default function LandingPage() {
  return (
    <div className="flex min-h-svh flex-col bg-background">
      <LandingHeader />

      {/* Hero */}
      <section className="relative overflow-hidden">
        {/* Background decorations */}
        <div className="pointer-events-none absolute inset-0 overflow-hidden" aria-hidden="true">
          <div className="absolute -left-32 -top-32 h-96 w-96 rounded-full bg-violet/8 blur-3xl" />
          <div className="absolute -right-32 top-20 h-80 w-80 rounded-full bg-pink/8 blur-3xl" />
          <div className="absolute bottom-0 left-1/3 h-64 w-64 rounded-full bg-cyan/6 blur-3xl" />
        </div>

        <div className="relative mx-auto flex w-full max-w-5xl flex-col items-center gap-8 px-4 py-24 text-center md:px-6 md:py-36">
          <Badge
            variant="secondary"
            className="rounded-full border-violet/20 bg-violet-light px-4 py-1.5 font-heading text-sm font-semibold text-violet shadow-sm"
          >
            <Sparkles className="mr-1.5 h-3.5 w-3.5" aria-hidden="true" />
            Plateforme d&apos;apprentissage
          </Badge>

          <h1 className="max-w-3xl text-balance font-heading text-5xl font-extrabold leading-tight tracking-tight md:text-7xl">
            Les maths, c&apos;est{' '}
            <span className="bg-gradient-to-r from-violet via-pink to-cyan bg-clip-text text-transparent">
              un jeu
            </span>{' '}
            🎮
          </h1>

          <p className="max-w-xl text-balance text-lg text-muted-foreground md:text-xl">
            Des cours fun, des exercices interactifs et un suivi malin pour
            reussir tes maths du lycee. Pas de prise de tete, promis.
          </p>

          <div className="flex flex-col items-center gap-3 pt-2 sm:flex-row">
            <Button
              size="lg"
              className="rounded-2xl bg-gradient-to-r from-violet to-pink px-8 font-heading text-base font-bold text-white shadow-lg shadow-violet/25 transition-all hover:shadow-xl hover:shadow-violet/30 hover:brightness-110"
              asChild
            >
              <Link href="/1ere-tc">
                Explorer le parcours 1ere TC
                <ArrowRight className="ml-1" />
              </Link>
            </Button>
            <Button
              size="lg"
              variant="outline"
              className="rounded-2xl border-2 font-heading text-base font-semibold"
              asChild
            >
              <Link href="/login">J&apos;ai deja un compte</Link>
            </Button>
          </div>

          {/* Social proof dots */}
          <div className="flex items-center gap-2 pt-4 text-sm text-muted-foreground">
            <div className="flex -space-x-2">
              {['bg-violet', 'bg-pink', 'bg-cyan', 'bg-yellow'].map((bg) => (
                <div
                  key={bg}
                  className={`h-7 w-7 rounded-full ${bg} ring-2 ring-background`}
                  aria-hidden="true"
                />
              ))}
            </div>
            <span className="font-medium">Gratuit et open source</span>
          </div>
        </div>
      </section>

      {/* Parcours */}
      <section className="mx-auto w-full max-w-5xl px-4 py-20 md:px-6">
        <div className="mb-12 text-center">
          <h2 className="font-heading text-3xl font-bold md:text-4xl">
            Choisis ton parcours 🎯
          </h2>
          <p className="mt-3 text-lg text-muted-foreground">
            Commence par la 1ere TC, les autres arrivent bientot !
          </p>
        </div>

        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {PARCOURS_DISPLAY.map((parcours) => {
            const isActive = parcours.available
            return (
              <Card
                key={parcours.slug}
                className={`group relative overflow-hidden rounded-2xl border-2 transition-all duration-200 ${
                  COLOR_BORDERS[parcours.color]
                } ${
                  isActive
                    ? 'shadow-md hover:-translate-y-1 hover:shadow-xl'
                    : 'opacity-60'
                }`}
              >
                <CardContent className="flex flex-col items-start gap-3 p-6">
                  <div className="flex w-full items-center justify-between">
                    <span className="text-3xl" role="img" aria-hidden="true">
                      {parcours.emoji}
                    </span>
                    {isActive ? (
                      <Badge className={`rounded-full font-heading text-xs font-bold ${COLOR_BADGES[parcours.color]}`}>
                        Disponible
                      </Badge>
                    ) : (
                      <Badge variant="outline" className="rounded-full border-muted-foreground/30 font-heading text-xs text-muted-foreground">
                        <Lock className="mr-1 h-3 w-3" />
                        Bientot
                      </Badge>
                    )}
                  </div>
                  <div>
                    <h3 className="font-heading text-lg font-bold">{parcours.label}</h3>
                    <p className="text-sm text-muted-foreground">{parcours.description}</p>
                  </div>
                  {isActive && (
                    <Button
                      className="mt-1 w-full rounded-xl bg-gradient-to-r from-violet to-pink font-heading font-semibold text-white shadow-md hover:shadow-lg hover:brightness-110"
                      asChild
                    >
                      <Link href={`/${parcours.slug}`}>
                        C&apos;est parti !
                        <ArrowRight className="ml-1 h-4 w-4" />
                      </Link>
                    </Button>
                  )}
                </CardContent>
              </Card>
            )
          })}
        </div>
      </section>

      {/* Features */}
      <section className="bg-muted/40 py-20">
        <div className="mx-auto w-full max-w-5xl px-4 md:px-6">
          <div className="mb-12 text-center">
            <h2 className="font-heading text-3xl font-bold md:text-4xl">
              Comment ca marche ✨
            </h2>
            <p className="mt-3 text-lg text-muted-foreground">
              Tout ce qu&apos;il faut pour progresser, rien de superflu.
            </p>
          </div>

          <div className="grid gap-6 md:grid-cols-3">
            {FEATURES.map((feature) => (
              <Card
                key={feature.title}
                className="group rounded-2xl border-0 bg-card shadow-sm transition-all duration-200 hover:-translate-y-1 hover:shadow-lg"
              >
                <CardContent className="flex flex-col gap-4 p-6">
                  <div
                    className={`flex h-14 w-14 items-center justify-center rounded-2xl ${feature.colorClass}`}
                  >
                    <feature.icon className="h-7 w-7" aria-hidden="true" />
                  </div>
                  <div>
                    <h3 className="font-heading text-lg font-bold">
                      {feature.emoji} {feature.title}
                    </h3>
                    <p className="mt-1.5 text-sm leading-relaxed text-muted-foreground">
                      {feature.description}
                    </p>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="mx-auto w-full max-w-5xl px-4 py-20 md:px-6">
        <Card className="relative overflow-hidden rounded-3xl border-0 bg-gradient-to-br from-violet via-pink to-cyan p-1 shadow-2xl">
          <div className="rounded-[calc(1.5rem-4px)] bg-gradient-to-br from-violet to-pink px-6 py-16 text-center text-white sm:px-12">
            <h2 className="font-heading text-3xl font-extrabold md:text-4xl">
              Pret a demarrer ? 🔥
            </h2>
            <p className="mx-auto mt-4 max-w-md text-lg text-white/80">
              Le parcours 1ere TC est disponible des maintenant.
              Explore les cours, fais des exos, progresse a ton rythme.
            </p>
            <Button
              size="lg"
              className="mt-8 rounded-2xl bg-white px-8 font-heading text-base font-bold text-violet shadow-lg transition-all hover:bg-white/90 hover:shadow-xl"
              asChild
            >
              <Link href="/1ere-tc">
                Explorer le parcours 1ere TC
                <ArrowRight className="ml-1" />
              </Link>
            </Button>
          </div>
        </Card>
      </section>

      {/* Footer */}
      <footer className="mt-auto border-t border-border/50 bg-muted/30">
        <div className="mx-auto flex w-full max-w-7xl flex-col items-center gap-4 px-4 py-8 text-sm text-muted-foreground md:flex-row md:justify-between md:px-6">
          <div className="flex items-center gap-2.5">
            <div className="flex h-7 w-7 items-center justify-center rounded-lg bg-gradient-to-br from-violet to-pink text-xs font-bold text-white">
              L
            </div>
            <span className="font-heading font-bold text-foreground">Learning OS</span>
          </div>
          <div className="flex gap-6">
            <Link href="/terms" className="transition-colors hover:text-foreground">
              Conditions
            </Link>
            <Link href="/privacy" className="transition-colors hover:text-foreground">
              Confidentialite
            </Link>
          </div>
          <span>&copy; {new Date().getFullYear()} Learning OS</span>
        </div>
      </footer>
    </div>
  )
}
