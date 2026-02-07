---
paths:
  - "src/lib/firebase/**"
  - "src/lib/services/**"
---

# Firebase Patterns

## Service Pattern

- Un service par domaine dans `src/lib/services/`
- Les services encapsulent TOUS les appels Firebase (auth, Firestore, Functions)
- Pas d'import direct Firebase dans les composants — toujours passer par un service
- Export nomme (pas default) : `export const authService = { ... }`

## Auth State

- `onAuthStateChanged` dans un hook client (`use-auth.ts`)
- Stocker l'user dans le Zustand store `auth-store.ts`
- Pas de `getAuth()` direct dans les composants

## Firestore Conventions

- Collections en camelCase : `userProgress`, `courseData`
- Documents : ID auto-genere sauf si logique metier exige un ID specifique
- Pas de donnees sensibles cote client — utiliser Firebase Functions pour la logique server
- Typer les documents avec les interfaces de `src/types/`

## Securite

- Ne jamais exposer les credentials Firebase en dehors de `.env.local`
- Regles Firestore : deny par defaut, allow specifique
- Valider les donnees cote serveur (Firebase Functions) avant ecriture
