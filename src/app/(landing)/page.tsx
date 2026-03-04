import Link from 'next/link'
import {
  BookOpen,
  Brain,
  BarChart3,
  ArrowRight,
  GraduationCap,
  QrCode,
  Sparkles,
} from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import {
  Card,
  CardContent,
} from '@/components/ui/card'
import { LandingHeader } from '@/app/(landing)/_components/landing-header'

const MATH_FORMULAS = [
  { text: 'f(x) = ax + b', className: 'left-[8%] top-[12%] -rotate-12 text-xl md:text-2xl' },
  { text: 'x² + y² = r²', className: 'right-[12%] top-[18%] rotate-6 text-lg md:text-xl' },
  { text: 'sin θ', className: 'left-[5%] top-[55%] -rotate-6 text-2xl md:text-3xl' },
  { text: 'Σ', className: 'right-[8%] top-[60%] rotate-12 text-3xl md:text-4xl' },
  { text: 'π', className: 'left-[25%] top-[8%] rotate-3 text-2xl md:text-3xl' },
  { text: '∫', className: 'right-[25%] top-[10%] -rotate-8 text-3xl md:text-4xl' },
  { text: 'Δy/Δx', className: 'left-[15%] top-[75%] rotate-6 text-lg md:text-xl' },
  { text: '√(a²+b²)', className: 'right-[18%] top-[72%] -rotate-3 text-base md:text-lg' },
  { text: 'lim', className: 'left-[45%] top-[5%] rotate-2 text-xl md:text-2xl' },
  { text: '∞', className: 'right-[35%] top-[80%] -rotate-10 text-2xl md:text-3xl' },
]

const FEATURES = [
  {
    icon: QrCode,
    title: 'Scanne ton livret',
    description:
      'Un QR code sur chaque exercice. Scanne-le pour accéder au contenu augmenté : correction IA, QCM et explications.',
  },
  {
    icon: Brain,
    title: 'Correction IA',
    description:
      'Prends en photo ton travail et reçois un feedback personnalisé. L\'IA analyse ta démarche et te guide.',
  },
  {
    icon: BarChart3,
    title: 'Suis ta progression',
    description:
      'Chaque exercice terminé, chaque QCM réussi s\'ajoute à ton tableau de bord. Visualise tes progrès.',
  },
]

const STATS = [
  { value: '3', label: 'modules', icon: BookOpen },
  { value: '90+', label: 'activités', icon: Brain },
  { value: 'IA', label: 'correction', icon: Sparkles },
]

