import Link from 'next/link'
import {
  BookOpen,
  Brain,
  BarChart3,
  ArrowRight,
  GraduationCap,
  Clock,
  CheckCircle2,
  Lock,
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
import { LandingHeader } from '@/app/(landing)/_components/landing-header'
import { getVisibleParcours, DEFAULT_PARCOURS_SLUG } from '@/lib/parcours'

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
    icon: BookOpen,
    title: 'Cours structurés',
    description:
      'Des leçons claires avec des exemples détaillés, des formules interactives et des rappels visuels. Comme un bon cahier, en mieux.',
  },
  {
    icon: Brain,
    title: 'Exercices interactifs',
    description:
      'QCM, problèmes et calculs avec correction immédiate. Chaque erreur devient une occasion d\u2019apprendre.',
  },
  {
    icon: BarChart3,
    title: 'Séries de révision',
    description:
      'Des séries thématiques et des devoirs types pour se préparer aux contrôles. Progresse à ton rythme.',
  },
]

const STATS = [
  { value: '15', label: 'modules', icon: BookOpen },
  { value: '90+', label: 'activités', icon: Brain },
  { value: '100%', label: 'gratuit', icon: Sparkles },
]

export default function LandingPage() {
  const visibleParcours = getVisibleParcours()
  const activeParcours = visibleParcours.find((p) => p.active)
  const comingSoonParcours = visibleParcours.filter((p) => !p.active)

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
            {activeParcours ? `Parcours ${activeParcours.label} disponible` : 'Bientot disponible'}
          </Badge>

          <h1 className="mx-auto max-w-3xl text-balance font-serif text-4xl font-bold leading-[1.15] tracking-tight md:text-5xl lg:text-6xl">
            Les maths du lycée,{' '}
            <span className="text-primary">expliquées avec soin</span>
          </h1>

          <p className="mx-auto mt-6 max-w-xl text-balance text-lg leading-relaxed text-muted-foreground md:text-xl">
            Cours structurés, exercices corrigés et séries de révision.
            15&nbsp;modules pour la 1ère année Tronc Commun&nbsp;&mdash; accès
            libre, sans inscription.
          </p>

          <div className="mt-10 flex flex-wrap justify-center gap-3">
            <Button size="lg" className="gap-2 px-6 text-base" asChild>
              <Link href={`/${DEFAULT_PARCOURS_SLUG}`}>
                {activeParcours ? `Explorer le parcours ${activeParcours.label}` : 'Explorer les cours'}
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
            Tout pour réussir en maths
          </h2>
          <p className="mx-auto mt-4 max-w-lg text-lg text-muted-foreground">
            Une méthode complète, du cours à la révision, conçue pour
            le programme tunisien.
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

      {/* ─── Parcours ─── */}
      <section className="bg-muted/40 px-4 py-24 md:px-6">
        <div className="mx-auto max-w-5xl">
          <div className="mb-14 text-center">
            <h2 className="text-balance font-serif text-3xl font-semibold md:text-4xl">
              Nos parcours
            </h2>
            <p className="mx-auto mt-4 max-w-lg text-lg text-muted-foreground">
              Le parcours 1ère TC est prêt. Les autres niveaux arrivent bientôt.
            </p>
          </div>

          {/* Active parcours — 1ère TC */}
          {activeParcours && (
            <Link href={`/${activeParcours.slug}`} className="group block">
              <Card className="mx-auto mb-10 max-w-2xl cursor-pointer border-primary/30 bg-card shadow-sm transition-[box-shadow,border-color] duration-200 group-hover:shadow-lg group-hover:border-primary/50">
                <CardHeader className="pb-3">
                  <div className="flex items-center gap-4">
                    <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-primary/10">
                      <BookOpen
                        className="h-6 w-6 text-primary"
                        aria-hidden="true"
                      />
                    </div>
                    <div className="flex-1">
                      <div className="flex items-center gap-2">
                        <CardTitle className="font-serif text-xl">
                          {activeParcours.label}
                        </CardTitle>
                        <Badge
                          variant="secondary"
                          className="border-success/20 bg-success/10 text-success"
                        >
                          <CheckCircle2
                            className="mr-1 h-3 w-3"
                            aria-hidden="true"
                          />
                          Disponible
                        </Badge>
                      </div>
                      <CardDescription className="mt-1">
                        {activeParcours.description}
                      </CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="pt-0">
                  <div className="flex flex-wrap items-center gap-5 text-sm text-muted-foreground">
                    <span className="flex items-center gap-1.5">
                      <BookOpen className="h-4 w-4" aria-hidden="true" />
                      15 modules
                    </span>
                    <span className="flex items-center gap-1.5">
                      <Brain className="h-4 w-4" aria-hidden="true" />
                      90+ activités
                    </span>
                    <span className="flex items-center gap-1.5">
                      <Clock className="h-4 w-4" aria-hidden="true" />
                      Accès libre
                    </span>
                  </div>
                  <div className="mt-5">
                    <span className="inline-flex items-center gap-2 text-sm font-semibold text-primary transition-colors group-hover:underline">
                      Explorer le parcours
                      <ArrowRight
                        className="h-4 w-4 transition-transform group-hover:translate-x-1"
                        aria-hidden="true"
                      />
                    </span>
                  </div>
                </CardContent>
              </Card>
            </Link>
          )}

          {/* Coming soon parcours */}
          <div className="mx-auto grid max-w-2xl gap-3 sm:grid-cols-2">
            {comingSoonParcours.map((parcours) => (
              <Card
                key={parcours.slug}
                className="border-border/60 bg-card/60 opacity-60"
              >
                <CardHeader className="pb-2">
                  <div className="flex items-center justify-between">
                    <CardTitle className="font-serif text-base">
                      {parcours.label}
                    </CardTitle>
                    <Badge variant="outline" className="text-xs text-muted-foreground">
                      <Lock className="mr-1 h-3 w-3" aria-hidden="true" />
                      Bientôt
                    </Badge>
                  </div>
                </CardHeader>
                <CardContent className="pt-0">
                  <p className="text-sm text-muted-foreground">
                    {parcours.description}
                  </p>
                </CardContent>
              </Card>
            ))}
          </div>
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
              Prêt à commencer ?
            </h2>
            <p className="relative max-w-md text-balance text-primary-foreground/80">
              Le premier chapitre t&apos;attend. Pas d&apos;inscription, pas de
              barrière&nbsp;&mdash; juste toi et les maths.
            </p>
            <Button
              size="lg"
              variant="secondary"
              className="relative gap-2 px-6 text-base"
              asChild
            >
              <Link href={`/${DEFAULT_PARCOURS_SLUG}`}>
                Commence le premier chapitre
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
                Learning OS
              </span>
              <p className="max-w-xs text-sm leading-relaxed text-muted-foreground">
                Plateforme d&apos;apprentissage des mathématiques pour le lycée tunisien. Cours, exercices et révisions en accès libre.
              </p>
            </div>

            {/* Navigation */}
            <div className="space-y-3">
              <p className="text-sm font-semibold text-foreground">Navigation</p>
              <div className="flex flex-col gap-2 text-sm text-muted-foreground">
                <Link href={`/${DEFAULT_PARCOURS_SLUG}`} className="transition-colors hover:text-foreground">
                  {activeParcours ? `Parcours ${activeParcours.label}` : 'Parcours'}
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
            <span>&copy; {new Date().getFullYear()} Learning OS. Tous droits réservés.</span>
            <span>Conçu pour les élèves du lycée tunisien</span>
          </div>
        </div>
      </footer>
    </div>
  )
}
