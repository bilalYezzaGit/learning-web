# Documentation metier -- Learning OS

## 1. Vision et positionnement

**Learning OS** est une plateforme web d'apprentissage des mathematiques destinee aux lyceens tunisiens (de la 1ere a la 4eme annee secondaire). L'application est **100% gratuite**, en **francais**, et couvre le programme officiel tunisien de mathematiques.

L'application se presente comme un "OS d'apprentissage" -- un environnement complet ou l'eleve peut apprendre de nouvelles notions, s'exercer, passer des QCM, reviser par series thematiques, et suivre sa progression dans le temps.

---

## 2. Parcours disponibles (cursus)

L'application est organisee autour de **parcours** (cursus), chacun correspondant a un niveau et une section du systeme educatif tunisien :

| Parcours | Niveau | Section | Etat |
|----------|--------|---------|------|
| **1ere TC** (1ere annee Tronc Commun) | 1ere | Tronc Commun | **Actif** -- seul parcours navigable |
| 3eme Maths | 3eme | Mathematiques | Visible ("Bientot") |
| 2nde Maths | 2nde | Mathematiques | Visible ("Bientot") |
| 1ere Maths | 1ere | Mathematiques | Visible ("Bientot") |
| Terminale Maths | Terminale | Mathematiques | Visible ("Bientot") |

Seul le parcours **1ere TC** est actuellement fonctionnel avec du contenu complet. Les autres sont affiches sur la landing page avec un badge "Bientot" pour signaler qu'ils arrivent prochainement.

---

## 3. Contenu pedagogique -- Etat actuel

### 3.1. Volumes

| Type | Nombre |
|------|--------|
| Lecons (lessons) | 89 |
| Exercices | 131 |
| QCM | 202 |
| **Total atomes** | **422** |
| Modules (cours) | 20 |
| Series de revision | 38 |
| Programmes | 3 (1ere TC, 3eme Math, 3eme Sciences) |

### 3.2. Programme 1ere TC (actif) -- 16 modules

Le parcours principal contient 16 modules couvrant l'integralite du programme de 1ere annee Tronc Commun :

**Geometrie :**
1. Angles (mesures, conversions, cercle, arcs inscrits)
2. Theoreme de Thales (direct et reciproque)
3. Rapports trigonometriques (sin, cos, tan)
4. Vecteurs et translations
5. Somme de vecteurs (relation de Chasles)
6. Repere dans le plan (coordonnees, distance, milieu)
7. Quart de tour (rotation de 90 degres)
8. Sections de solides (cone, pyramide, prisme)

**Calcul numerique :**
9. Calcul numerique 1 (puissances, racines carrees)
10. Calcul numerique 2 (intervalles, valeur absolue)

**Algebre et fonctions :**
11. Algebre (identites remarquables, factorisation, polynomes)
12. Fonctions lineaires
13. Equations et inequations
14. Fonctions affines
15. Systemes d'equations
16. Statistiques

Chaque module est organise en **sections** contenant une alternance de lecons, exercices, et QCM groupes, dans un ordre pedagogique precis.

Le parcours 1ere TC comprend egalement **32 series de revision** couvrant ces 16 modules (2 series par module en moyenne).

### 3.3. Programme 3eme Math (en preparation)

3 modules : Continuite, Derivation, Fonctions. 6 series de revision.

### 3.4. Programme 3eme Sciences (embryonnaire)

1 module (Fonctions Sciences). Aucune serie.

---

## 4. Experience utilisateur detaillee

### 4.1. Page d'accueil (Landing)

La page d'accueil presente la plateforme avec :
- Un **hero** decoratif avec des formules mathematiques (f(x), pi, sigma, integrale) flottantes
- Une **bande de statistiques** : "15 modules", "90+ activites", "100% gratuit"
- Une **grille de fonctionnalites** : cours structures, exercices interactifs, series de revision
- Un **apercu des parcours** avec badge "Disponible" ou "Bientot"
- Un **CTA final** "Pret a commencer ?" avec liens vers inscription/connexion
- Un **footer** avec liens legaux (CGU, politique de confidentialite)