export default function LandingPage() {
  return (
    <div className="flex min-h-svh flex-col">
      <LandingHeader />

      {/* ─── Hero ─── */}
      <section className="relative overflow-hidden">
        {/* Warm gradient background */}
        <div className="absolute inset-0 bg-gradient-to-b from-accent via-accent/40 to-background" />

        {/* Decorative math formulas */}
        <div
          aria-hidden="true"
          className="pointer-events-none absolute inset-0 select-none overflow-hidden"
        >
          {MATH_FORMULAS.map((formula) => (
            <span
              key={formula.text}
              className={`absolute font-serif text-foreground/[0.06] ${formula.className}`}
            >
              {formula.text}
            </span>
          ))}
        </div>

        {/* Hero content */}
        <div className="relative mx-auto max-w-4xl px-4 py-24 text-center md:py-36">
          <Badge
            variant="secondary"
            className="mb-8 border-primary/20 bg-primary/10 px-4 py-1.5 text-sm font-medium text-primary"
          >
            <GraduationCap className="mr-1.5 h-3.5 w-3.5" aria-hidden="true" />
            Parcours 1ère TC disponible
          </Badge>

          <h1 className="mx-auto max-w-3xl text-balance font-serif text-4xl font-bold leading-[1.15] tracking-tight md:text-5xl lg:text-6xl">
            Augmente ton livret de maths{' '}
            <span className="text-primary">avec l&apos;IA</span>
          </h1>

          <p className="mx-auto mt-6 max-w-xl text-balance text-lg leading-relaxed text-muted-foreground md:text-xl">
            Scanne le QR code de ton livret, obtiens une correction IA
            personnalisée et suis ta progression.
            Gratuit et sans pub.
          </p>

          <div className="mt-10 flex flex-wrap justify-center gap-3">
            <Button size="lg" className="gap-2 px-6 text-base" asChild>
              <Link href="/app/mes-livrets">
                Scanne ton livret
                <ArrowRight className="h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
            <Button size="lg" variant="outline" className="px-6 text-base" asChild>
              <Link href="/login">J&apos;ai un compte</Link>
            </Button>
          </div>
        </div>
      </section>

      {/* ─── Stats strip ─── */}
      <section className="border-y bg-card">
        <div className="mx-auto grid max-w-3xl grid-cols-3 divide-x px-4 py-10 text-center">
          {STATS.map((stat) => (
            <div key={stat.label} className="flex flex-col items-center gap-2">
              <stat.icon
                className="h-5 w-5 text-primary/60"
                aria-hidden="true"
              />
              <p className="font-serif text-3xl font-bold tabular-nums text-primary md:text-4xl">
                {stat.value}
              </p>
              <p className="text-sm font-medium text-muted-foreground">{stat.label}</p>
            </div>
          ))}
        </div>
      </section>

      {/* ─── Features ─── */}
      <section className="mx-auto w-full max-w-5xl px-4 py-24 md:px-6">
        <div className="mb-14 text-center">
          <h2 className="text-balance font-serif text-3xl font-semibold md:text-4xl">
            Le livret papier, version augmentée
          </h2>
          <p className="mx-auto mt-4 max-w-lg text-lg text-muted-foreground">
            Ton livret reste au centre. L&apos;app ajoute la correction IA,
            les QCM interactifs et le suivi de progression.
          </p>
        </div>
        <div className="mx-auto grid max-w-4xl gap-6 md:grid-cols-3">
          {FEATURES.map((feature) => (
            <Card
              key={feature.title}
              className="border-border/50 bg-card/80 text-center transition-shadow duration-200 hover:shadow-md"
            >
              <CardContent className="px-6 py-8">
                <div className="mx-auto mb-5 flex h-14 w-14 items-center justify-center rounded-2xl bg-primary/10">
                  <feature.icon
                    className="h-7 w-7 text-primary"
                    aria-hidden="true"
                  />
                </div>
                <h3 className="font-serif text-lg font-semibold">{feature.title}</h3>
                <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
                  {feature.description}
                </p>
              </CardContent>
            </Card>
          ))}
        </div>
      </section>

      {/* ─── Final CTA ─── */}
      <section className="mx-auto w-full max-w-5xl px-4 py-24 md:px-6">
        <Card className="mx-auto max-w-2xl overflow-hidden border-0 bg-gradient-to-br from-primary to-primary/80 text-primary-foreground shadow-xl">
          <CardContent className="relative flex flex-col items-center gap-6 px-6 py-16 text-center md:px-12">
            {/* Subtle decorative elements */}
            <div
              aria-hidden="true"
              className="pointer-events-none absolute inset-0 select-none overflow-hidden"
            >
              <span className="absolute left-[8%] top-[15%] -rotate-12 font-serif text-lg text-primary-foreground/10">
                f(x)
              </span>
              <span className="absolute right-[10%] bottom-[20%] rotate-8 font-serif text-xl text-primary-foreground/10">
                π
              </span>
              <span className="absolute left-[20%] bottom-[10%] rotate-6 font-serif text-base text-primary-foreground/10">
                Δ
              </span>
              <span className="absolute right-[25%] top-[10%] -rotate-6 font-serif text-base text-primary-foreground/10">
                ∞
              </span>
            </div>

            <h2 className="relative text-balance font-serif text-2xl font-semibold md:text-3xl">
              Prêt à augmenter ton livret ?
            </h2>
            <p className="relative max-w-md text-balance text-primary-foreground/80">
              Scanne le QR code de ton livret pour commencer.
              Pas d&apos;inscription obligatoire.
            </p>
            <Button size="lg" variant="secondary" className="relative gap-2 px-6 text-base" asChild>
              <Link href="/app/scan">
                Scanne mon livret
                <ArrowRight className="h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
            <p className="relative text-sm text-primary-foreground/60">
              <Link
                href="/signup"
                className="underline underline-offset-4 transition-colors hover:text-primary-foreground/80"
              >
                Crée un compte
              </Link>{' '}
              pour sauvegarder ta progression
            </p>
          </CardContent>
        </Card>
      </section>

      {/* ─── Footer ─── */}
      <footer className="mt-auto border-t bg-muted/30">
        <div className="mx-auto w-full max-w-7xl px-4 py-12 md:px-6">
          <div className="grid gap-8 sm:grid-cols-3">
            {/* Brand */}
            <div className="space-y-3">
              <span className="font-serif text-lg font-semibold text-foreground">
                Aylan
              </span>
              <p className="max-w-xs text-sm leading-relaxed text-muted-foreground">
                Augmente ton livret de maths avec la correction IA, les QCM interactifs et le suivi de progression.
              </p>
            </div>

            {/* Navigation */}
            <div className="space-y-3">
              <p className="text-sm font-semibold text-foreground">Navigation</p>
              <div className="flex flex-col gap-2 text-sm text-muted-foreground">
                <Link href="/app/mes-livrets" className="transition-colors hover:text-foreground">
                  Mes livrets
                </Link>
                <Link href="/signup" className="transition-colors hover:text-foreground">
                  Créer un compte
                </Link>
              </div>
            </div>

            {/* Legal */}
            <div className="space-y-3">
              <p className="text-sm font-semibold text-foreground">Informations</p>
              <div className="flex flex-col gap-2 text-sm text-muted-foreground">
                <Link href="/terms" className="transition-colors hover:text-foreground">
                  Conditions d&apos;utilisation
                </Link>
                <Link href="/privacy" className="transition-colors hover:text-foreground">
                  Politique de confidentialité
                </Link>
              </div>
            </div>
          </div>

          <div className="mt-10 flex flex-col items-center gap-2 border-t pt-6 text-xs text-muted-foreground sm:flex-row sm:justify-between">
            <span>&copy; {new Date().getFullYear()} Aylan. Tous droits réservés.</span>
            <span>Conçu pour les élèves du lycée tunisien</span>
          </div>
        </div>
      </footer>
    </div>
  )
}
