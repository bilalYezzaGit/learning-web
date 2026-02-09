# Review feat/ui-ux-100-percent — Plan d'action

## BLOQUANTS

### 1. ~~Auth factice sur `/api/scan`~~
- **Fichier** : `src/app/api/scan/route.ts`
- **Fix** : `firebase-admin` installé, `verifyIdToken` implémenté via `src/lib/firebase/admin.ts`
- **Env vars Vercel** : `FIREBASE_PROJECT_ID`, `FIREBASE_CLIENT_EMAIL`, `FIREBASE_PRIVATE_KEY` (configurés)
- **Status** : [x] DONE (code + Firebase service account + Vercel env vars)

### 2. Rate limiter inefficace en serverless
- **Fichier** : `src/app/api/scan/route.ts:19-40`
- **Problème** : `Map` in-memory se réinitialise à chaque cold start Vercel = no-op en prod
- **Fix** : Documenté comme best-effort MVP dans le commentaire. Acceptable car l'auth est maintenant réelle.
- **Status** : [x] DONE (accepté MVP)

### 3. ~~`rateMap` fuit en mémoire~~
- **Fix** : Ajout d'un cap `MAX_RATE_ENTRIES` + purge des entrées expirées quand le seuil est atteint
- **Status** : [x] DONE

---

## IMPORTANTS

### 4. CSP avec `unsafe-inline` et `unsafe-eval`
- **Fichier** : `next.config.ts:33-34`
- **Problème** : Annule la protection XSS du CSP
- **Fix** : Documenter comme dette technique MVP (nonces nécessaires avec Next.js)
- **Status** : [ ] TODO

### 5. `localStorage` dans initializer `useState` (hydration mismatch)
- **Fichier** : `src/app/(parcours)/[parcours]/reviser/serie/[id]/play/serie-player.tsx:54-63`
- **Problème** : SSR rend `0`, client peut trouver une valeur sauvegardée = mismatch
- **Fix** : `useState(0)` + `useEffect` pour hydrater depuis localStorage
- **Status** : [ ] TODO

### 6. `getLocalProgress()` potentiellement appelé côté serveur
- **Fichier** : `src/lib/services/local-progress.ts` + `src/lib/hooks/use-progress.ts`
- **Problème** : Si le hook est exécuté côté serveur, `localStorage` crash
- **Fix** : Vérifier que `useProgress` est toujours client-only (il l'est via `use client` parents)
- **Status** : [ ] À vérifier

### 7. `⌘K` hardcodé sans détection OS
- **Fichier** : `src/components/search-command.tsx:836`
- **Problème** : Affiche `⌘K` sur Windows/Linux
- **Fix** : Détecter `navigator.platform` pour afficher `Ctrl` vs `⌘`
- **Status** : [ ] TODO

### 8. Admin supprimé sans redirect
- **Fichiers** : `src/app/admin/` supprimé, `src/middleware.ts`
- **Problème** : Liens/bookmarks vers `/admin` donnent un 404
- **Fix** : Vérifier s'il y a des liens, ajouter un redirect si nécessaire
- **Status** : [ ] À vérifier

---

## MINEURS

### 9. Selects natifs dans `reviser-client.tsx`
- **Fix** : Remplacer par `Select` shadcn/ui
- **Status** : [ ] Optionnel

### 10. `setLocalExerciseComplete` ignore `contextType`/`contextId`
- **Fix** : Aligner les signatures
- **Status** : [ ] TODO

### 11. `EmptyState` créé mais jamais utilisé
- **Fix** : Supprimer ou utiliser
- **Status** : [ ] TODO

### 12. `ConfirmDialog` créé mais jamais utilisé
- **Fix** : Supprimer ou utiliser
- **Status** : [ ] TODO

### 13. Ellipses typographiques inconsistantes
- **Fix** : Harmoniser `…` partout
- **Status** : [ ] Optionnel

### 14. `ThemeProvider` — vérifier pas de double wrapping
- **Fix** : Vérifier qu'il n'y a pas d'autre occurrence
- **Status** : [ ] À vérifier
