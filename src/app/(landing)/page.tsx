import Link from 'next/link'
import {
  BookOpen,
  Brain,
  BarChart3,
  ArrowRight,
  Sparkles,
  Lock,
  Zap,
  GraduationCap,
  Target,
  TrendingUp,
} from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { LandingHeader } from '@/components/landing-header'

const PARCOURS_DATA = [
  {
    slug: '1ere-tc',
    label: '1ere TC',
    fullLabel: 'Tronc Commun',
    description: '15 modules complets, 90+ activites interactives',
    active: true,
  },
  {
    slug: '3eme-math',
    label: '3eme Maths',
    fullLabel: '3eme Mathematiques',
    description: 'Programme complet 3eme annee',
    active: false,
  },
  {
    slug: '2nde-math',
    label: '2nde Maths',
    fullLabel: '2nde Mathematiques',
    description: 'Programme complet 2nde annee',
    active: false,
  },
  {
    slug: '1ere-math',
    label: '1ere Maths',
    fullLabel: '1ere Mathematiques',
    description: 'Programme complet 1ere annee',
    active: false,
  },
  {
    slug: 'term-math',
    label: 'Terminale',
    fullLabel: 'Terminale Mathematiques',
    description: 'Programme complet Terminale',
    active: false,
  },
]

const FEATURES = [
  {
    icon: BookOpen,
    title: 'Cours structures',
    description:
      'Des lecons claires avec formules KaTeX, exemples interactifs et progression logique chapitre par chapitre.',
    accent: 'from-amber-500/20 to-orange-500/20',
  },
  {
    icon: Brain,
    title: 'QCM intelligents',
    description:
      'Questions a choix multiples avec correction immediate, explications detaillees et suivi de score en temps reel.',
    accent: 'from-blue-500/20 to-cyan-500/20',
  },
  {
    icon: Target,
    title: 'Exercices cibles',
    description:
      'Problemes et calculs adaptes au programme officiel tunisien avec solutions pas a pas.',
    accent: 'from-emerald-500/20 to-green-500/20',
  },
  {
    icon: TrendingUp,
    title: 'Series de revision',
    description:
      'Enchainements structures d\'activites pour preparer controles et examens, avec suivi de progression.',
    accent: 'from-purple-500/20 to-violet-500/20',
  },
  {
    icon: BarChart3,
    title: 'Suivi de progression',
    description:
      'Visualisez votre avancement module par module et identifiez les points a retravailler.',
    accent: 'from-rose-500/20 to-pink-500/20',
  },
  {
    icon: Zap,
    title: 'Acces libre',
    description:
      '100% gratuit, sans inscription obligatoire. Creez un compte uniquement pour sauvegarder votre progression.',
    accent: 'from-yellow-500/20 to-amber-500/20',
  },
]

const STATS = [
  { value: '15', label: 'Modules' },
  { value: '90+', label: 'Activites' },
  { value: '100%', label: 'Gratuit' },
]

