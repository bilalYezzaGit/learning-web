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
import { getAllParcours } from '@/lib/parcours'

const MATH_FORMULAS = [
  { text: 'f(x) = ax + b', className: 'left-[8%] top-[12%] -rotate-12 text-xl md:text-2xl' },
  { text: 'x\u00B2 + y\u00B2 = r\u00B2', className: 'right-[12%] top-[18%] rotate-6 text-lg md:text-xl' },
  { text: 'sin \u03B8', className: 'left-[5%] top-[55%] -rotate-6 text-2xl md:text-3xl' },
  { text: '\u03A3', className: 'right-[8%] top-[60%] rotate-12 text-3xl md:text-4xl' },
  { text: '\u03C0', className: 'left-[25%] top-[8%] rotate-3 text-2xl md:text-3xl' },
  { text: '\u222B', className: 'right-[25%] top-[10%] -rotate-8 text-3xl md:text-4xl' },
  { text: '\u0394y/\u0394x', className: 'left-[15%] top-[75%] rotate-6 text-lg md:text-xl' },
  { text: '\u221A(a\u00B2+b\u00B2)', className: 'right-[18%] top-[72%] -rotate-3 text-base md:text-lg' },
  { text: 'lim', className: 'left-[45%] top-[5%] rotate-2 text-xl md:text-2xl' },
  { text: '\u221E', className: 'right-[35%] top-[80%] -rotate-10 text-2xl md:text-3xl' },
]

const FEATURES = [
  {
    icon: BookOpen,
    title: 'Cours structur\u00E9s',
    description:
      'Des le\u00E7ons claires avec des exemples d\u00E9taill\u00E9s, des formules interactives et des rappels visuels. Comme un bon cahier, en mieux.',
  },
  {
    icon: Brain,
    title: 'Exercices interactifs',
    description:
      'QCM, probl\u00E8mes et calculs avec correction imm\u00E9diate. Chaque erreur devient une occasion d\u2019apprendre.',
  },
  {
    icon: BarChart3,
    title: 'S\u00E9ries de r\u00E9vision',
    description:
      'Des s\u00E9ries th\u00E9matiques et des devoirs types pour se pr\u00E9parer aux contr\u00F4les. Progresse \u00E0 ton rythme.',
  },
]

const STATS = [
  { value: '15', label: 'modules' },
  { value: '90+', label: 'activit\u00E9s' },
  { value: '100%', label: 'gratuit' },
]

