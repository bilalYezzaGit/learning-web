# Roadmap Production — Aylan Learning

**Objectif** : Mettre l'app PWA entre les mains de vrais eleves.

**Legende responsabilite** :
- **CLAUDE** = Faisable en autonomie par Claude (code, contenu technique)
- **TOI** = Necessite ton action (decisions produit, comptes, impressions, tests physiques)
- **ENSEMBLE** = Je code, mais j'ai besoin de ta validation ou d'un choix de ta part

---

## Phase 1 — Securite (semaine 1)

> Rien ne doit aller en prod sans ca. C'est la base.

### 1.1 Deployer les Firestore rules
- **Qui** : CLAUDE
- **Quoi** : Lancer `firebase deploy --only firestore:rules` — le CLI Firebase est authentifie et le projet `learning-os-platform` est selectionne.
- **Pourquoi** : Les rules dans `firestore.rules` sont bien ecrites (deny by default, owner-only access), mais il faut s'assurer qu'elles sont deployees sur le projet Firebase de prod
- **Effort** : 2 min

### 1.2 Verifier les variables d'environnement serveur
- **Qui** : TOI
- **Quoi** : Verifier que `.env.local` contient bien `ANTHROPIC_API_KEY`, `FIREBASE_PROJECT_ID`, `FIREBASE_CLIENT_EMAIL`, `FIREBASE_PRIVATE_KEY` et qu'aucune cle secrete n'est prefixee `NEXT_PUBLIC_` (sinon elle est exposee au client)
- **Pourquoi** : Les cles serveur ne doivent jamais etre visibles cote navigateur
- **Note** : Je ne lis pas tes `.env` par securite

### 1.3 Ajouter rate limiting sur `/api/booklet/validate`
- **Qui** : CLAUDE
- **Quoi** : Ajouter le meme pattern de rate limiting in-memory que `/api/scan` (deja implemente) sur la route de validation booklet. Actuellement zero protection — un bot peut bruteforcer les codes.
- **Effort** : 15 min

### 1.4 Auditer la CSP (Content Security Policy)
- **Qui** : CLAUDE
- **Quoi** : Le `next.config.ts` a un TODO ligne 37 : `unsafe-inline`/`unsafe-eval` sont necessaires pour Next.js/KaTeX mais on peut restreindre les domaines autorises et ajouter des directives manquantes (`form-action`, `base-uri`)
- **Effort** : 30 min

