import Link from 'next/link'
import {
  BookOpen,
  Brain,
  BarChart3,
  ArrowRight,
  GraduationCap,
  Sparkles,
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
import { PARCOURS_LIST } from '@/lib/parcours'

const FEATURED_SLUG = '1ere-tc'

export default function LandingPage() {
  const featured = PARCOURS_LIST.find((p) => p.slug === FEATURED_SLUG)
  const otherParcours = PARCOURS_LIST.filter((p) => p.slug !== FEATURED_SLUG).sort(
    (a, b) => a.order - b.order
  )

  return (
    <div className="flex min-h-svh flex-col">
      <LandingHeader />

      {/* ── Hero ── */}
      <section className="relative overflow-hidden bg-med-sand-light" id="main-content">
        <div className="zellige-pattern absolute inset-0" aria-hidden="true" />

        <div className="relative mx-auto flex w-full max-w-5xl flex-col items-center gap-8 px-4 py-24 text-center md:px-6 md:py-36">
          <Badge
            variant="secondary"
            className="border-med-turquoise/30 bg-med-turquoise/10 text-sm font-medium text-primary"
          >
            Programme tunisien &middot; Mathematiques
          </Badge>

          <h1 className="max-w-4xl text-balance font-serif text-4xl font-bold tracking-tight md:text-5xl lg:text-6xl">
            Reussis tes maths avec{' '}
            <span className="text-primary">excellence</span>
          </h1>

          <p className="max-w-2xl text-balance text-lg text-muted-foreground md:text-xl">
            Des cours structures, des exercices interactifs et un suivi de
            progression pour le lycee tunisien.{' '}
            <span className="font-medium text-foreground">
              100% gratuit, sans inscription requise.
            </span>
          </p>

          <div className="flex flex-col gap-3 pt-2 sm:flex-row">
            <Button size="lg" className="text-base" asChild>
              <Link href="/1ere-tc/apprendre">
                Explorer le parcours 1ere TC
                <ArrowRight aria-hidden="true" />
              </Link>
            </Button>
            <Button size="lg" variant="outline" className="text-base" asChild>
              <Link href="/login">J&apos;ai un compte</Link>
            </Button>
          </div>

          {/* Stats */}
          <div className="flex flex-wrap items-center justify-center gap-8 pt-4 text-sm text-muted-foreground md:gap-12">
            <div className="flex items-center gap-2">
              <BookOpen className="h-5 w-5 text-primary" aria-hidden="true" />
              <span>
                <strong className="text-foreground">15</strong> modules
              </span>
            </div>
            <div className="flex items-center gap-2">
              <Brain className="h-5 w-5 text-med-turquoise" aria-hidden="true" />
              <span>
                <strong className="text-foreground">90+</strong> activites
              </span>
            </div>
            <div className="flex items-center gap-2">
              <Sparkles className="h-5 w-5 text-med-terracotta" aria-hidden="true" />
              <span>
                <strong className="text-foreground">Acces libre</strong>
              </span>
            </div>
          </div>
        </div>

        {/* Arch divider */}
        <div className="relative h-12 md:h-16" aria-hidden="true">
          <svg
            className="absolute bottom-0 left-0 h-12 w-full text-background md:h-16"
            viewBox="0 0 1440 64"
            preserveAspectRatio="none"
          >
            <path d="M0,64 C360,0 1080,0 1440,64" fill="currentColor" />
          </svg>
        </div>
      </section>

      {/* ── Parcours ── */}
      <section className="mx-auto w-full max-w-5xl px-4 py-16 md:px-6 md:py-20">
        <div className="mb-10 text-center md:mb-12">
          <h2 className="text-balance font-serif text-3xl font-bold md:text-4xl">
            Parcours disponibles
          </h2>
          <p className="mt-3 text-lg text-muted-foreground">
            Le parcours 1ere Tronc Commun est pret. Les autres arrivent bientot.
          </p>
        </div>

        {/* Featured parcours - fully clickable */}
        {featured && (
          <Link href={`/${featured.slug}/apprendre`} className="group mb-6 block">
            <Card className="relative overflow-hidden border-primary/20 bg-gradient-to-br from-primary/5 via-transparent to-med-turquoise/5 transition-all duration-300 hover:border-primary/40 hover:shadow-lg hover:shadow-primary/5">
              <CardHeader className="flex flex-row items-start gap-4 pb-3 sm:items-center">
                <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-xl bg-primary text-primary-foreground">
                  <GraduationCap className="h-7 w-7" aria-hidden="true" />
                </div>
                <div className="min-w-0 flex-1">
                  <div className="flex flex-wrap items-center gap-3">
                    <CardTitle className="text-xl">{featured.label}</CardTitle>
                    <Badge className="bg-primary text-primary-foreground">
                      Disponible
                    </Badge>
                  </div>
                  <CardDescription className="mt-1 text-base">
                    {featured.description}
                  </CardDescription>
                </div>
                <ArrowRight
                  className="hidden h-5 w-5 shrink-0 text-primary opacity-0 transition-all duration-300 group-hover:translate-x-1 group-hover:opacity-100 sm:block"
                  aria-hidden="true"
                />
              </CardHeader>
              <CardContent className="flex flex-wrap gap-4 text-sm text-muted-foreground sm:gap-6">
                <span>15 modules</span>
                <span>90+ activites</span>
                <span>Cours, exercices & QCM</span>
              </CardContent>
            </Card>
          </Link>
        )}

        {/* Other parcours - coming soon */}
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          {otherParcours.map((parcours) => (
            <Card key={parcours.slug} className="opacity-50">
              <CardHeader className="pb-2">
                <div className="flex items-center justify-between gap-2">
                  <CardTitle className="text-base">{parcours.label}</CardTitle>
                  <Badge variant="secondary" className="shrink-0 text-xs">
                    Bientot
                  </Badge>
                </div>
                <CardDescription className="text-sm">
                  {parcours.description}
                </CardDescription>
              </CardHeader>
            </Card>
          ))}
        </div>
      </section>

      {/* ── Features ── */}
      <section className="relative bg-med-sand-light">
        <div className="zellige-pattern absolute inset-0" aria-hidden="true" />

        <div className="relative mx-auto w-full max-w-5xl px-4 py-16 md:px-6 md:py-20">
          <div className="mb-10 text-center md:mb-12">
            <h2 className="text-balance font-serif text-3xl font-bold md:text-4xl">
              Concu pour ta reussite
            </h2>
            <p className="mt-3 text-lg text-muted-foreground">
              Tout ce qu&apos;il faut pour maitriser le programme de maths.
            </p>
          </div>

          <div className="grid gap-6 md:grid-cols-3">
            <Card className="border-0 bg-background/80 shadow-sm backdrop-blur-sm">
              <CardHeader>
                <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-primary/10">
                  <BookOpen className="h-6 w-6 text-primary" aria-hidden="true" />
                </div>
                <CardTitle className="pt-3">Cours structures</CardTitle>
                <CardDescription className="text-base">
                  Des lecons claires avec formules KaTeX, exemples detailles et
                  visualisations interactives. Chapitre par chapitre.
                </CardDescription>
              </CardHeader>
            </Card>

            <Card className="border-0 bg-background/80 shadow-sm backdrop-blur-sm">
              <CardHeader>
                <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-med-turquoise/15">
                  <Brain className="h-6 w-6 text-med-turquoise" aria-hidden="true" />
                </div>
                <CardTitle className="pt-3">QCM & exercices</CardTitle>
                <CardDescription className="text-base">
                  Correction immediate, score detaille et explications pas a pas
                  pour chaque question. Progresse a ton rythme.
                </CardDescription>
              </CardHeader>
            </Card>

            <Card className="border-0 bg-background/80 shadow-sm backdrop-blur-sm">
              <CardHeader>
                <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-med-terracotta/15">
                  <BarChart3 className="h-6 w-6 text-med-terracotta" aria-hidden="true" />
                </div>
                <CardTitle className="pt-3">Suivi de progression</CardTitle>
                <CardDescription className="text-base">
                  Cree un compte pour visualiser ton avancement et reprendre la
                  ou tu t&apos;es arrete. Optionnel, jamais obligatoire.
                </CardDescription>
              </CardHeader>
            </Card>
          </div>
        </div>
      </section>

      {/* ── Final CTA ── */}
      <section className="mx-auto w-full max-w-5xl px-4 py-16 text-center md:px-6 md:py-20">
        <div className="zellige-pattern-light relative mx-auto max-w-2xl overflow-hidden rounded-2xl bg-gradient-to-br from-primary to-primary/80 px-6 py-10 text-primary-foreground md:px-12 md:py-14">
          <div className="relative">
            <h2 className="text-balance font-serif text-2xl font-bold md:text-3xl">
              Pret a commencer ?
            </h2>
            <p className="mx-auto mt-3 max-w-lg text-primary-foreground/80">
              Ouvre le premier chapitre du parcours 1ere TC. Pas
              d&apos;inscription, pas d&apos;attente.
            </p>
            <Button
              size="lg"
              variant="secondary"
              className="mt-6 text-base font-semibold"
              asChild
            >
              <Link href="/1ere-tc/apprendre">
                Commencer le premier chapitre
                <ArrowRight aria-hidden="true" />
              </Link>
            </Button>
            <p className="mt-4 text-sm text-primary-foreground/60">
              Cree un compte plus tard pour sauvegarder ta progression.
            </p>
          </div>
        </div>
      </section>

      {/* ── Footer ── */}
      <footer className="mt-auto border-t bg-med-sand-light/50">
        <div className="mx-auto flex w-full max-w-5xl flex-col items-center gap-4 px-4 py-8 text-sm text-muted-foreground md:flex-row md:justify-between md:px-6">
          <span className="font-serif text-lg font-semibold text-foreground">
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
              Confidentialite
            </Link>
          </div>
          <span>&copy; 2026 Learning OS</span>
        </div>
      </footer>
    </div>
  )
}
