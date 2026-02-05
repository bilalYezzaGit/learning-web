/**
 * Dashboard Page
 *
 * Central hub with overview and quick actions.
 * Public - works for both visitors and authenticated users.
 */

import { BookOpen, GraduationCap, Sparkles } from 'lucide-react'
import Link from 'next/link'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'

export default function DashboardPage() {
  return (
    <div className="container max-w-6xl py-6">
      {/* Welcome */}
      <div className="mb-8">
        <h1 className="font-serif text-2xl font-semibold text-foreground">
          Bienvenue ! 👋
        </h1>
        <p className="mt-1 text-muted-foreground">
          Prêt à apprendre aujourd&apos;hui ?
        </p>
      </div>

      {/* Quick Actions */}
      <div className="mb-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        <QuickActionCard
          title="Continuer"
          description="Reprendre où vous en étiez"
          icon={BookOpen}
          href="/apprendre"
          variant="primary"
        />
        <QuickActionCard
          title="Réviser"
          description="Tester vos connaissances"
          icon={GraduationCap}
          href="/reviser"
        />
        <QuickActionCard
          title="Explorer"
          description="Découvrir de nouveaux modules"
          icon={Sparkles}
          href="/apprendre"
        />
      </div>

      {/* Stats Preview */}
      <div className="mb-8">
        <h2 className="mb-4 font-serif text-lg font-semibold">
          Cette semaine
        </h2>
        <Card>
          <CardContent className="pt-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-2xl font-bold">0</p>
                <p className="text-sm text-muted-foreground">
                  activités complétées
                </p>
              </div>
              <div>
                <p className="text-2xl font-bold">0</p>
                <p className="text-sm text-muted-foreground">
                  QCM réussis
                </p>
              </div>
              <div>
                <p className="text-2xl font-bold">0 min</p>
                <p className="text-sm text-muted-foreground">
                  temps d&apos;étude
                </p>
              </div>
            </div>
            <div className="mt-4">
              <div className="mb-2 flex justify-between text-sm">
                <span>Progression hebdomadaire</span>
                <span className="text-muted-foreground">0%</span>
              </div>
              <Progress value={0} />
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Recent Modules */}
      <div>
        <h2 className="mb-4 font-serif text-lg font-semibold">
          Modules récents
        </h2>
        <Card>
          <CardContent className="py-8 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-2 h-8 w-8 opacity-50" />
            <p>Aucun module consulté récemment</p>
            <Button asChild variant="link" className="mt-2">
              <Link href="/apprendre">Explorer les modules</Link>
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}

function QuickActionCard({
  title,
  description,
  icon: Icon,
  href,
  variant = 'default',
}: {
  title: string
  description: string
  icon: React.ComponentType<{ className?: string }>
  href: string
  variant?: 'default' | 'primary'
}) {
  return (
    <Link href={href}>
      <Card
        className={`transition-colors hover:bg-muted/50 ${
          variant === 'primary' ? 'border-primary/20 bg-primary/5' : ''
        }`}
      >
        <CardHeader className="pb-2">
          <div className="flex items-center gap-3">
            <div
              className={`flex h-10 w-10 items-center justify-center rounded-lg ${
                variant === 'primary'
                  ? 'bg-primary text-primary-foreground'
                  : 'bg-muted'
              }`}
            >
              <Icon className="h-5 w-5" />
            </div>
            <div>
              <CardTitle className="text-base">{title}</CardTitle>
              <p className="text-sm text-muted-foreground">{description}</p>
            </div>
          </div>
        </CardHeader>
      </Card>
    </Link>
  )
}