export default function LandingPage() {
  const allParcours = getAllParcours()
  const activeParcours = allParcours.find((p) => p.available)
  const comingSoonParcours = allParcours.filter((p) => !p.available)

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
              className={`absolute font-serif text-foreground/[0.05] ${formula.className}`}
            >
              {formula.text}
            </span>
          ))}
        </div>

        {/* Hero content */}
        <div className="relative mx-auto max-w-4xl px-4 py-20 text-center md:py-32">
          <Badge
            variant="secondary"
            className="mb-6 border-primary/20 bg-primary/10 text-primary"
          >
            <GraduationCap className="mr-1 h-3.5 w-3.5" aria-hidden="true" />
            Parcours 1\u00E8re TC disponible
          </Badge>

          <h1 className="mx-auto max-w-3xl text-balance font-serif text-4xl font-bold leading-tight tracking-tight md:text-5xl lg:text-6xl">
            Les maths du lyc\u00E9e,{' '}
            <span className="text-primary">expliqu\u00E9es avec soin</span>
          </h1>

          <p className="mx-auto mt-6 max-w-xl text-balance text-lg text-muted-foreground">
            Cours structur\u00E9s, exercices corrig\u00E9s et s\u00E9ries de r\u00E9vision.
            15&nbsp;modules pour la 1\u00E8re ann\u00E9e Tronc Commun&nbsp;&mdash; acc\u00E8s
            libre, sans inscription.
          </p>

          <div className="mt-8 flex flex-wrap justify-center gap-3">
            <Button size="lg" className="gap-2" asChild>
              <Link href="/1ere-tc/apprendre">
                Explorer le parcours 1\u00E8re TC
                <ArrowRight className="h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
            <Button size="lg" variant="outline" asChild>
              <Link href="/login">J&apos;ai un compte</Link>
            </Button>
          </div>
        </div>
      </section>

      {/* ─── Stats strip ─── */}
      <section className="border-y bg-card">
        <div className="mx-auto grid max-w-3xl grid-cols-3 gap-4 px-4 py-8 text-center">
          {STATS.map((stat) => (
            <div key={stat.label}>
              <p className="font-serif text-3xl font-bold tabular-nums text-primary md:text-4xl">
                {stat.value}
              </p>
              <p className="mt-1 text-sm text-muted-foreground">{stat.label}</p>
            </div>
          ))}
        </div>
      </section>

      {/* ─── Features ─── */}
      <section className="mx-auto w-full max-w-5xl px-4 py-20 md:px-6">
        <div className="mb-12 text-center">
          <h2 className="text-balance font-serif text-3xl font-semibold">
            Tout pour r\u00E9ussir en maths
          </h2>
          <p className="mx-auto mt-3 max-w-lg text-lg text-muted-foreground">
            Une m\u00E9thode compl\u00E8te, du cours \u00E0 la r\u00E9vision, con\u00E7ue pour
            le programme tunisien.
          </p>
        </div>
        <div className="mx-auto grid max-w-4xl gap-8 md:grid-cols-3">
          {FEATURES.map((feature) => (
            <div key={feature.title} className="text-center">
              <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-xl bg-primary/10">
                <feature.icon
                  className="h-7 w-7 text-primary"
                  aria-hidden="true"
                />
              </div>
              <h3 className="font-serif text-lg font-semibold">{feature.title}</h3>
              <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
                {feature.description}
              </p>
            </div>
          ))}
        </div>
      </section>

      {/* ─── Parcours ─── */}
      <section className="bg-muted/40 px-4 py-20 md:px-6">
        <div className="mx-auto max-w-5xl">
          <div className="mb-12 text-center">
            <h2 className="text-balance font-serif text-3xl font-semibold">
              Nos parcours
            </h2>
            <p className="mx-auto mt-3 max-w-lg text-lg text-muted-foreground">
              Le parcours 1\u00E8re TC est pr\u00EAt. Les autres niveaux arrivent bient\u00F4t.
            </p>
          </div>

          {/* Active parcours — 1ère TC */}
          {activeParcours && (
            <Link href={`/${activeParcours.slug}/apprendre`} className="group block">
              <Card className="mx-auto mb-8 max-w-2xl cursor-pointer border-primary/30 bg-card shadow-sm transition-shadow duration-200 group-hover:shadow-md">
                <CardHeader className="pb-3">
                  <div className="flex items-center gap-3">
                    <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10">
                      <BookOpen
                        className="h-5 w-5 text-primary"
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
                  <div className="flex flex-wrap items-center gap-4 text-sm text-muted-foreground">
                    <span className="flex items-center gap-1.5">
                      <BookOpen className="h-4 w-4" aria-hidden="true" />
                      15 modules
                    </span>
                    <span className="flex items-center gap-1.5">
                      <Brain className="h-4 w-4" aria-hidden="true" />
                      90+ activit\u00E9s
                    </span>
                    <span className="flex items-center gap-1.5">
                      <Clock className="h-4 w-4" aria-hidden="true" />
                      Acc\u00E8s libre
                    </span>
                  </div>
                  <div className="mt-4">
                    <span className="inline-flex items-center gap-2 text-sm font-medium text-primary transition-colors group-hover:underline">
                      Explorer le parcours
                      <ArrowRight
                        className="h-4 w-4 transition-transform group-hover:translate-x-0.5"
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
                      Bient\u00F4t
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
      <section className="mx-auto w-full max-w-5xl px-4 py-20 md:px-6">
        <Card className="mx-auto max-w-2xl overflow-hidden border-0 bg-gradient-to-br from-primary to-primary/80 text-primary-foreground shadow-lg">
          <CardContent className="relative flex flex-col items-center gap-5 px-6 py-14 text-center md:px-12">
            {/* Subtle decorative elements */}
            <div
              aria-hidden="true"
              className="pointer-events-none absolute inset-0 select-none overflow-hidden"
            >
              <span className="absolute left-[8%] top-[15%] -rotate-12 font-serif text-lg text-primary-foreground/10">
                f(x)
              </span>
              <span className="absolute right-[10%] bottom-[20%] rotate-8 font-serif text-xl text-primary-foreground/10">
                \u03C0
              </span>
              <span className="absolute left-[20%] bottom-[10%] rotate-6 font-serif text-base text-primary-foreground/10">
                \u0394
              </span>
              <span className="absolute right-[25%] top-[10%] -rotate-6 font-serif text-base text-primary-foreground/10">
                \u221E
              </span>
            </div>

            <h2 className="relative text-balance font-serif text-2xl font-semibold md:text-3xl">
              Pr\u00EAt \u00E0 commencer ?
            </h2>
            <p className="relative max-w-md text-balance text-primary-foreground/80">
              Le premier chapitre t&apos;attend. Pas d&apos;inscription, pas de
              barri\u00E8re&nbsp;&mdash; juste toi et les maths.
            </p>
            <Button
              size="lg"
              variant="secondary"
              className="relative gap-2"
              asChild
            >
              <Link href="/1ere-tc/apprendre">
                Commence le premier chapitre
                <ArrowRight className="h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
            <p className="relative text-sm text-primary-foreground/60">
              <Link
                href="/signup"
                className="underline underline-offset-4 transition-colors hover:text-primary-foreground/80"
              >
                Cr\u00E9e un compte
              </Link>{' '}
              pour sauvegarder ta progression
            </p>
          </CardContent>
        </Card>
      </section>

      {/* ─── Footer ─── */}
      <footer className="mt-auto border-t">
        <div className="mx-auto flex w-full max-w-7xl flex-col items-center gap-4 px-4 py-8 text-sm text-muted-foreground md:flex-row md:justify-between md:px-6">
          <span className="font-serif font-semibold text-foreground">
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
              Confidentialit\u00E9
            </Link>
          </div>
          <span>&copy; {new Date().getFullYear()} Learning OS</span>
        </div>
      </footer>
    </div>
  )
}
