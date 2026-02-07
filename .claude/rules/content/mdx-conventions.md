---
paths:
  - "content/**"
---

# Conventions MDX/YAML

Source de verite complete : `docs/CONTENT-CONVENTIONS.md`

## Regles essentielles

- **ID** : `{type}-{topic}-{slug}.mdx` avec topic du vocabulaire controle
- **Frontmatter** : type, title, difficulty (0-3), timeMinutes, tags obligatoires
- **category** : obligatoire ssi `type: exercise` (application, approfondissement, synthese, probleme)
- **Headings** : commencent a `###` (jamais `#` ou `##`)
- **LaTeX** : `$...$` inline, `$$...$$` bloc — jamais de HTML math

## Composants par type

- **Lesson** : Definition, Theorem, Property, Example, Remark, Attention, Graph, Variations, YouTube
- **Exercise** : Enonce (obligatoire), Solution (obligatoire), Methode, Hint, Erreurs
- **QCM** : Question (1), Option (2-5, une `correct`), Explanation (obligatoire)

## Molecules

- **Cours** : YAML dans `content/molecules/cours/` avec programme, trimester, order, sections[].steps[]
- **Serie** : YAML dans `content/molecules/series/` avec difficulty, tags, steps[] (min 2)
- **Programme** : YAML dans `content/molecules/programmes/` avec levelSlug, sectionSlug, cours[], series[]

## Avant de creer/modifier du contenu

1. Lire `docs/CONTENT-CONVENTIONS.md` (source de verite)
2. Lire les templates dans `.claude/skills/content/references/templates.md`
3. Valider avec la checklist §9 des conventions