### 4.2. Authentification

L'application propose trois ecrans d'authentification :

- **Connexion** (`/login`) : email + mot de passe, lien "Mot de passe oublie", lien vers inscription
- **Inscription** (`/signup`) : email + mot de passe, creation de compte Firebase
- **Reset mot de passe** (`/reset-password`) : saisie d'email pour recevoir un lien de reinitialisation

Apres inscription ou premiere connexion, si l'utilisateur n'a pas encore choisi de parcours, il est redirige vers la page de **selection de parcours** (`/select-parcours`) qui affiche une grille de parcours actifs.

Les messages d'erreur Firebase sont traduits en francais (compte inexistant, mot de passe incorrect, email deja utilise, etc.).

**L'authentification est facultative.** Un utilisateur non connecte peut naviguer dans tout le contenu, mais sa progression est stockee uniquement en localStorage (non synchronisee entre appareils).

### 4.3. Tableau de bord (`/{parcours}`)

Apres selection du parcours, l'utilisateur accede a son **tableau de bord** :

**Utilisateur connecte avec progression :**
- Carte "Continuez ou vous en etiez" avec la derniere activite en cours
- Statistiques : activites completees, modules termines, pourcentage global de progression
- Grille de modules avec barres de progression individuelles

**Utilisateur connecte sans progression :**
- Carte d'accueil "Commencez votre parcours"

**Utilisateur non connecte :**
- Carte de bienvenue incitant a la connexion

### 4.4. Section "Apprendre" (`/{parcours}/apprendre`)

C'est le coeur pedagogique de l'application. Elle affiche une **grille de modules** (cours) disponibles pour le parcours selectionne.

Chaque carte de module montre :
- Le titre du module
- Une description courte
- Le nombre de sections
- Une barre de progression

#### 4.4.1. Page module (`/{parcours}/apprendre/{moduleId}`)

En cliquant sur un module, l'utilisateur accede a une **vue split** :

**Sidebar gauche (Timeline)** :
- Titre et description du module
- Objectifs pedagogiques (liste a puces)
- Sections collapsibles avec timeline verticale
- Chaque activite affichee avec : icone de type (livre pour lecon, crayon pour exercice, question pour QCM), titre, duree estimee, indicateur de statut (verrou, disponible, en cours, complete)
- Barre de progression par section
- Bouton "Continuer" pointant vers la prochaine activite non completee

**Zone principale (droite)** :
- Page d'accueil du module avec titre, description, objectifs, badges (nombre de sections, nombre d'activites, duree estimee)
- Bouton "Commencer le module" vers la premiere activite

#### 4.4.2. Page activite (`/{parcours}/apprendre/{moduleId}/{activityId}`)

L'activite s'affiche dans la zone principale avec la timeline toujours accessible a gauche.

**Pour une lecon** :
- Contenu MDX compile avec support LaTeX (KaTeX)
- Composants pedagogiques : Definition, Theoreme, Propriete, Exemple, Remarque, Attention
- Visualisations interactives : tableaux de variations/signes, graphes de fonctions (Recharts), videos YouTube
- Navigation bas de page : boutons Precedent / Suivant

**Pour un exercice** :
- Enonce du probleme (avec LaTeX)
- Solution detaillee (masquee initialement, a reveler)
- Methode generale (optionnelle)
- Indice (optionnel)
- Erreurs frequentes (optionnel)
- Possibilite de scanner un travail manuscrit pour analyse IA
- Bouton de marquage comme complete

**Pour un QCM (groupe de questions)** :
- Player interactif plein ecran
- Raccourcis clavier : 1-4 pour selectionner une option, Entree pour valider, Espace pour continuer
- Feedback immediat apres chaque reponse (vert = correct, rouge = incorrect)
- Explication pedagogique affichee apres validation
- Barre de progression des questions
- Ecran final : score, pourcentage, seuil de reussite a 70%
- Suivi du temps par question

### 4.5. Section "Reviser" (`/{parcours}/reviser`)

La section revision offre des **series d'exercices** thematiques organisees par trimestre (calendrier scolaire tunisien : T1 = sept-dec, T2 = jan-mars, T3 = avr-juin).

