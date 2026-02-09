# Print Styles

> @media print rules for clean printed output.

- PRT-001 [auto] Print hides nav elements: display none on nav, aside, footer, header, [data-sidebar], [data-slot="button"], .fixed
- PRT-002 [auto] Print body: background white, color black
- PRT-003 [auto] Print main: width and max-width 100%
- PRT-004 [auto] Print prose: font-size 12pt, max-width 100%
- PRT-005 [auto] Print links show URLs: .prose a::after content " (" attr(href) ")" + break-inside avoid on cards