export default function LandingPage() {
  return (
    <div className="flex min-h-svh flex-col bg-background">
      <LandingHeader />

      {/* Hero Section */}
      <section className="relative overflow-hidden pt-14">
        {/* Background effects */}
        <div className="pointer-events-none absolute inset-0">
          {/* Gradient orb top */}
          <div className="absolute -top-40 left-1/2 h-[600px] w-[800px] -translate-x-1/2 rounded-full bg-primary/5 blur-3xl" />
          {/* Grid pattern */}
          <div
            className="absolute inset-0 opacity-[0.03]"
            style={{
              backgroundImage:
                'linear-gradient(rgba(255,255,255,.1) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,.1) 1px, transparent 1px)',
              backgroundSize: '64px 64px',
            }}
          />
          {/* Bottom fade */}
          <div className="absolute bottom-0 h-32 w-full bg-gradient-to-t from-background to-transparent" />
        </div>

        <div className="relative mx-auto flex w-full max-w-5xl flex-col items-center gap-8 px-4 py-24 text-center md:px-6 md:py-36">
          {/* Badge */}
          <Badge
            variant="outline"
            className="border-primary/30 bg-primary/5 px-4 py-1.5 text-sm font-medium text-primary"
          >
            <Sparkles className="mr-1.5 h-3.5 w-3.5" aria-hidden="true" />
            Programme officiel tunisien
          </Badge>

          {/* Main heading */}
          <h1 className="max-w-4xl text-balance text-4xl font-bold tracking-tight md:text-6xl lg:text-7xl">
            Maitrisez les maths{' '}
            <span className="bg-gradient-to-r from-primary via-amber-400 to-orange-400 bg-clip-text text-transparent">
              avec confiance
            </span>
          </h1>

          {/* Subheading */}
          <p className="max-w-2xl text-lg leading-relaxed text-muted-foreground md:text-xl">
            Cours structures, exercices interactifs et series de revision pour
            le lycee tunisien. Le parcours{' '}
            <span className="font-semibold text-foreground">1ere Tronc Commun</span>{' '}
            est disponible des maintenant.
          </p>

          {/* Stats bar */}
          <div className="flex items-center gap-8 rounded-2xl border border-white/5 bg-card/50 px-8 py-4 backdrop-blur-sm">
            {STATS.map((stat, i) => (
              <div key={stat.label} className="flex items-center gap-3">
                {i > 0 && (
                  <div className="h-8 w-px bg-white/10" aria-hidden="true" />
                )}
                <div className="text-center">
                  <div className="font-mono text-2xl font-bold text-primary md:text-3xl">
                    {stat.value}
                  </div>
                  <div className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
                    {stat.label}
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* CTAs */}
          <div className="flex flex-col gap-3 pt-2 sm:flex-row">
            <Button
              size="lg"
              className="gap-2 bg-primary px-8 text-base font-semibold text-primary-foreground shadow-lg shadow-primary/20 hover:bg-primary/90 hover:shadow-xl hover:shadow-primary/30"
              asChild
            >
              <Link href="/1ere-tc/apprendre">
                Explorer le parcours 1ere TC
                <ArrowRight className="h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
            <Button
              size="lg"
              variant="outline"
              className="border-white/10 text-base hover:bg-white/5"
              asChild
            >
              <Link href="/login">J&apos;ai un compte</Link>
            </Button>
          </div>
        </div>
      </section>

      {/* Features Grid */}
      <section className="relative border-t border-white/5">
        <div className="mx-auto w-full max-w-7xl px-4 py-24 md:px-6">
          <div className="mb-16 text-center">
            <Badge
              variant="outline"
              className="mb-4 border-white/10 bg-white/5 text-sm text-muted-foreground"
            >
              Fonctionnalites
            </Badge>
            <h2 className="text-balance text-3xl font-bold tracking-tight md:text-4xl">
              Tout pour reussir en maths
            </h2>
            <p className="mx-auto mt-4 max-w-xl text-lg text-muted-foreground">
              Une plateforme pensee pour les eleves du lycee tunisien, avec des
              outils modernes et un contenu rigoureux.
            </p>
          </div>

          <div className="mx-auto grid max-w-5xl gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {FEATURES.map((feature) => (
              <div
                key={feature.title}
                className="group relative rounded-2xl border border-white/5 bg-card/50 p-6 backdrop-blur-sm transition-colors duration-300 hover:border-white/10 hover:bg-card/80"
              >
                {/* Icon */}
                <div
                  className={`mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-gradient-to-br ${feature.accent}`}
                >
                  <feature.icon
                    className="h-6 w-6 text-foreground"
                    aria-hidden="true"
                  />
                </div>

                <h3 className="mb-2 text-lg font-semibold">{feature.title}</h3>
                <p className="text-sm leading-relaxed text-muted-foreground">
                  {feature.description}
                </p>

                {/* Subtle glow on hover */}
                <div className="pointer-events-none absolute inset-0 rounded-2xl opacity-0 transition-opacity duration-300 group-hover:opacity-100">
                  <div
                    className={`absolute inset-0 rounded-2xl bg-gradient-to-br ${feature.accent} opacity-30 blur-xl`}
                  />
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Parcours Section */}
      <section className="relative border-t border-white/5">
        <div className="mx-auto w-full max-w-7xl px-4 py-24 md:px-6">
          <div className="mb-16 text-center">
            <Badge
              variant="outline"
              className="mb-4 border-white/10 bg-white/5 text-sm text-muted-foreground"
            >
              Parcours disponibles
            </Badge>
            <h2 className="text-balance text-3xl font-bold tracking-tight md:text-4xl">
              Choisissez votre niveau
            </h2>
            <p className="mx-auto mt-4 max-w-xl text-lg text-muted-foreground">
              Le parcours 1ere TC est complet et pret. Les autres niveaux
              arrivent bientot.
            </p>
          </div>

          <div className="mx-auto grid max-w-4xl gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {PARCOURS_DATA.map((parcours) =>
              parcours.active ? (
                <Link
                  key={parcours.slug}
                  href={`/${parcours.slug}/apprendre`}
                  className="group relative col-span-1 overflow-hidden rounded-2xl border border-primary/20 bg-gradient-to-br from-primary/10 via-card to-card p-6 transition-all duration-300 hover:border-primary/40 hover:shadow-lg hover:shadow-primary/10 sm:col-span-2 lg:col-span-3"
                >
                  {/* Glow */}
                  <div className="pointer-events-none absolute -right-20 -top-20 h-40 w-40 rounded-full bg-primary/10 blur-3xl transition-all duration-500 group-hover:bg-primary/20" />

                  <div className="relative flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                    <div className="flex-1">
                      <div className="mb-2 flex items-center gap-3">
                        <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-primary/20">
                          <GraduationCap
                            className="h-5 w-5 text-primary"
                            aria-hidden="true"
                          />
                        </div>
                        <div>
                          <h3 className="text-xl font-bold">{parcours.label}</h3>
                          <p className="text-sm text-primary">{parcours.fullLabel}</p>
                        </div>
                        <Badge className="ml-auto border-0 bg-primary/20 text-primary sm:ml-2">
                          Disponible
                        </Badge>
                      </div>
                      <p className="text-muted-foreground">
                        {parcours.description}
                      </p>
                    </div>
                    <Button
                      className="gap-2 bg-primary font-semibold text-primary-foreground shadow-lg shadow-primary/20 hover:bg-primary/90"
                      asChild
                    >
                      <span>
                        Explorer
                        <ArrowRight className="h-4 w-4" aria-hidden="true" />
                      </span>
                    </Button>
                  </div>
                </Link>
              ) : (
                <div
                  key={parcours.slug}
                  className="relative rounded-2xl border border-white/5 bg-card/30 p-6 opacity-50"
                >
                  <div className="mb-3 flex items-center justify-between">
                    <h3 className="font-semibold">{parcours.label}</h3>
                    <Badge
                      variant="outline"
                      className="border-white/10 text-xs text-muted-foreground"
                    >
                      <Lock className="mr-1 h-3 w-3" aria-hidden="true" />
                      Bientot
                    </Badge>
                  </div>
                  <p className="text-sm text-muted-foreground">
                    {parcours.description}
                  </p>
                </div>
              )
            )}
          </div>
        </div>
      </section>

      {/* Final CTA */}
      <section className="relative border-t border-white/5">
        <div className="mx-auto w-full max-w-7xl px-4 py-24 md:px-6">
          <div className="relative mx-auto max-w-3xl overflow-hidden rounded-3xl border border-primary/20 bg-gradient-to-br from-primary/10 via-card to-card p-12 text-center">
            {/* Background glow */}
            <div className="pointer-events-none absolute -left-20 -top-20 h-60 w-60 rounded-full bg-primary/10 blur-3xl" />
            <div className="pointer-events-none absolute -bottom-20 -right-20 h-60 w-60 rounded-full bg-primary/5 blur-3xl" />

            <div className="relative">
              <h2 className="text-balance text-3xl font-bold md:text-4xl">
                Commence le premier chapitre
              </h2>
              <p className="mx-auto mt-4 max-w-lg text-lg text-muted-foreground">
                Pas besoin de compte. Plonge directement dans le cours et
                decouvre une nouvelle facon d&apos;apprendre les maths.
              </p>
              <div className="mt-8 flex flex-col items-center gap-3 sm:flex-row sm:justify-center">
                <Button
                  size="lg"
                  className="gap-2 bg-primary px-8 text-base font-semibold text-primary-foreground shadow-lg shadow-primary/25 hover:bg-primary/90 hover:shadow-xl hover:shadow-primary/30"
                  asChild
                >
                  <Link href="/1ere-tc/apprendre">
                    Explorer le parcours 1ere TC
                    <ArrowRight className="h-4 w-4" aria-hidden="true" />
                  </Link>
                </Button>
                <Button
                  size="lg"
                  variant="ghost"
                  className="text-muted-foreground hover:text-foreground"
                  asChild
                >
                  <Link href="/signup">
                    Creer un compte pour sauvegarder ma progression
                  </Link>
                </Button>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-white/5">
        <div className="mx-auto flex w-full max-w-7xl flex-col items-center gap-6 px-4 py-10 md:flex-row md:justify-between md:px-6">
          <div className="flex items-center gap-2">
            <div className="flex h-7 w-7 items-center justify-center rounded-md bg-primary/20 font-mono text-xs font-bold text-primary">
              L
            </div>
            <span className="font-semibold">
              Learning <span className="text-primary">OS</span>
            </span>
          </div>
          <div className="flex gap-6 text-sm text-muted-foreground">
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
          <span className="text-sm text-muted-foreground">
            &copy; 2026 Learning OS
          </span>
        </div>
      </footer>
    </div>
  )
}
