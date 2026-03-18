# Ameliorations PDF — Suivi

> Audit du 2026-03-18 sur les 3 livrets nombre-derive.
> Traitement par lots, du plus impactant au moins urgent.

---

## Lot 1 — Credibilite de base (accents + mentions app)

| # | Tache | Fichier(s) | Statut |
|---|-------|-----------|--------|
| 1.1 | Ajouter les accents francais dans tout le contenu genere (e→e, a→a, etc.) | Pipeline : `mdx-to-typst.ts` + `livret-template.ts` | TODO |
| 1.2 | Mention "Solutions sur l'application" sous chaque exercice ou en pied de page | `livret-template.ts` (template exercice) | TODO |
| 1.3 | Mention "Verifiez vos reponses sur l'application" sous chaque QCM | `livret-template.ts` (template QCM) | TODO |
| 1.4 | Corriger le titre de couverture qui coupe les mots longs | `livret-template.ts` (cover page, taille police ou hyphenation) | TODO |
| 1.5 | Aligner les objectifs sur la couverture | `livret-template.ts` (liste objectifs) | TODO |

---

## Lot 2 — Experience eleve papier

| # | Tache | Fichier(s) | Statut |
|---|-------|-----------|--------|
| 2.1 | Espace de redaction sous chaque exercice (lignes ou espace calibre) | `livret-template.ts` (exercise-frame) | TODO |
| 2.2 | QCM : cercles plus grands et cochables au stylo | `livret-template.ts` (qcm-question) | TODO |
| 2.3 | Encadre Nom / Prenom / Classe sur la couverture | `livret-template.ts` (cover page) | TODO |
| 2.4 | Page(s) de notes a la fin du livret | `livret-template.ts` (apres le contenu) | TODO |

---

## Lot 3 — Guidage pedagogique

| # | Tache | Fichier(s) | Statut |
|---|-------|-----------|--------|
| 3.1 | Indicateur de difficulte visible (etoiles ou pastilles 0-3) | `livret-template.ts` + `generate-pdfs.ts` (passer difficulty) | TODO |
| 3.2 | Temps estime par exercice visible ("~10 min") | `livret-template.ts` + `generate-pdfs.ts` (passer timeMinutes) | TODO |
| 3.3 | Encadres "Methode" avant chaque section du Livret 2 | Contenu (atomes lesson ou nouveau type) | TODO |
| 3.4 | Consignes generales Livret 2 (duree, bareme indicatif, calculatrice) | `livret-template.ts` (conditionnel sur type examen) ou contenu | TODO |

---

## Lot 4 — Polish typographique

| # | Tache | Fichier(s) | Statut |
|---|-------|-----------|--------|
| 4.1 | Reduire les espaces blancs excessifs apres exercices/QCM | `livret-template.ts` — remplacé par lignes de rédaction (Lot 2) | FAIT |
| 4.2 | Sommaire : ne pas gaspiller une page entiere si < 10 lignes | `livret-template.ts` — `#pagebreak(weak: true)` | FAIT |
| 4.3 | Numerotation coherente exercices + QCM | Gardé tel quel — style tunisien OK (exos numérotés, QCM séparés) | N/A |
| 4.4 | Footer : remplacer "learning.app" par le vrai domaine | `livret-template.ts` → aylansolutions.com | FAIT |
| 4.5 | Titre exercice : eviter la compression par le QR code quand titre long | `livret-template.ts` — métadonnées sur ligne séparée | FAIT |
| 4.6 | Rendu LaTeX dans les titres d'exercice (ex: \|x^2-1\| mal affiche) | `generate-pdfs.ts` — escapeTypstTitle() convertit $...$ → #mi("...") | FAIT |
| 4.7 | Accent manquant "activites" sur la couverture | `livret-template.ts` → "activités" | FAIT |

---

## Lot futur — Directive :::workspace (espace de réponse custom)

| # | Tache | Fichier(s) | Statut |
|---|-------|-----------|--------|
| F.1 | Créer la directive `:::workspace` pour espace de réponse custom (repère, grille, courbe pré-tracée) | `compile-mdx.ts` + `mdx-to-typst.ts` + CONTENT-CONVENTIONS.md | TODO |
| F.2 | Comportement PDF : afficher le Typst du workspace dans l'espace de réponse | `livret-template.ts` | TODO |
| F.3 | Comportement HTML : afficher le workspace dans l'exercice (avant la photo pour correction IA) | `compile-mdx.ts` | TODO |

> Le champ `lines` couvre 90% des cas. La directive `:::workspace` sera ajoutée quand un exercice réel en aura besoin (ex: "tracer la tangente sur ce repère").

---

## Lot 5 — Contenu complementaire

| # | Tache | Fichier(s) | Statut |
|---|-------|-----------|--------|
| 5.1 | Graphes pour exercices geometrie Livret 3 (tangente commune, perp, exterieur) | Atomes MDX (ex-der-exploration-tangente-*.mdx) | TODO |
| 5.2 | Police titre couverture plus moderne (optionnel, style editorial) | `livret-template.ts` | TODO |
| 5.3 | Couverture plus soignee (couleur, decoration, branding) | `livret-template.ts` | TODO |

---

## Notes

- Les lots sont independants et peuvent etre traites dans l'ordre
- Le Lot 1 est le plus critique : sans accents et sans mention de l'app, le livret n'est pas publiable
- Le Lot 2 transforme le PDF d'un "document" en un vrai "livret de travail"
- Les Lots 3-5 sont du polish progressif
- Chaque lot necessite principalement des modifications du template Typst (`livret-template.ts`) et/ou du generateur (`generate-pdfs.ts`), pas du contenu
