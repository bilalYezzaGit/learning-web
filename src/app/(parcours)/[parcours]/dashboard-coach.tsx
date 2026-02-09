'use client'

/**
 * Dashboard Coach Wrapper
 *
 * Client component that renders the AI Performance Coach on the dashboard.
 * Loads module data and passes it to the coach component.
 */

import { PerformanceCoach, PerformanceCoachTeaser } from '@/components/ai/performance-coach'
import { useAuth } from '@/lib/context'

interface DashboardCoachProps {
  parcours: string
}

/**
 * Known modules for 1ère TC programme.
 * Statically defined to avoid server/client boundary issues.
 * If new modules are added to the programme YAML, update this list.
 */
const MODULES_1ERE_TC = [
  { slug: 'calcul-numerique-1', title: 'Calcul numérique 1', tags: ['puissances', 'racines'] },
  { slug: 'calcul-numerique-2', title: 'Calcul numérique 2', tags: ['intervalles', 'valeur-absolue', 'encadrements'] },
  { slug: 'calcul-algebrique', title: 'Calcul algébrique', tags: ['developpement', 'factorisation', 'identites-remarquables'] },
  { slug: 'equations-inequations', title: 'Équations et inéquations', tags: ['equations', 'inequations'] },
  { slug: 'systemes-equations', title: 'Systèmes d\'équations', tags: ['systemes', 'substitution', 'combinaison'] },
  { slug: 'fonctions-lineaires', title: 'Fonctions linéaires', tags: ['fonctions-lineaires', 'proportionnalite'] },
  { slug: 'fonctions-affines', title: 'Fonctions affines', tags: ['fonctions-affines', 'droites'] },
  { slug: 'fonctions-notion', title: 'Notion de fonction', tags: ['fonctions', 'domaine', 'variations'] },
  { slug: 'statistiques', title: 'Statistiques', tags: ['statistiques', 'moyenne', 'mediane'] },
  { slug: 'repere-plan', title: 'Repère dans le plan', tags: ['repere', 'coordonnees', 'distance', 'milieu'] },
  { slug: 'vecteurs-translation', title: 'Vecteurs et translation', tags: ['vecteurs', 'translation'] },
  { slug: 'somme-vecteurs', title: 'Somme de vecteurs', tags: ['somme-vecteurs', 'chasles'] },
  { slug: 'thales', title: 'Théorème de Thalès', tags: ['thales'] },
  { slug: 'trigonometrie', title: 'Trigonométrie', tags: ['trigonometrie', 'sinus', 'cosinus', 'tangente'] },
  { slug: 'angles', title: 'Angles', tags: ['angles', 'radians'] },
  { slug: 'sections-solides', title: 'Sections de solides', tags: ['sections', 'solides', 'geometrie-espace'] },
]

export function DashboardCoach({ parcours }: DashboardCoachProps) {
  const { userId } = useAuth()

  if (!userId) {
    return <PerformanceCoachTeaser className="mb-6" />
  }

  return (
    <PerformanceCoach
      parcours={parcours}
      modules={MODULES_1ERE_TC}
      totalActivities={200}
      className="mb-6"
    />
  )
}
