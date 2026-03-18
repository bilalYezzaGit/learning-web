import Link from 'next/link'
import { BookOpen } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'

export default function NotFound() {
  return (
    <div className="bg-muted flex min-h-svh flex-col items-center justify-center p-6">
      <Card className="mx-auto w-full max-w-md text-center">
        <CardContent className="space-y-6 py-12">
          <div className="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
            <BookOpen className="h-8 w-8 text-primary" aria-hidden="true" />
          </div>
          <div className="space-y-2">
            <p className="font-serif text-5xl font-bold text-primary">404</p>
            <h1 className="text-xl font-semibold">Page introuvable</h1>
            <p className="text-sm text-muted-foreground">
              Cette page n&apos;existe pas. Peut-etre que le QR code
              de ton livret te menera au bon endroit ?
            </p>
          </div>
          <div className="flex flex-col gap-2 sm:flex-row sm:justify-center">
            <Button asChild>
              <Link href="/app/mes-livrets">Mes livrets</Link>
            </Button>
            <Button variant="outline" asChild>
              <Link href="/">Retour a l&apos;accueil</Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
