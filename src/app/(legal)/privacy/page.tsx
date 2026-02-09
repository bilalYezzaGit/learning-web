import Link from 'next/link'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export const metadata = {
  title: 'Politique de confidentialite',
}

export default function PrivacyPage() {
  return (
    <div className="bg-muted flex min-h-svh flex-col items-center justify-center p-6 md:p-10">
      <Card className="mx-auto w-full max-w-2xl">
        <CardContent className="prose prose-stone dark:prose-invert max-w-none p-6 md:p-10">
          <h1>Politique de confidentialite</h1>
          <p className="text-muted-foreground">Derniere mise a jour : fevrier 2026</p>

          <h2>1. Donnees collectees</h2>
          <p>
            Learning OS collecte uniquement les donnees necessaires au fonctionnement du service :
          </p>
          <ul>
            <li><strong>Email</strong> — pour l&apos;authentification</li>
            <li><strong>Progression</strong> — activites completees, scores QCM, tentatives</li>
            <li><strong>Parcours choisi</strong> — pour personnaliser le contenu affiche</li>
          </ul>

          <h2>2. Utilisation des donnees</h2>
          <p>
            Vos donnees sont utilisees exclusivement pour :
          </p>
          <ul>
            <li>Sauvegarder votre progression d&apos;apprentissage</li>
            <li>Afficher vos statistiques personnelles</li>
            <li>Ameliorer le contenu pedagogique (donnees anonymisees)</li>
          </ul>

          <h2>3. Stockage et securite</h2>
          <p>
            Les donnees sont stockees sur Firebase (Google Cloud Platform),
            dans des centres de donnees securises. L&apos;acces est protege par
            des regles de securite Firestore.
          </p>

          <h2>4. Partage des donnees</h2>
          <p>
            Nous ne vendons ni ne partageons vos donnees personnelles avec des tiers.
            Aucune donnee n&apos;est utilisee a des fins publicitaires.
          </p>

          <h2>5. Cookies</h2>
          <p>
            Learning OS utilise des cookies techniques uniquement (authentification,
            preferences d&apos;interface). Aucun cookie de tracking ou publicitaire n&apos;est utilise.
          </p>

          <h2>6. Vos droits</h2>
          <p>
            Vous pouvez a tout moment demander la suppression de votre compte et de
            toutes les donnees associees en nous contactant.
          </p>

          <h2>7. Contact</h2>
          <p>
            Pour toute question relative a la confidentialite, contactez-nous a
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
