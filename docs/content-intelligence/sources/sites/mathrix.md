# Mathrix

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://mathrix.fr |
| Type | site-fr |
| Niveaux | 5eme-Term |
| Langues | fr |
| Acces | freemium |
| Qualite | ★★★☆☆ (estimation — site inaccessible au scan) |
| Derniere verification | 2026-02-07 |

## Description

Mathrix est une plateforme educative francaise fondee par Julien et Filipi, proposant des cours de maths en video du college (5eme) au lycee (Terminale). Le site combine cours video courts (~10 min), exercices corriges avec 3 niveaux d'indices, fiches de revision, et jeux de calcul mental. Le modele est freemium : videos et exercices de base gratuits, abonnement Premium (8.33 EUR/mois annuel ou 12.90 EUR/mois) pour l'acces complet aux exercices, interrogations ecrites, et conferences live. Mathrix a aussi une chaine YouTube avec de nombreuses videos gratuites.

**ATTENTION : Le site a un certificat TLS casse (ERR_TLS_CERT_ALTNAME_INVALID) rendant toute navigation et extraction impossible au moment du scan. Cette fiche est basee sur des sources secondaires (articles de presse, recherches web).**

## Instructions LLM

### Navigation

- URL de base : `https://mathrix.fr` (actuellement inaccessible — TLS broken)
- Cours par niveau : `https://mathrix.fr/fr/{niveau}/maths` (ex: `/fr/seconde/maths`, `/fr/terminale-s/maths`)
- Cours par chapitre : `https://mathrix.fr/maths/{chapitre-slug}/{contenu-slug}-{id}`
- Cycle 4 : `https://mathrix.fr/maths-fr/cycle-4-{classe}` (ex: `cycle-4-4eme`)
- YouTube : chaine associee avec videos gratuites
- Sitemap : non verifie (site inaccessible)

### Extraction de contenu

- Format principal : Video (cours) + HTML (exercices)
- LaTeX : probable (non confirme)
- Methode d'extraction : **impossible actuellement** — certificat TLS casse
- Contenu protege : modele freemium, exercices Premium payants

### Patterns d'URL (reconstitues depuis les recherches)

- Cours video trigonometrie : `mathrix.fr/maths/reperage-sur-le-cercle-trigonometrique/cercle-trigonometrique-cours-video-323`
- Cours video produit scalaire : `mathrix.fr/maths/produit-scalaire-dans-le-plan/produit-scalaire-et-cosinus-cours-video-738`
- Cours video derivation : `mathrix.fr/maths/derivation/derivation-cours-les-etapes-pour-reussir-482`
- Cours video fonctions : `mathrix.fr/maths/fonctions-de-reference/fonction-carree-definition-cours-video-507`
- Cours video limites : `mathrix.fr/maths/limites-de-fonctions/limites-de-fonctions-963/1000`
- Pattern general : `mathrix.fr/maths/{chapitre-slug}/{titre-slug}-{id}`

### Limites et precautions

- **Certificat TLS casse** : le site est inaccessible via HTTPS (ERR_TLS_CERT_ALTNAME_INVALID sur mathrix.fr et www.mathrix.fr)
- Modele freemium : une partie des exercices n'est accessible qu'avec un abonnement payant
- Le contenu video est principalement sur YouTube (gratuit)
- Pas de contenu specifique au curriculum tunisien (programme francais)
- L'extraction programmatique est impossible tant que le certificat n'est pas repare

## Ressources par module

**Note : les ressources ci-dessous sont deduites des resultats de recherche. Les URLs sont non-verifiees car le site est inaccessible.**

### trigo — Rapports trigonometriques

#### Cours video
- [video] https://mathrix.fr/maths/reperage-sur-le-cercle-trigonometrique/cercle-trigonometrique-cours-video-323
  Cercle trigonometrique : reperage, radians, sin/cos. Duree: ~10min. Format: video.

### vt — Vecteurs et translations

#### Cours video
- [video] (URL non confirmee — chapitre vecteurs disponible au niveau Seconde)
  Cours video sur les vecteurs : definition, egalite, operations. Format: video.

### der — Derivation

#### Cours video
- [video] https://mathrix.fr/maths/derivation/derivation-cours-les-etapes-pour-reussir-482
  Derivation : proprietes, somme, produit de derivees. Format: video.

### fn — Fonctions (generalites)

#### Cours video
- [video] https://mathrix.fr/maths/fonctions-de-reference/fonction-carree-definition-cours-video-507
  Fonction carree : definition, proprietes. Format: video.
- [video] https://mathrix.fr/maths/limites-de-fonctions/limites-de-fonctions-963/1000
  Limites de fonctions et asymptotes horizontales. Format: video.

## Modules non-mappes

Chapitres Mathrix non mappes a notre curriculum (d'apres les resultats de recherche) :
- **Produit scalaire** : `mathrix.fr/maths/produit-scalaire-dans-le-plan/...`
- **Nombres complexes** (Terminale)
- **Integrales** (Terminale)
- **Suites** (Terminale)

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial (partiel) | Site inaccessible (TLS cert broken). Fiche basee sur sources secondaires uniquement. A re-scanner quand le certificat sera repare. |