**En-tete de la page** :
- Statistiques : activites completees, score moyen aux QCM, exercices resolus

**Zone de filtrage** :
- Barre de recherche
- Filtre par module
- Filtre par difficulte
- Tri (priorite, difficulte, duree)

**Organisation par onglets** :
- "Tout" : toutes les series
- "T1", "T2", "T3" : filtrees par trimestre
- Section "Pour toi maintenant" : series du trimestre en cours

Chaque serie affiche :
- Icone de statut (nouvelle, en cours, completee)
- Titre et description
- Badges : trimestre, type (mono-module/cross-module/devoir-controle/devoir-synthese), difficulte (1-3), duree estimee
- Barre de progression
- Nombre d'activites

#### 4.5.1. Page serie (`/{parcours}/reviser/serie/{id}`)

Meme pattern split-view que les modules :
- Timeline a gauche avec les activites de la serie
- Zone principale avec carte d'accueil (titre, description, nombre d'activites, duree)
- Bouton "Commencer la serie"

#### 4.5.2. Mode navigation (`/{parcours}/reviser/serie/{id}/{activityId}`)

Navigation libre dans les activites de la serie, une par une, avec boutons precedent/suivant.

#### 4.5.3. Mode "Play" (`/{parcours}/reviser/serie/{id}/play`)

Mode interactif chronometre ou toutes les activites de la serie sont pre-compilees et jouees en sequence. L'utilisateur progresse activite par activite avec suivi du temps.

#### 4.5.4. Page resultats (`/{parcours}/reviser/serie/{id}/result`)

Apres la completion d'une serie :
- Message de felicitations avec icone de trophee
- Card d'encouragement
- Detail activite par activite : statut (reussi/a refaire/non tente), score pour les QCM
- Actions : "Refaire la serie", "Autres series"
- Pour les visiteurs non connectes : incitation a s'inscrire pour sauvegarder la progression

### 4.6. Analyse IA de travail manuscrit

L'application integre une fonctionnalite d'**analyse IA** via Claude Vision (API Anthropic) :

- L'eleve prend en photo ou uploade une image de son travail manuscrit pour un exercice
- L'image est compressee cote client (max 1024px, JPEG 80%)
- Envoyee au endpoint `/api/scan` avec authentification Bearer token
- Claude Vision analyse le travail par rapport a l'enonce de l'exercice
- Retourne : correctness (boolean), confiance (0-1), feedback en francais, suggestions d'amelioration
- Rate limiting : 10 requetes/minute/IP

### 4.7. Navigation et mise en page

**Desktop** :
- Sidebar collapsible a gauche (Cmd+B pour toggle)
  - Logo "Learning" avec badge du parcours
  - Lien Tableau de bord
  - Section "Apprendre" avec sous-menu des modules
  - Section "Reviser"
  - Toggle theme clair/sombre
  - Menu utilisateur (profil, parametres, deconnexion)
- Header en haut avec titre de page dynamique et barre de recherche (Cmd+K)
- Bandeau de verification d'email si necessaire
- Breadcrumbs contextuels

**Mobile** :
- Barre de navigation fixe en bas (Tableau de bord, Apprendre, Reviser) avec support safe-area pour les encoches
- Header specifique pour les activites avec toggle de timeline
- Timeline en sheet/drawer au lieu de sidebar
- Mise en page optimisee single-column

**PWA** :
- Manifest pour installation sur ecran d'accueil
- Page offline (`/offline`) en fallback quand pas de reseau
- Les pages deja visitees restent disponibles hors connexion

### 4.8. Palette de commandes

Un **command palette** (Cmd+K) permet la recherche rapide :
- Navigation vers Tableau de bord, Apprendre, Reviser
- Actions rapides : continuer l'apprentissage, demarrer un QCM
- Recherche de modules par nom

---

## 5. Modele de donnees metier

### 5.1. Architecture Atome-Molecule

Le contenu suit une architecture a deux niveaux :