### 1.5 Verifier que la Firebase private key n'est pas dans le repo
- **Qui** : TOI
- **Quoi** : Verifier que `.env.local` est dans `.gitignore` (il l'est) et qu'aucun commit historique ne contient de cle privee. Lancer `git log --all -p -- .env*` pour verifier.
- **Effort** : 5 min

---

## Phase 2 — Contenu pedagogique (semaines 2-4)

> C'est le plus long. L'app est un shell sans contenu suffisant. Actuellement : 3 modules (continuite, derivation, fonctions) pour le programme 3eme-math uniquement.

### 2.1 Completer les QCM du module Continuite
- **Qui** : CLAUDE
- **Quoi** : Le module continuite a 40+ exercices mais les QCM ne couvrent que les series de base. Les series manuel-complet, parascolaire et xy-plus n'ont pas de QCM. Creer 10-15 QCM supplementaires.
- **Effort** : 2-3h par serie de QCM

### 2.2 Creer les QCM du module Derivation
- **Qui** : CLAUDE
- **Quoi** : 0 QCM actuellement. Creer minimum 8-10 QCM couvrant : nombre derive, regles de derivation, derivee composee, tangente, variations.
- **Effort** : 3-4h

### 2.3 Creer les QCM du module Fonctions
- **Qui** : CLAUDE
- **Quoi** : 0 QCM actuellement. Creer minimum 8-10 QCM couvrant : domaine, parite, variations, transformations.
- **Effort** : 3-4h

### 2.4 Verifier le rendu HTML de tous les exercices
- **Qui** : ENSEMBLE
- **Quoi** : 96 fichiers HTML generes. Je peux verifier que le KaTeX compile sans erreur, mais toi seul peux juger visuellement si les formules, figures et tableaux sont corrects sur mobile.
- **Methode** : Je lance une verification automatique des erreurs KaTeX, tu fais un passage visuel sur les 3 modules

### 2.5 Decider du nombre de livrets pour le lancement
- **Qui** : TOI
- **Quoi** : Actuellement 6 cours JSON (continuite x4 series, derivation x2, fonctions x2). Chaque cours = 1 livret physique potentiel. Decider : lance-t-on avec 3 livrets (1 par module) ou plus ?
- **Impact** : Determine la quantite de contenu a finaliser et de livrets a imprimer

---

## Phase 3 — Pages manquantes (semaine 2-3)

### 3.1 Creer la page `/terms` (CGU)
- **Qui** : ENSEMBLE
- **Quoi** : Le footer landing link vers `/terms` — actuellement 404. Je peux generer un template CGU standard adapte au contexte tunisien (app educative, donnees mineurs, Firebase), mais tu dois valider le contenu juridique.
- **Effort** : 1h (generation + review)

### 3.2 Creer la page `/privacy` (politique de confidentialite)
- **Qui** : ENSEMBLE
- **Quoi** : Meme situation que `/terms`. Obligatoire pour toute app qui collecte des donnees (email, progression, scans). Template RGPD-compatible.
- **Effort** : 1h

### 3.3 Adapter la landing page au positionnement "livret augmente"
- **Qui** : CLAUDE
- **Quoi** : La landing actuelle parle de "Learning OS", "15 modules", "100% gratuit" — ca ne correspond plus au produit Aylan. Il faut :
  - Renommer "Learning OS" → "Aylan" partout (manifest, landing, footer)
  - Changer le hero : "Augmente ton livret de maths" au lieu de "Les maths expliquees avec soin"
  - Adapter les features cards au nouveau positionnement (scan, feedback IA, progression)
  - Supprimer "100% gratuit" si modele payant par livret
  - Adapter les stats (nombre de livrets, exercices reels)
- **Effort** : 2-3h
- **Prerequis** : Tu me confirmes le nom "Aylan" et le messaging voulu

### 3.4 Mettre a jour le manifest PWA
- **Qui** : CLAUDE
- **Quoi** : Renommer "Learning OS" → "Aylan" dans `manifest.json`, ajuster `theme_color` si nouveau branding
- **Effort** : 5 min
- **Prerequis** : Confirmation du nom + couleur primaire

---

## Phase 4 — UX mobile polish (semaine 3-4)

### 4.1 Creer un onboarding premier lancement
- **Qui** : CLAUDE
- **Quoi** : Quand un utilisateur ouvre l'app pour la premiere fois (pas de livrets associes), afficher un ecran simple en 2-3 etapes :
  1. "Bienvenue sur Aylan"
  2. "Scanne le QR code de ton livret"
  3. "Commence a travailler"
  Stocke en localStorage qu'il a vu l'onboarding.
- **Effort** : 2-3h

### 4.2 Ameliorer l'etat vide "Mes Livrets"
- **Qui** : CLAUDE
- **Quoi** : Quand la liste est vide, afficher une illustration + CTA "Scanne ton premier livret" qui pointe vers `/app/scan`. Actuellement c'est probablement juste une liste vide.
- **Effort** : 1h

### 4.3 Ajouter des feedback visuels (toasts, animations)
- **Qui** : CLAUDE
- **Quoi** :
  - Toast de succes apres pairing d'un livret (sonner est deja installe)
  - Animation de transition sur le FAB scan
  - Feedback haptic si disponible (`navigator.vibrate`)
  - Loading skeleton sur les pages qui fetchent Firestore
- **Effort** : 2-3h

### 4.4 Tester le install prompt PWA
- **Qui** : TOI
- **Quoi** : Ouvrir l'app deployee sur :
  - iPhone Safari → verifier le prompt "Ajouter a l'ecran d'accueil"
  - Android Chrome → verifier le banner A2HS
  - Verifier le splash screen au lancement
- **Note** : Le composant `pwa-install-prompt.tsx` existe mais n'a jamais ete teste en conditions reelles

### 4.5 Tester la camera sur differents devices
- **Qui** : TOI
- **Quoi** : Le QR scanner (`qr-scanner` lib) et la capture photo (exercice scan) dependent de `getUserMedia`. Tester sur :
  - iPhone SE (petit ecran)
  - iPhone recent (camera moderne)
  - Samsung Galaxy budget (Android Go)
  - Verifier les permissions camera, le focus, la qualite de l'image envoyee a Claude
- **Note** : Impossible de tester ca depuis un terminal

---

## Phase 5 — Deploiement (semaine 4)

### 5.1 Choisir la plateforme d'hebergement
- **Qui** : TOI
- **Quoi** : Deux options :
  - **Vercel** (recommande) : Zero config pour Next.js, deploy automatique depuis GitHub, SSL gratuit, variables d'env en UI. Gratuit pour le trafic MVP.
  - **Firebase Hosting + Cloud Functions** : Plus complexe a configurer, mais tout reste dans l'ecosysteme Firebase.
- **Ma recommandation** : Vercel. C'est fait pour Next.js, et Firebase est deja utilise pour Auth/Firestore.

### 5.2 Acheter et configurer le domaine
- **Qui** : TOI
- **Quoi** : Acheter `aylan.tn` (ou `.com`) et le pointer vers l'hebergeur (DNS CNAME pour Vercel, ou A record pour Firebase)
- **Note** : Decision 100% business, je ne peux pas intervenir

### 5.3 Configurer les variables d'env en production
- **Qui** : TOI
- **Quoi** : Sur Vercel (ou autre), ajouter :
  - `ANTHROPIC_API_KEY`
  - `FIREBASE_PROJECT_ID`
  - `FIREBASE_CLIENT_EMAIL`
  - `FIREBASE_PRIVATE_KEY`
  - Les variables `NEXT_PUBLIC_FIREBASE_*` pour le client
- **Note** : Copier les valeurs depuis `.env.local`, ne jamais les commit

### 5.4 Configurer le deploiement automatique
- **Qui** : ENSEMBLE
- **Quoi** : Connecter le repo GitHub a Vercel pour auto-deploy sur push `main`. Je peux preparer le `vercel.json` si besoin, mais la connexion GitHub necessite ton compte.
- **Effort** : 30 min

### 5.5 Mettre en place le monitoring
- **Qui** : CLAUDE
- **Quoi** : Installer Sentry (ou alternative gratuite) pour capturer les erreurs JS en prod. Firebase Analytics est deja initialise dans le code, mais pas configure pour tracker les events critiques (scan reussi, pairing, QCM complete).
- **Effort** : 2-3h

### 5.6 Configurer les alertes
- **Qui** : ENSEMBLE
- **Quoi** : Etre prevenu si :
  - Le taux d'erreurs API depasse un seuil
  - L'API Anthropic renvoie des 500
  - Le build deploy echoue
  Sentry envoie des emails par defaut. Vercel aussi.
- **Effort** : 30 min

---

## Phase 6 — Nettoyage technique (en parallele)

### 6.1 Supprimer les dependances inutilisees
- **Qui** : CLAUDE
- **Quoi** : Supprimer de `package.json` :
  - `qrcode` + `@types/qrcode` (installe mais jamais importe)
  - `radix-ui` (package incorrect — shadcn utilise `@radix-ui/*` directement)
- **Effort** : 5 min

### 6.2 Fixer les 12 tests specs qui echouent
- **Qui** : CLAUDE
- **Quoi** : Principalement des references a l'ancien systeme de routes `(parcours)` qui a ete supprime. Mettre a jour les specs pour refleter la nouvelle architecture.
- **Effort** : 30 min - 1h

### 6.3 Nettoyer les deps Typst inutilisees
- **Qui** : CLAUDE
- **Quoi** : `@myriaddreamin/typst*` en devDependencies — 0 imports dans le code source. Supprimer si confirme inutile.
- **Prerequis** : Tu confirmes que Typst n'est plus prevu pour les figures

### 6.4 Supprimer le dossier `src/app/app/qcm/session/`
- **Qui** : CLAUDE
- **Quoi** : Le dossier est maintenant vide apres la suppression des routes QCM globales. Nettoyer.
- **Effort** : 1 min

---

## Phase 7 — Pre-lancement (semaine 5-6)

### 7.1 Designer et imprimer les livrets physiques
- **Qui** : TOI
- **Quoi** : Le produit n'existe pas sans le livret papier. Pour chaque livret :
  - Mise en page des exercices (InDesign, Canva, ou LaTeX)
  - QR codes sur chaque exercice (format `/app/ex?id={activityId}`)
  - QR code global du livret (format booklet code)
  - Impression 10-20 exemplaires pour beta
- **Note** : C'est le travail le plus important et le plus long. Aucune partie de ca n'est automatisable.

### 7.2 Generer et enregistrer les codes booklet
- **Qui** : ENSEMBLE
- **Quoi** : Chaque livret physique a un code unique. Les codes sont deja generes par le pipeline (`{MODULE}-{PROGRAMME}-{numero}`). Il faut :
  - Verifier que les codes dans le systeme correspondent aux QR codes imprimes
  - Potentiellement creer un batch de codes uniques par exemplaire si on veut l'unicite par livret physique
- **Question ouverte** : Actuellement un code = un module (ex: `CONT-3M`). Si tu veux un code unique par exemplaire physique, il faut adapter le systeme de pairing. A discuter.

### 7.3 Tester le flow complet end-to-end
- **Qui** : TOI
- **Quoi** : Avec un vrai livret imprime :
  1. Ouvrir l'app sur telephone
  2. Creer un compte
  3. Scanner le QR du livret → pairing
  4. Ouvrir un exercice → lire l'enonce
  5. Resoudre sur papier → prendre en photo → feedback IA
  6. Faire un QCM → voir le score
  7. Verifier la page Progres
- **Note** : Test impossible sans le livret physique

### 7.4 Beta test avec 5-10 eleves
- **Qui** : TOI
- **Quoi** : Recruter 5-10 eleves (famille, voisins, amis de profs), leur donner un livret + le lien de l'app, et observer :
  - Est-ce qu'ils comprennent le flow sans explication ?
  - Ou est-ce qu'ils bloquent ?
  - Le feedback IA est-il utile ?
  - Reviendraient-ils utiliser l'app ?
- **Note** : Le feedback qualitatif de cette phase vaut plus que 100h de code

### 7.5 Preparer un canal de feedback
- **Qui** : TOI
- **Quoi** : Creer un groupe WhatsApp ou Telegram pour les beta testeurs. Plus simple et plus naturel qu'un formulaire pour des lyceens tunisiens.

---

## Resume des responsabilites

| Categorie | CLAUDE | TOI | ENSEMBLE |
|-----------|--------|-----|----------|
| Securite | 1.1, 1.3, 1.4 | 1.2, 1.5 | — |
| Contenu | 2.1, 2.2, 2.3 | 2.5 | 2.4 |
| Pages | 3.4 | — | 3.1, 3.2, 3.3 |
| UX | 4.1, 4.2, 4.3 | 4.4, 4.5 | — |
| Deploy | 5.5 | 5.1, 5.2, 5.3 | 5.4, 5.6 |
| Nettoyage | 6.1, 6.2, 6.4 | — | 6.3 |
| Lancement | — | 7.1, 7.3, 7.4, 7.5 | 7.2 |

**Total CLAUDE** : 15 taches (code, contenu QCM, UX, nettoyage, Firebase deploy)
**Total TOI** : 12 taches (cles/env, tests devices, livrets physiques, beta)
**Total ENSEMBLE** : 8 taches (pages legales, branding, deploy config)

---

## Chemin critique

```
[Contenu pedagogique] ──────────────────────────────►
         [Securite] ───►
         [Nettoyage] ──►
                  [Pages manquantes] ────►
                  [UX polish] ──────────►
                              [Deploy] ──►
                                    [Livrets physiques] ──────►
                                                   [Beta test] ──►
```

Le bottleneck est double :
1. **Contenu** (QCM + verification exercices) — c'est le plus long
2. **Livrets physiques** (design + impression) — c'est le plus critique

Tout le reste peut se faire en parallele.
