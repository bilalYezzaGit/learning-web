# TypeScript Strict

- Pas de `any` — utiliser `unknown` si necessaire
- Pas de `@ts-ignore` ni `@ts-expect-error`
- Pas de non-null assertions `!` sauf cas justifie en commentaire
- Interfaces et types dans `src/types/`, pas inline dans les composants
- Imports avec alias `@/` uniquement (jamais de chemins relatifs `../`)
- Pas de `console.log` en production — utiliser `console.warn`/`console.error` si necessaire
