# Plan : fix-auth

> Statut : En cours
> Pipeline actuel : 5/5 ✓ TERMINÉ

## Pipelines

### 1. Connecter login email a Firebase [x]
- CODE: Modifier `src/app/(auth)/login/page.tsx`
  - Importer `signInWithEmail` de auth-service
  - Remplacer le TODO par l'appel reel
  - Ajouter try/catch avec gestion erreurs
  - Ajouter loading state
- VERIFY: npm run build + npm run lint
- COMMIT: feat(auth): implement email login with Firebase

### 2. Connecter login anonyme a Firebase [x]
- CODE: Modifier `src/app/(auth)/login/page.tsx`
  - Importer `signInAnonymouslyFn` de auth-service
  - Remplacer le TODO par l'appel reel
  - Ajouter try/catch
- VERIFY: npm run build + npm run lint
- COMMIT: feat(auth): implement anonymous login with Firebase

### 3. Creer page/modal signup [x]
- CODE:
  - Option A: Creer `src/app/(auth)/signup/page.tsx`
  - Option B: Ajouter mode signup dans login/page.tsx
  - Utiliser `createAccount` de auth-service
  - Ajouter lien depuis page login
- VERIFY: npm run build + npm run lint
- COMMIT: feat(auth): add signup functionality

### 4. Ajouter "Mot de passe oublie" [x]
- CODE:
  - Ajouter lien dans le formulaire login
  - Creer page ou modal forgot-password
  - Utiliser Firebase `sendPasswordResetEmail`
- VERIFY: npm run build + npm run lint
- COMMIT: feat(auth): add forgot password flow

### 5. Mettre a jour UI apres auth [x]
- CODE:
  - Verifier auth-context.tsx fournit user
  - Modifier sidebar/header pour afficher nom/email
  - Modifier avatar pour afficher initiales ou photo
  - Ajouter bouton logout dans profil
- VERIFY: npm run build + npm run lint
- COMMIT: feat(auth): update UI with user state

---

## Notes

- Chaque pipeline est independant mais l'ordre est recommande
- Pipeline 1 et 2 peuvent etre faits en parallele
- Pipeline 5 depend des autres (besoin d'un user connecte pour tester)
