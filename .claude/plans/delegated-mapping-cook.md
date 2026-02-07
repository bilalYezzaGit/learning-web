# Plan — TrigoExplorer : composant interactif Mafs + Framer Motion

## Activite choisie

**`lesson-rapports-trigo.mdx`** — Rapports trigonometriques dans le triangle rectangle.

Actuellement 41 lignes de texte pur avec formules LaTeX, zero visuel. Le sujet est parfait pour combiner Mafs (geometrie du triangle, cercle unite, point deplacable) et Framer Motion (nombres animes, transitions, layout animations).

---

## Ce que le composant fait

Un `<TrigoExplorer />` autonome (zero props) avec deux zones :

**Canvas Mafs (gauche/haut)** :
- Triangle rectangle ABC (angle droit en A, hypotenuse = 1, approche cercle unite)
- Point violet deplacable sur l'arc du cercle unite (controle l'angle, contraint 10-80 deg)
- Cotes couleur : adjacent (bleu), oppose (orange), hypotenuse (violet)
- Arc d'angle au sommet B
- Labels des sommets (A, B, C) et des longueurs
- Projections pointillees sur les axes (visualise cos et sin)

**Panneau anime Framer Motion (droite/bas)** :
- 3 boutons presets (30, 45, 60 deg) → anime le triangle avec un spring
- 3 cartes ratio (sin, cos, tan) :
  - Valeur numerique animee (spring) quand l'angle change
  - Fraction coloree (numerateur/denominateur = cotes du triangle)
  - Toggle fraction/decimale avec AnimatePresence
  - Hover sur une carte → sides correspondants se highlight sur le canvas
- Barre cos²+sin²=1 (deux segments animes qui totalisent toujours 100%)
- Instruction en bas : "Glissez le point violet..."

**Responsive** : cote a cote desktop (lg:flex-row), empile sur mobile.

---

## Etapes d'implementation

### 1. Installer les packages

```bash
npm install mafs framer-motion
```

- `mafs` ~0.19.x : canvas math interactif SVG, TypeScript first, ~15 kB
- `framer-motion` ~11.x : animations, useSpring, AnimatePresence, animate()

**Risque React 19** : verifier la compatibilite peer deps. Si conflit, `--legacy-peer-deps`. Mafs utilise des hooks basiques (useState, useMemo) donc devrait fonctionner.

### 2. Ajouter le CSS Mafs dans `globals.css`

**Fichier** : `src/app/globals.css`

Ajouter `@import "mafs/core.css"` apres les imports existants (ligne 3). Ajouter des overrides dark mode pour les CSS vars Mafs dans le bloc `.dark` existant.

### 3. Creer `trigo-explorer.tsx`

**Fichier** : `src/content/extensions/trigo-explorer.tsx` (~350-400 lignes)

Structure interne :
```
'use client'
// Imports (mafs, framer-motion, react)
// Constantes (MIN/MAX angle, couleurs, presets)
// Types
// Utilitaires math purs
// AnimatedNumber — spring-interpolated number display
// AngleArc — parametric arc via Plot.Parametric
// RatioCard — motion.div avec hover scale, AnimatePresence fraction/decimal
// PythagoreanBar — barre animee cos²+sin²
// PresetButtons — boutons 30/45/60 avec motion.button
// TrigoExplorer (export) — assemble tout
```

**State** : useState pour viewMode (fraction/decimal), highlightedRatio (sin/cos/tan/null). L'angle est derive de `useMovablePoint` (position sur le cercle unite). Les valeurs trigo sont calculees avec useMemo.

**Animation preset** : `animate()` de framer-motion appelle `movablePoint.setPoint()` frame par frame pour animer le triangle vers l'angle cible.

**Highlight croise** : hover une carte → `setHighlightedRatio` → les Line.Segment du canvas changent weight/opacity.

### 4. Enregistrer dans `mdx-components.tsx`

**Fichier** : `src/components/content/mdx-components.tsx`

- Import : `import { TrigoExplorer as TrigoExplorerBase } from '@/content/extensions/trigo-explorer'`
- Ajouter au registre : `TrigoExplorer: TrigoExplorerBase`
- Mettre a jour le JSDoc

### 5. Reecrire `lesson-rapports-trigo.mdx`

**Fichier** : `content/atoms/lesson-rapports-trigo.mdx`

Transformation de 41 → ~90 lignes :
- Frontmatter : timeMinutes 10→15, ajout tag `trigonometrie`
- Intro + placement du `<TrigoExplorer />`
- 3 `<Definition>` (cos, sin, tan)
- 1 `<Remark>` (mnemotechnique SOH-CAH-TOA)
- 2 `<Property>` (relation fondamentale, lien tan=sin/cos)
- 1 `<Example>` (table des angles remarquables 30/45/60)
- 1 `<Attention>` (les rapports dependent de l'angle, pas de la taille)

### 6. Documenter

**`docs/CONTENT-CONVENTIONS.md`** : ajouter `<TrigoExplorer>` en section 5.3, mettre a jour le tableau des composants et le file tree en section 6.

**`.claude/skills/content/SKILL.md`** : ajouter `<TrigoExplorer>` au tableau quick reference.

---

## Fichiers a creer/modifier

| # | Fichier | Action |
|---|---------|--------|
| 1 | `package.json` | **Modifier** — npm install mafs framer-motion |
| 2 | `src/app/globals.css` | **Modifier** — import CSS Mafs + dark mode overrides |
| 3 | `src/content/extensions/trigo-explorer.tsx` | **Creer** — composant complet ~350-400 lignes |
| 4 | `src/components/content/mdx-components.tsx` | **Modifier** — enregistrer TrigoExplorer |
| 5 | `content/atoms/lesson-rapports-trigo.mdx` | **Reecrire** — lecon structuree avec composants |
| 6 | `docs/CONTENT-CONVENTIONS.md` | **Modifier** — documenter TrigoExplorer |
| 7 | `.claude/skills/content/SKILL.md` | **Modifier** — quick reference |
| 8 | `next.config.ts` | **Modifier** (si besoin) — transpilePackages: ['mafs'] |

---

## Verification

1. `npm install` — pas de conflit peer deps
2. `npm run build` — pas d'erreur TypeScript
3. `npm run dev` → naviguer vers la lecon trigo et verifier :
   - Canvas Mafs affiche le triangle avec axes et grille
   - Le point violet se deplace sur l'arc (contraint 10-80 deg)
   - Les cartes ratio s'animent (spring) quand l'angle change
   - Boutons 30/45/60 animent le triangle en douceur
   - Hover une carte → sides correspondants highlight
   - Toggle fraction/decimal fonctionne (AnimatePresence)
   - Barre cos²+sin²=1 toujours pleine
   - Dark mode fonctionne
   - Responsive : empile sur mobile
4. Verifier que les autres atomes ne sont pas casses
