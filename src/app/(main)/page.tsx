/**
 * Home Page - Learner Dashboard
 *
 * Central hub focused on learning actions.
 * Public - works for both visitors and authenticated users.
 */

import Link from 'next/link'
import { ArrowRight, BookOpen, CheckCircle, Flame, GraduationCap, Target } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { Badge } from '@/components/ui/badge'

export default function HomePage() {
  return (
    <div className="px-4 lg:px-6">
      {/* Streak & Daily Goal */}
      <Card className="mb-6">
        <CardContent className="py-4">
          <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <div className="flex items-center gap-3">
              <div className="flex h-12 w-12 items-center justify-center rounded-full bg-orange-100 dark:bg-orange-900/30">
                <Flame className="h-6 w-6 text-orange-500" />
              </div>
              <div>
                <p className="text-2xl font-bold">0 jours</p>
                <p className="text-sm text-muted-foreground">Série en cours</p>
              </div>
            </div>
            <div className="flex-1 sm:max-w-xs">
              <div className="mb-1.5 flex items-center justify-between text-sm">
                <span className="flex items-center gap-1.5">
                  <Target className="h-4 w-4 text-muted-foreground" />
                  Objectif du jour
                </span>
                <span className="font-medium">0 / 15 min</span>
              </div>
              <Progress value={0} className="h-2" />
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Continue Learning - Main CTA */}
      <Card className="mb-6 border-primary/20 bg-primary/5">
        <CardContent className="py-6">
          <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <div className="flex items-center gap-4">
              <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-primary text-primary-foreground">
                <BookOpen className="h-7 w-7" />
              </div>
              <div>
                <p className="text-sm text-muted-foreground">Reprendre</p>
                <p className="text-lg font-semibold">Commencez votre apprentissage</p>
                <p className="text-sm text-muted-foreground">
                  Explorez les modules disponibles
                </p>
              </div>
            </div>
            <Button size="lg" asChild>
              <Link href="/apprendre">
                Continuer
                <ArrowRight className="ml-2 h-4 w-4" />
              </Link>
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* Quick Stats Grid */}
      <div className="mb-6 grid gap-4 sm:grid-cols-3">
        <Card>
          <CardContent className="py-4">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-green-100 dark:bg-green-900/30">
                <CheckCircle className="h-5 w-5 text-green-600" />
              </div>
              <div>
                <p className="text-2xl font-bold">0</p>
                <p className="text-sm text-muted-foreground">Activités</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="py-4">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-blue-100 dark:bg-blue-900/30">
                <GraduationCap className="h-5 w-5 text-blue-600" />
              </div>
              <div>
                <p className="text-2xl font-bold">--</p>
                <p className="text-sm text-muted-foreground">Score QCM</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="py-4">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-amber-100 dark:bg-amber-900/30">
                <Flame className="h-5 w-5 text-amber-600" />
              </div>
              <div>
                <p className="text-2xl font-bold">0 / 5</p>
                <p className="text-sm text-muted-foreground">Séries</p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Quick Actions */}
      <div className="grid gap-4 sm:grid-cols-2">
        <Card className="transition-colors hover:bg-muted/50">
          <Link href="/reviser" className="block">
            <CardHeader className="pb-2">
              <div className="flex items-center justify-between">
                <CardTitle className="text-base font-medium">Réviser</CardTitle>
                <Badge variant="secondary">3 séries</Badge>
              </div>
              <p className="text-sm text-muted-foreground">
                Testez vos connaissances avec des QCM
              </p>
            </CardHeader>
          </Link>
        </Card>

        <Card className="transition-colors hover:bg-muted/50">
          <Link href="/apprendre" className="block">
            <CardHeader className="pb-2">
              <div className="flex items-center justify-between">
                <CardTitle className="text-base font-medium">Explorer</CardTitle>
                <Badge variant="outline">Nouveau</Badge>
              </div>
              <p className="text-sm text-muted-foreground">
                Découvrez de nouveaux modules
              </p>
            </CardHeader>
          </Link>
        </Card>
      </div>
    </div>
  )
}
