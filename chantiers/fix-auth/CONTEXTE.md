# Contexte : fix-auth

> **Cree** : 2025-02-05
> **Statut** : Terminé ✓
> **GitHub Issue** : #1 (https://github.com/bilalYezzaGit/learning-web/issues/1)
> **Objectif** : Implementer l'authentification Firebase (login, signup, logout) qui est actuellement un stub non fonctionnel

---

## Objectif detaille

L'authentification actuelle est un STUB qui ne fait rien : le code fait juste `setTimeout(() => router.push('/'))` sans appeler Firebase. Il faut implementer une vraie authentification avec signup, login email/password, login anonyme, et gestion de session.

---

## Recherche et inventaire

### Fichiers existants

| Fichier | Role | Etat |
|---------|------|------|
| `src/app/(auth)/login/page.tsx` | Page de login | STUB - TODO non implementes |
| `src/lib/services/auth-service.ts` | Service Firebase Auth | OK - fonctions pretes |
| `src/lib/context/auth-context.tsx` | Context React pour auth | A verifier |
| `src/lib/hooks/use-auth.ts` | Hook useAuth | A verifier |
| `src/lib/firebase/client.ts` | Config Firebase | A verifier |

### Pages manquantes

- `/signup` - 404 (n'existe pas)
- `/register` - 404 (n'existe pas)
- `/forgot-password` - Non testee

### Problemes identifies (audit du 2025-02-05)

| # | Probleme | Gravite |
|---|----------|---------|
| 1 | **Login email = STUB** - `handleEmailLogin` fait juste `setTimeout(() => router.push('/'))` sans appeler `signInWithEmail` | CRITIQUE |
| 2 | **Login anonyme = STUB** - `handleAnonymousLogin` fait juste `setTimeout(() => router.push('/'))` sans appeler `signInAnonymously` | CRITIQUE |
| 3 | **Page signup inexistante** - `/signup` et `/register` retournent 404 | CRITIQUE |
| 4 | **Pas de lien "Creer un compte"** sur la page login | MAJEUR |
| 5 | **Pas de lien "Mot de passe oublie"** | MINEUR |
| 6 | **Pas de gestion d'erreurs** (email invalide, mauvais mot de passe, etc.) | MAJEUR |
| 7 | **Pas de validation de formulaire** | MINEUR |
| 8 | **Pas de feedback utilisateur** (loading state visible, messages d'erreur) | MINEUR |
| 9 | **UI non mise a jour apres login** - L'avatar reste "N", pas de nom utilisateur | MAJEUR |

### Service auth-service.ts (fonctions disponibles)

```typescript
// Fonctions pretes a l'emploi dans auth-service.ts
signInAnonymouslyFn()      // Login anonyme
signInWithEmail(email, pw) // Login email
createAccount(email, pw)   // Signup
signOut()                  // Logout
getCurrentUser()           // User actuel
subscribeToAuthState()     // Observer auth state
```

---

## Findings

### Auto-save (2026-02-05 20:04)
> Context compaction triggered. Session state preserved in this file.


### Recherche effectuee

| Date | Sujet | Resultat |
|------|-------|----------|
| 2025-02-05 | Audit page login | Code = STUB avec TODO, handlers ne font rien |
| 2025-02-05 | Routes signup | /signup et /register = 404 |
| 2025-02-05 | Service auth | auth-service.ts a toutes les fonctions Firebase OK |
| 2025-02-05 | Test login email | Redirect vers / mais user reste "Visiteur" |

### Decisions cles

| # | Date | Decision | Raison |
|---|------|----------|--------|
| 1 | 2025-02-05 | Utiliser auth-service.ts existant | Code Firebase deja pret |
| 2 | - | A decider : page signup separee ou modal ? | - |
| 3 | - | A decider : gestion erreurs (toast vs inline) ? | - |

### Notes de session

- Le bouton "Se connecter avec un email" ouvre un formulaire inline (pas de navigation)
- Les credentials de test : bilal.yezza@gmail.com / Aylan230522P-
- Firebase est configure (fichier client.ts existe)

---

## Contraintes

- Utiliser Firebase Auth (deja configure)
- Garder le design actuel (shadcn/ui)
- Ne pas casser le flow "Continuer en tant qu'invite"
- Server Components par defaut, Client Components si necessaire

---

## Definition of Done

- [x] Login email fonctionnel (appelle Firebase, gere erreurs)
- [x] Login anonyme fonctionnel
- [x] Page/Modal signup fonctionnel
- [x] Lien "Mot de passe oublie" fonctionnel
- [x] UI mise a jour apres login (avatar, nom)
- [x] Logout fonctionnel
- [x] Gestion des erreurs avec feedback utilisateur
- [x] Pipelines executes et valides
- [x] VERIFY checklist OK (npm run build + npm run lint)
- [ ] Chantier archive
