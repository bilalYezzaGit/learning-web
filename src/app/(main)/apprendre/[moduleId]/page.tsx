/**
 * Module Detail Page (Default Content)
 *
 * Shows when no activity is selected.
 * Displayed in the right panel of the split view.
 */

import { BookOpen } from 'lucide-react'

export default function ModuleDefaultPage() {
  return (
    <div className="flex h-full items-center justify-center text-muted-foreground">
      <div className="text-center">
        <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" />
        <p className="text-lg font-medium">Sélectionnez une activité</p>
        <p className="mt-1 text-sm">
          Cliquez sur une activité dans la liste pour voir son contenu
        </p>
      </div>
    </div>
  )
}
