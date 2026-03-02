/**
 * PrintSectionHeader — section divider in printed booklets (cours).
 *
 * Professional two-tone header with section number and label.
 */

interface PrintSectionHeaderProps {
  label: string
  sectionNumber: number
}

export function PrintSectionHeader({ label, sectionNumber }: PrintSectionHeaderProps) {
  return (
    <div className="print-section-header mb-5 mt-8 first:mt-0">
      <div className="flex items-center gap-3 border-b-2 border-stone-800 pb-2" data-print-color>
        <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-md bg-stone-800 font-serif text-sm font-bold text-white" data-print-color>
          {sectionNumber}
        </span>
        <h2 className="font-serif text-lg font-bold text-stone-800">
          {label}
        </h2>
      </div>
    </div>
  )
}
