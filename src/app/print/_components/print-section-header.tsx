/**
 * PrintSectionHeader — section divider in printed booklets.
 *
 * Used in cours booklets to separate labeled sections
 * (e.g. "Continuite en un point", "Theoreme des valeurs intermediaires").
 */

interface PrintSectionHeaderProps {
  label: string
  sectionNumber: number
}

export function PrintSectionHeader({ label, sectionNumber }: PrintSectionHeaderProps) {
  return (
    <div className="print-section-header mb-6 mt-10 break-after-avoid border-b-2 border-stone-800 pb-2 first:mt-0">
      <div className="flex items-baseline gap-3">
        <span className="font-serif text-2xl font-bold text-stone-300">
          {String(sectionNumber).padStart(2, '0')}
        </span>
        <h2 className="font-serif text-lg font-bold text-stone-800">
          {label}
        </h2>
      </div>
    </div>
  )
}
