import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { DEFAULT_PARCOURS_SLUG } from '@/lib/parcours'

export default function NotFound() {
  return (
    <div className="bg-muted flex min-h-svh flex-col items-center justify-center p-6">
      <Card className="mx-auto w-full max-w-md text-center">
        <CardContent className="space-y-6 py-12">
          <div className="space-y-2">
            <p className="font-serif text-6xl font-bold text-primary">404</p>
            <h1 className="text-xl font-semibold">Page introuvable</h1>
            <p className="text-sm text-muted-foreground">
              Cette page n&apos;existe pas ou a été déplacée.
            </p>
          </div>
          <div className="flex flex-col gap-2 sm:flex-row sm:justify-center">
            <Button asChild>
              <Link href="/">Retour à l&apos;accueil</Link>
            </Button>
            <Button variant="outline" asChild>
              <Link href={`/${DEFAULT_PARCOURS_SLUG}/apprendre`}>Explorer les cours</Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
