import Link from 'next/link'
import {
  ArrowRight,
  BookOpen,
  Brain,
  BarChart3,
  Lock,
  CheckCircle2,
} from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'
import { LandingHeader } from '@/components/landing-header'
import { PARCOURS_LIST } from '@/lib/parcours/config'

const FEATURES = [
  {
    icon: BookOpen,
    title: 'Cours structurés',
    description:
      'Leçons claires par chapitre avec formules KaTeX, exemples détaillés et propriétés visuelles.',
  },
  {
    icon: Brain,
    title: 'Exercices & QCM',
    description:
      'Pratique interactive avec correction immédiate, explications détaillées et raccourcis clavier.',
  },
  {
    icon: BarChart3,
    title: 'Suivi de progression',
    description:
      'Visualisez votre avancement module par module. Créez un compte pour sauvegarder.',
  },
]

const STATS = [
  { value: '15', label: 'Modules' },
  { value: '90+', label: 'Activités' },
  { value: '100%', label: 'Gratuit' },
]

const HIGHLIGHTS = [
  'Cours complets avec formules interactives',
  'QCM avec correction et explications',
  'Séries de révision par module',
  'Aucune inscription requise',
]

export default function LandingPage() {
  const allParcours = [...PARCOURS_LIST].sort((a, b) => a.order - b.order)
  const activeParcours = allParcours.find((p) => p.slug === '1ere-tc')
  const comingSoonParcours = allParcours.filter((p) => p.slug !== '1ere-tc')

  return (
    <div className="flex min-h-svh flex-col">
      <LandingHeader />

      {/* ── Hero ── */}
      <section className="relative overflow-hidden bg-[oklch(0.065_0.005_264)]">
        {/* Dot grid pattern */}
        <div
          className="pointer-events-none absolute inset-0"
          style={{
            backgroundImage:
              'radial-gradient(oklch(1 0 0 / 0.06) 1px, transparent 1px)',
            backgroundSize: '32px 32px',
          }}
          aria-hidden="true"
        />
        {/* Blue glow — top right */}
        <div
          className="pointer-events-none absolute -right-32 -top-32 h-[500px] w-[500px] rounded-full opacity-20 blur-[120px]"
          style={{ background: 'oklch(0.55 0.24 264)' }}
          aria-hidden="true"
        />
        {/* Blue glow — bottom left */}
        <div
          className="pointer-events-none absolute -bottom-40 -left-40 h-[400px] w-[400px] rounded-full opacity-10 blur-[100px]"
          style={{ background: 'oklch(0.55 0.24 264)' }}
          aria-hidden="true"
        />

        <div className="relative mx-auto max-w-7xl px-4 pb-20 pt-16 md:px-6 md:pb-32 md:pt-28">
          {/* Badge */}
          <div
            className="animate-landing-fade-in"
            style={{ animationDelay: '0s' }}
          >
            <Badge
              variant="outline"
              className="border-[oklch(0.55_0.24_264/0.4)] bg-[oklch(0.55_0.24_264/0.1)] text-[oklch(0.75_0.15_264)] backdrop-blur-sm"
            >
              Nouveau — Parcours 1ère TC disponible
            </Badge>
          </div>

          {/* Heading */}
          <h1
            className="animate-landing-fade-in mt-6 max-w-4xl font-heading text-4xl font-bold tracking-tight text-white sm:text-5xl md:text-7xl"
            style={{ animationDelay: '0.1s' }}
          >
            Les maths,
            <br />
            <span className="text-[oklch(0.65_0.2_264)]">maîtrisées.</span>
          </h1>

          {/* Subtitle */}
          <p
            className="animate-landing-fade-in mt-6 max-w-xl text-base leading-relaxed text-[oklch(1_0_0/0.5)] md:text-lg"
            style={{ animationDelay: '0.2s' }}
          >
            Le parcours complet de 1ère année Tronc Commun — 15&nbsp;modules
            structurés, exercices interactifs et QCM. 100% gratuit, sans
            inscription.
          </p>

          {/* CTA */}
          <div
            className="animate-landing-fade-in mt-8 flex flex-wrap gap-3"
            style={{ animationDelay: '0.3s' }}
          >
            <Button size="lg" asChild>
              <Link href="/1ere-tc/apprendre">
                Explorer le parcours 1ère TC
                <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
            <Button
              size="lg"
              variant="outline"
              className="border-[oklch(1_0_0/0.15)] bg-transparent text-white hover:bg-[oklch(1_0_0/0.08)] hover:text-white"
              asChild
            >
              <Link href="/login">J&apos;ai un compte</Link>
            </Button>
          </div>

          {/* Stats */}
          <div
            className="animate-landing-fade-in mt-16 flex gap-8 border-t border-[oklch(1_0_0/0.1)] pt-8 md:gap-16"
            style={{ animationDelay: '0.4s' }}
          >
            {STATS.map((stat) => (
              <div key={stat.label}>
                <div className="font-heading text-2xl font-bold tabular-nums text-white md:text-3xl">
                  {stat.value}
                </div>
                <div className="text-sm text-[oklch(1_0_0/0.4)]">
                  {stat.label}
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── Features ── */}
      <section className="border-b bg-background py-20 md:py-28">
        <div className="mx-auto max-w-7xl px-4 md:px-6">
          <div className="mb-12 max-w-2xl">
            <h2 className="font-heading text-3xl font-bold tracking-tight text-foreground md:text-4xl">
              Tout pour réussir
            </h2>
            <p className="mt-3 text-lg text-muted-foreground">
              Une plateforme pensée pour les élèves du lycée tunisien.
            </p>
          </div>
          <div className="grid gap-6 md:grid-cols-3">
            {FEATURES.map((feature) => (
              <Card key={feature.title} className="border-border/50">
                <CardHeader>
                  <div className="flex h-10 w-10 items-center justify-center rounded-lg border border-primary/20 bg-primary/10">
                    <feature.icon
                      className="h-5 w-5 text-primary"
                      aria-hidden="true"
                    />
                  </div>
                  <CardTitle className="pt-3 font-heading">
                    {feature.title}
                  </CardTitle>
                  <CardDescription className="text-[15px] leading-relaxed">
                    {feature.description}
                  </CardDescription>
                </CardHeader>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* ── Parcours ── */}
      <section className="border-b bg-muted/50 py-20 md:py-28">
        <div className="mx-auto max-w-7xl px-4 md:px-6">
          <div className="mb-12 max-w-2xl">
            <h2 className="font-heading text-3xl font-bold tracking-tight text-foreground md:text-4xl">
              Les parcours
            </h2>
            <p className="mt-3 text-lg text-muted-foreground">
              Un parcours structuré pour chaque niveau du lycée.
            </p>
          </div>

          {/* Active parcours — featured */}
          {activeParcours && (
            <Card className="mb-6 border-primary/30">
              <CardHeader>
                <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
                  <div className="flex-1">
                    <div className="flex items-center gap-2">
                      <CardTitle className="font-heading text-xl">
                        {activeParcours.label}
                      </CardTitle>
                      <Badge className="bg-primary text-primary-foreground">
                        Disponible
                      </Badge>
                    </div>
                    <CardDescription className="mt-2 text-[15px] leading-relaxed">
                      {activeParcours.description} — 15 modules complets avec
                      cours, exercices et QCM.
                    </CardDescription>
                    <ul className="mt-4 grid gap-1.5 text-sm text-muted-foreground sm:grid-cols-2">
                      {HIGHLIGHTS.map((item) => (
                        <li key={item} className="flex items-center gap-2">
                          <CheckCircle2
                            className="h-4 w-4 shrink-0 text-primary"
                            aria-hidden="true"
                          />
                          {item}
                        </li>
                      ))}
                    </ul>
                  </div>
                  <Button asChild className="shrink-0 sm:mt-0">
                    <Link href="/1ere-tc/apprendre">
                      Explorer
                      <ArrowRight
                        className="ml-2 h-4 w-4"
                        aria-hidden="true"
                      />
                    </Link>
                  </Button>
                </div>
              </CardHeader>
            </Card>
          )}

          {/* Coming soon parcours */}
          <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
            {comingSoonParcours.map((parcours) => (
              <Card
                key={parcours.slug}
                className="border-border/40 opacity-60"
              >
                <CardHeader className="pb-4">
                  <div className="flex items-center justify-between gap-2">
                    <CardTitle className="font-heading text-base">
                      {parcours.label}
                    </CardTitle>
                    <Badge variant="secondary" className="shrink-0 text-xs">
                      <Lock
                        className="mr-1 h-3 w-3"
                        aria-hidden="true"
                      />
                      Bientôt
                    </Badge>
                  </div>
                  {parcours.description && (
                    <CardDescription className="text-sm">
                      {parcours.description}
                    </CardDescription>
                  )}
                </CardHeader>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* ── CTA Final ── */}
      <section className="py-20 md:py-28">
        <div className="mx-auto max-w-7xl px-4 md:px-6">
          <Card className="relative overflow-hidden border-[oklch(1_0_0/0.08)] bg-[oklch(0.065_0.005_264)] text-white">
            {/* Grid pattern */}
            <div
              className="pointer-events-none absolute inset-0"
              style={{
                backgroundImage:
                  'radial-gradient(oklch(1 0 0 / 0.04) 1px, transparent 1px)',
                backgroundSize: '24px 24px',
              }}
              aria-hidden="true"
            />
            <CardContent className="relative flex flex-col items-center gap-4 px-6 py-16 text-center">
              <h2 className="text-balance font-heading text-2xl font-bold md:text-3xl">
                Prêt à commencer ?
              </h2>
              <p className="max-w-md text-[oklch(1_0_0/0.6)]">
                Le premier chapitre est à un clic. Aucune inscription requise.
              </p>
              <Button size="lg" asChild className="mt-2">
                <Link href="/1ere-tc/apprendre">
                  Commencer le premier chapitre
                  <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
                </Link>
              </Button>
              <p className="mt-2 text-sm text-[oklch(1_0_0/0.35)]">
                Créez un compte pour sauvegarder votre progression
              </p>
            </CardContent>
          </Card>
        </div>
      </section>

      {/* ── Footer ── */}
      <footer className="mt-auto border-t">
        <div className="mx-auto flex w-full max-w-7xl flex-col items-center gap-4 px-4 py-8 text-sm text-muted-foreground md:flex-row md:justify-between md:px-6">
          <span className="font-heading font-semibold text-foreground">
            Learning OS
          </span>
          <div className="flex gap-6">
            <Link
              href="/terms"
              className="transition-colors duration-200 hover:text-foreground"
            >
              Conditions
            </Link>
            <Link
              href="/privacy"
              className="transition-colors duration-200 hover:text-foreground"
            >
              Confidentialité
            </Link>
          </div>
          <span>&copy; {new Date().getFullYear()} Learning OS</span>
        </div>
      </footer>
    </div>
  )
}
