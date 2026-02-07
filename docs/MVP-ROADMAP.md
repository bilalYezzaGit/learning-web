# MVP Roadmap — Parcours 1ere TC

> Objectif : publier le parcours 1ere annee Tronc Commun, complet (15 modules),
> avec un contenu riche, interactif et attractif. Acces libre sans inscription.

## Vision MVP

- **Public** : Eleves 1ere TC (lycee tunisien)
- **Acces** : 100% libre — l'eleve parcourt cours, exercices, series sans compte
- **Auth** : Optionnelle — debloque uniquement le suivi de progression
- **Perimetre** : 15 modules du programme 1ere TC, bien faits et riches

---

## Chantier 1 — Fiabiliser le systeme de contenu

> Garantir que le contenu est isole, valide et evolutif avant d'enrichir.

### 1.1 Supprimer le ContentRenderer legacy
- [ ] Retirer `src/content/renderer.tsx` et ses usages
- [ ] Migrer `activity-content.tsx` vers le pipeline MDX unique
- [ ] Un seul chemin : `content/` → `src/lib/content.ts` → pages

### 1.2 Validation Zod du contenu
- [ ] Schemas Zod pour les atomes (frontmatter MDX)
- [ ] Schemas Zod pour les molecules (YAML : cours, series, programmes)
- [ ] Validation des references : chaque step pointe vers un atome existant
- [ ] Erreurs claires au build, pas de crash silencieux en prod

### 1.3 Refactorer le parsing QCM (approche hybride)
- [ ] Garder `<Question>`, `<Option>`, `<Explanation>` comme vrais composants MDX (contenu riche)
- [ ] Deplacer uniquement `correctOption` dans le frontmatter (seule donnee structuree)
- [ ] Compiler le MDX au lieu de parser par regex — plein pouvoir MDX dans questions/options/explications
- [ ] Migrer les 67 QCM existants (ajouter `correctOption` au frontmatter)
- [ ] Supprimer le parsing regex (`parseQcmComponents`, `parseQcmLegacy`)

---

## Chantier 2 — Enrichir les contenus (15 modules)

> Le gros du travail : rendre chaque module attractif et pedagogiquement riche.

### 2.1 Audit du contenu existant
- [ ] Inventaire par module : nombre de lecons/exercices/QCM, qualite actuelle
- [ ] Identifier les modules les plus pauvres en contenu
- [ ] Definir un standard minimum par module (ex: X lecons, Y exercices, Z QCM)

### 2.2 Enrichir les explications et activites
- [ ] Exploiter les composants interactifs : `<Graph>`, `<Variations>`, `<TviExplorer>`
- [ ] Ajouter des simulations visuelles la ou c'est pertinent
- [ ] Explications QCM riches (pas juste du texte — schemas, graphes, etapes visuelles)
- [ ] Exercices avec feedback visuel

### 2.3 Creer les contenus manquants
- [ ] (A definir apres l'audit module par module)

---

## Chantier 3 — (A discuter)

> Points ouverts a couvrir ensemble :
> - Design / UI : le look actuel convient ?
> - Deploiement : Vercel ? Domaine ?
> - SEO / Landing page : comment les eleves trouvent le site ?
> - Performance / Mobile : experience sur telephone ?
> - Series (revision) : etat actuel, enrichir ?

---

## Ordre de priorite

| Priorite | Chantier | Raison |
|----------|----------|--------|
| 1 | 1 — Fiabiliser le systeme | Prerequis avant de toucher au contenu en masse |
| 2 | 2 — Enrichir les contenus | Le coeur de la MVP |
| 3 | 3 — A definir | Selon discussion |
