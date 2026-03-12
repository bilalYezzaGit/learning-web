# Action : Creer des atomes depuis un planning

## Regles

- Le champ `contenu` du planning est la **specification** — le suivre a la lettre
- Les `praxeologies` du planning determinent l'alignement pedagogique ; consulter la KB pour la profondeur
- `difficulte` et `timeMinutes` du planning s'imposent au frontmatter
- Les slugs du planning deviennent les noms de fichiers exacts (`{slug}.mdx`)
- Un atome present dans cours ET serie est genere **une seule fois**
- Tags du frontmatter : derives du topic (extrait du slug) + themes des praxeologies

## Pre-requis

3 verifications avant de lancer le pipeline :

1. **Planning(s) existent** :
   ```
   Glob: content/{programme}/{module}/_molecules/*/_planning.yaml
   ```

2. **Status valide** : pour chaque planning, lire le YAML et verifier le champ `status` :
   - `validated` → continuer
   - `draft` → **stop**, demander a l'utilisateur de valider d'abord
   - `generated` → avertir que le contenu a deja ete genere, demander confirmation avant de regenerer

3. **KB source existe** : verifier que `content/{programme}/{module}/_kb.md` est present

## Pipeline

### Etape 1 — Charger le planning

Read les plannings YAML `content/{programme}/{module}/_molecules/*/_planning.yaml`. Pour chaque planning, extraire la liste d'atomes. Fusionner en une liste plate unique (dedupliques par slug). Un meme atome peut apparaitre dans le cours et dans une serie — ne le compter qu'une fois.

### Etape 2 — Detecter la progression

Glob les `.mdx` existants dans le module :

```
Glob: content/{programme}/{module}/*.mdx
```

Comparer avec les slugs du planning → 3 listes :
- **done** : slugs du planning deja presents en `.mdx`
- **todo** : slugs du planning sans `.mdx` correspondant
- **extra** : fichiers `.mdx` qui ne sont pas dans le planning

Afficher un resume :
```
Progression : 5/18 generes, 13 restants, 2 extras (hors planning)
```

### Etape 3 — Determiner le scope

3 modes selon le prompt utilisateur :

- **Tout** (defaut) : tous les `todo`
- **Section** ("section Formules de derivation") : filtrer par section du cours
- **Sous-ensemble** ("seulement les exercices", "la serie 2") : filtrer par type ou molecule

Montrer la liste filtree et confirmer avec l'utilisateur avant de generer.

### Etape 4 — Charger les references

4 reads en parallele :

```
Read: .claude/skills/content/references/templates.md
Read: .claude/skills/content/references/typst-snippets.md
Read: docs/CONTENT-CONVENTIONS.md
Read: content/{programme}/{module}/_kb.md
```

### Etape 5 — Generer les atomes

Pour chaque atome `todo` (ordre : lecons d'abord, puis exercices, puis QCM, par section) :

1. Extraire du planning : slug, type, title, praxeologies, contenu, difficulte, timeMinutes, category
2. Generer le frontmatter :
   - `type`, `title`, `difficulty`, `timeMinutes`, `tags`, `category` (si exercice)
3. Generer le body selon le template du type et le `contenu` comme spec
4. Ecrire `content/{programme}/{module}/{slug}.mdx`
5. Reporter la progression : `[5/18] lesson-der-formules — done`

### Etape 6 — Assembler les molecules

Apres tous les atomes generes :

- **Livrets** → `_molecules/{slug}/molecule.yaml` avec `kind: livret`, sections/steps, quiz blocks (2-5 QCM par groupe)

Verifier que tous les atom IDs references dans les molecules existent en tant que fichiers `.mdx`.

### Etape 7 — Mettre a jour le planning

- Si **tous** les atomes du planning sont generes → `status: generated`
- Sinon → ne pas changer le status, ajouter un commentaire `# Progress: X/Y`

## Checklist

- [ ] Nommage `{type}-{topic}-{slug}.mdx` respecte
- [ ] Frontmatter complet (type, title, difficulty, timeMinutes, tags, category si exercise)
- [ ] Exercises : `:::enonce` + `:::solution`
- [ ] QCM : `:::question` + 2-5 `:::option` (une `{correct}`) + `:::explanation`
- [ ] Headings commencent a `###`
- [ ] LaTeX : `$...$` inline, `$$...$$` bloc
- [ ] Typst blocks incluent leurs imports
- [ ] Molecules YAML ne referencent que des atomes existants
- [ ] Quiz groups : 2-5 QCM
- [ ] Chaque atome respecte fidelement le `contenu` du planning
