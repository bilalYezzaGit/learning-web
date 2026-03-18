import Link from 'next/link'
import {
  ArrowRight,
  BookOpen,
  Brain,
  FileText,
  GraduationCap,
  QrCode,
  ScanLine,
  Sparkles,
  Zap,
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
      'Chaque exercice a un QR code. Scanne-le pour acceder a la correction, aux QCM et aux explications.',
  },
  {
    icon: Brain,
    title: 'Correction IA',
    description:
      'Prends en photo ton travail et recois un feedback personnalise. L\'IA analyse ta demarche et te guide.',
  },
  {
    icon: Zap,
    title: 'QCM interactifs',
    description:
      'Teste tes connaissances avec des QCM chronomètres. Chaque question a une explication detaillee.',
  },
  {
    icon: FileText,
    title: 'Cours et resumes',
    description:
      'Retrouve l\'essentiel de chaque chapitre en un coup d\'oeil. Definitions, theoremes et exemples cles.',
  },
]

const HOW_IT_WORKS = [
  {
    step: '1',
    icon: BookOpen,
    title: 'Ouvre ton livret',
    description: 'Travaille l\'exercice sur papier comme d\'habitude.',
  },
  {
    step: '2',
    icon: ScanLine,
    title: 'Scanne le QR code',
    description: 'Utilise l\'app pour scanner le QR a cote de l\'exercice.',
  },
  {
    step: '3',
    icon: Sparkles,
    title: 'Obtiens ton feedback',
    description: 'Correction IA, explications et QCM pour verifier ta comprehension.',
  },
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
              className={`absolute font-serif text-foreground/[0.08] ${formula.className}`}
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
            6 livrets disponibles — 3eme Math
          </Badge>

          <h1 className="mx-auto max-w-3xl text-balance font-serif text-4xl font-bold leading-[1.15] tracking-tight md:text-5xl lg:text-6xl">
            Ton livret de maths,{' '}
            <span className="text-primary">augmente par l&apos;IA</span>
          </h1>

          <p className="mx-auto mt-6 max-w-xl text-balance text-lg leading-relaxed text-muted-foreground md:text-xl">
            Travaille sur ton livret papier, scanne le QR code
            et obtiens une correction IA personnalisee.
            Gratuit et sans pub.
          </p>

          <div className="mt-10 flex flex-wrap justify-center gap-3">
            <Button size="lg" className="gap-2 px-6 text-base" asChild>
              <Link href="/app/mes-livrets">
                Voir les livrets
                <ArrowRight className="h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
            <Button size="lg" variant="outline" className="px-6 text-base" asChild>
              <Link href="/login">J&apos;ai un compte</Link>
            </Button>
          </div>
        </div>
      </section>

      {/* ─── How it works ─── */}
      <section className="border-y bg-card">
        <div className="mx-auto w-full max-w-5xl px-4 py-16 md:px-6">
          <h2 className="mb-10 text-center font-serif text-2xl font-semibold md:text-3xl">
            Comment ca marche ?
          </h2>
          <div className="mx-auto grid max-w-3xl gap-8 md:grid-cols-3">
            {HOW_IT_WORKS.map((item, i) => (
              <div key={item.step} className="flex flex-col items-center text-center">
                <div className="relative mb-4">
                  <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-primary/10">
                    <item.icon className="h-8 w-8 text-primary" aria-hidden="true" />
                  </div>
                  <span className="absolute -right-2 -top-2 flex h-7 w-7 items-center justify-center rounded-full bg-primary text-xs font-bold text-primary-foreground">
                    {item.step}
                  </span>
                </div>
                <h3 className="font-serif text-lg font-semibold">{item.title}</h3>
                <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
                  {item.description}
                </p>
                {/* Connector arrow (hidden on last item and mobile) */}
                {i < HOW_IT_WORKS.length - 1 && (
                  <ArrowRight
                    className="mt-4 hidden h-5 w-5 text-muted-foreground/30 md:absolute md:right-0 md:top-1/2 md:mt-0 md:block md:-translate-y-1/2 md:translate-x-1/2"
                    aria-hidden="true"
                  />
                )}
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ─── Features ─── */}
      <section className="mx-auto w-full max-w-5xl px-4 py-24 md:px-6">
        <div className="mb-14 text-center">
          <h2 className="text-balance font-serif text-3xl font-semibold md:text-4xl">
            Le livret papier, version augmentee
          </h2>
          <p className="mx-auto mt-4 max-w-lg text-lg text-muted-foreground">
            Ton livret reste au centre. L&apos;app ajoute la correction IA,
            les QCM interactifs et les resumes de cours.
          </p>
        </div>
        <div className="mx-auto grid max-w-4xl gap-6 sm:grid-cols-2">
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

      {/* ─── For who ─── */}
      <section className="border-y bg-muted/30">
        <div className="mx-auto w-full max-w-5xl px-4 py-16 md:px-6">
          <h2 className="mb-10 text-center font-serif text-2xl font-semibold md:text-3xl">
            Concu pour le lycee tunisien
          </h2>
          <div className="mx-auto grid max-w-3xl gap-4 sm:grid-cols-3">
            {[
              { label: '3eme Math', detail: 'Nombre derive, Fonction derivee', color: '#3B82F6' },
              { label: '2nde Math', detail: 'Bientot disponible', color: '#8B5CF6' },
              { label: '1ere TC', detail: 'Bientot disponible', color: '#F59E0B' },
            ].map((level) => (
              <Card key={level.label} className="text-center">
                <CardContent className="py-6">
                  <span
                    className="mx-auto mb-3 flex h-10 w-10 items-center justify-center rounded-full text-sm font-bold text-white"
                    style={{ backgroundColor: level.color }}
                    aria-hidden="true"
                  >
                    {level.label.charAt(0)}
                  </span>
                  <p className="font-semibold">{level.label}</p>
                  <p className="mt-1 text-xs text-muted-foreground">{level.detail}</p>
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
              Pret a augmenter ton livret ?
            </h2>
            <p className="relative max-w-md text-balance text-primary-foreground/80">
              Scanne le QR code de ton livret pour commencer.
              Pas d&apos;inscription obligatoire.
            </p>
            <Button size="lg" variant="secondary" className="relative gap-2 px-6 text-base" asChild>
              <Link href="/app/mes-livrets">
                Explorer les livrets
                <ArrowRight className="h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
            <p className="relative text-sm text-primary-foreground/60">
              <Link
                href="/signup"
                className="underline underline-offset-4 transition-colors hover:text-primary-foreground/80"
              >
                Cree un compte
              </Link>{' '}
              pour utiliser la correction IA
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
                Augmente ton livret de maths avec la correction IA
                et les QCM interactifs. Concu pour le lycee tunisien.
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
                  Creer un compte
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
                  Politique de confidentialite
                </Link>
              </div>
            </div>
          </div>

          <div className="mt-10 flex flex-col items-center gap-2 border-t pt-6 text-xs text-muted-foreground sm:flex-row sm:justify-between">
            <span>&copy; {new Date().getFullYear()} Aylan. Tous droits reserves.</span>
            <span>Concu pour les eleves du lycee tunisien</span>
          </div>
        </div>
      </footer>
    </div>
  )
}