**Atomes** (fichiers MDX individuels) = unites pedagogiques atomiques :
- Chaque atome est un fichier MDX independant avec frontmatter (type, titre, difficulte 0-3, duree, tags)
- Un atome peut etre reutilise dans plusieurs molecules (cours ET series)
- 3 types : lecon, exercice, QCM

**Molecules** (fichiers YAML) = assemblages structurels :
- **Cours** : sequence ordonnee de sections, chacune contenant des atomes et des groupes de QCM
- **Series** : liste plate d'atomes pour la revision, classee par trimestre et difficulte
- **Programmes** : structure de haut niveau listant les cours et series d'un parcours

### 5.2. Suivi de progression

La progression est tracee au niveau de chaque **atome** :
- `activityId` : identifiant de l'atome
- `status` : success | retry | skipped | pending
- `score/total` : pour les QCM (seuil de reussite = 70%)
- `attempts` : nombre de tentatives
- `contexts[]` : historique des contextes ou l'activite a ete faite (module X, serie Y, etc.)

**Utilisateurs connectes** : progression stockee dans Firestore (`users/{uid}/activityProgress/{activityId}`) avec synchronisation temps reel.

**Utilisateurs anonymes** : progression en localStorage (non synchronisee, perdue si le navigateur est reinitialise).

### 5.3. Profil utilisateur

Stocke dans Firestore (`users/{uid}`) :
- Parcours selectionne (slug + date de selection)
- Prenom (optionnel)
- Dates de creation/mise a jour

---

## 6. Types de series de revision

| Type | Description |
|------|-------------|
| `mono-module` | Revision d'un seul chapitre |
| `cross-module` | Revision transversale sur plusieurs chapitres |
| `devoir-controle` | Simulation d'un devoir de controle (evaluation partielle) |
| `devoir-synthese` | Simulation d'un devoir de synthese (evaluation complete du trimestre) |

Les series sont classees par **priorite** (les plus urgentes d'abord) et organisees par **trimestre** selon le calendrier scolaire tunisien.

---

## 7. Fonctionnalites techniques notables

| Fonctionnalite | Detail |
|----------------|--------|
| **Theme clair/sombre** | Toggle dans la sidebar, persiste via cookies (next-themes) |
| **Tokens de couleur semantiques** | Pas de couleurs Tailwind codees en dur (bg-primary, text-success) |
| **Rendu LaTeX** | KaTeX pour toutes les formules mathematiques ($...$ et $$...$$) |
| **Graphes de fonctions** | Composant `<Graph>` base sur Recharts |
| **Tableaux de variations** | Composant `<Variations>` pour les tableaux de signes/variations |
| **Videos YouTube** | Composant `<YouTube>` integre |
| **Explorateur TVI** | Outil interactif pour le theoreme des valeurs intermediaires |
| **SEO** | Sitemap dynamique, robots.txt, OpenGraph/Twitter cards |
| **Accessibilite** | Skip-link, aria-hidden sur icones, role="alert" sur erreurs, targets 44px |
| **Analytics** | Firebase Analytics pour evenements cles (serie_started/completed, qcm_completed, etc.) |
| **Gestion d'erreurs** | Error boundaries a plusieurs niveaux, logger structure, messages Firebase en francais |
| **React Query** | Cache cote serveur/client avec streaming, staleTime 1 min |

---

## 8. Limites actuelles et etat MVP

1. **Un seul parcours actif** : seul "1ere TC" est fonctionnel ; les 4 autres sont annonces mais pas encore remplis
2. **Pas de migration de progression** : la progression localStorage des utilisateurs anonymes n'est pas migree vers Firestore a la connexion
3. **Pas de profil enseignant** : l'application est exclusivement destinee aux eleves
4. **Pas de forum/communaute** : apprentissage individuel uniquement
5. **Pas de notifications push** : pas de rappels de revision
6. **Contenu statique** : les atomes MDX sont lus depuis le systeme de fichiers au build/runtime, pas depuis une base de donnees
7. **Programme 3eme Sciences** : quasi vide (1 seul module, 0 serie)
8. **Scan IA** : limite a 10 requetes/minute/IP, necessite authentification
