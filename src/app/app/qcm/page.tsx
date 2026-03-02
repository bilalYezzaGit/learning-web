/**
 * Quick QCM Launcher — pick a module and duration for a quick quiz session.
 *
 * Server component that loads booklets, renders client wrapper
 * for interactive duration selection.
 */

import type { Metadata } from 'next'
import { getAllBooklets } from '@/lib/booklet'
import { getModuleQcmQuestions } from '@/lib/qcm-loader'
import { QcmLauncher } from '@/app/app/qcm/_components/qcm-launcher'

export const metadata: Metadata = {
  title: 'QCM rapide',
}

export default function QcmLauncherPage() {
  const booklets = getAllBooklets()

  // Enrich booklets with actual QCM counts from raw content
  const modules = booklets
    .map((b) => {
      const rawQcmCount = getModuleQcmQuestions(b.moduleSlug).length
      return {
        moduleSlug: b.moduleSlug,
        title: b.title,
        qcmCount: rawQcmCount || b.qcmCount,
      }
    })
    .filter((m) => m.qcmCount > 0)

  return <QcmLauncher modules={modules} />
}
