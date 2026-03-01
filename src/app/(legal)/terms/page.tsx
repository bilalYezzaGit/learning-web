import Link from 'next/link'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export const metadata = {
  title: "Conditions d'utilisation",
}

export default function TermsPage() {
  return (
    <div className="bg-muted flex min-h-svh flex-col items-center justify-center p-6 md:p-10">
      <Card className="mx-auto w-full max-w-2xl">
        <CardContent className="prose prose-stone max-w-none p-6 md:p-10">
          <h1>Conditions d&apos;utilisation</h1>
          <p className="text-muted-foreground">Derniere mise a jour : fevrier 2026</p>

          <h2>1. Acceptation des conditions</h2>
          <p>
            En accedant a Learning OS, vous acceptez les presentes conditions d&apos;utilisation.
            La plateforme est un outil educatif gratuit destine aux eleves du lycee tunisien.
          </p>

          <h2>2. Description du service</h2>
          <p>
            Learning OS propose des cours de mathematiques structures, des exercices interactifs
            et des series de revision. Le contenu est conforme au programme officiel tunisien.
          </p>

          <h2>3. Compte utilisateur</h2>
          <p>
            La creation d&apos;un compte est optionnelle. Elle permet de sauvegarder votre
            progression. Vous etes responsable de la confidentialite de vos identifiants.
          </p>

          <h2>4. Propriete intellectuelle</h2>
          <p>
            Le contenu pedagogique (cours, exercices, QCM) est la propriete de Learning OS.
            Toute reproduction a des fins commerciales est interdite. L&apos;utilisation a des fins
            educatives personnelles est libre.
          </p>

          <h2>5. Limitation de responsabilite</h2>
          <p>
            Learning OS est fourni en l&apos;etat. Nous ne garantissons pas l&apos;absence d&apos;erreurs
            dans le contenu pedagogique. La plateforme ne remplace pas l&apos;enseignement scolaire.
          </p>

          <h2>6. Contact</h2>
          <p>
            Pour toute question relative a ces conditions, contactez-nous a
            l&apos;adresse indiquee sur la plateforme.
          </p>

          <div className="mt-8 not-prose">
            <Button variant="outline" asChild>
              <Link href="/">Retour a l&apos;accueil</Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
