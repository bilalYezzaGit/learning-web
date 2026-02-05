Audit du code Next.js/React par rapport aux conventions du projet.

**Argument**: $ARGUMENTS

## Modes d'utilisation

### Mode 1: Audit d'un fichier/dossier specifique
Si argument fourni (ex: `/audit src/components/ui/button.tsx`), audite UNIQUEMENT ce fichier/dossier.
- Affiche les resultats directement en console
- Rapide pour verifier avant commit

### Mode 2: Audit complet (sans argument)
Si aucun argument (`/audit`), audite tout `src/`.
- Genere rapport dans `AUDIT_REPORT.md`

---

## Regles a verifier

### 1. Architecture (CRITIQUE)

#### 1.1 Server vs Client Components
```bash
# Detection: hooks React dans fichiers sans "use client"
grep -rn "useState\|useEffect\|useContext" src/app/ --include="*.tsx" | \
  xargs -I {} sh -c 'grep -L "use client" {}'
```

**Regle**: Tout fichier avec hooks React DOIT avoir `'use client'` en premiere ligne.

#### 1.2 Store access dans Server Components
```bash
# Detection: import de store dans Server Components
grep -rn "useContentStore\|useAuthStore\|useProgressStore" src/app/ --include="page.tsx"
```

**Regle**: Les pages Server Component ne doivent pas importer de stores directement.

#### 1.3 Services client-side only
```bash
# Detection: import Firebase direct dans components (hors services/)
grep -rn "from 'firebase" src/components/ --include="*.tsx"
grep -rn "from '@firebase" src/components/ --include="*.tsx"
```

**Regle**: Firebase uniquement dans `lib/services/`, jamais dans components.

### 2. TypeScript (HAUTE)

#### 2.1 any explicite
```bash
grep -rn ": any" src/ --include="*.ts" --include="*.tsx"
grep -rn "as any" src/ --include="*.ts" --include="*.tsx"
```

**Regle**: Pas de `any`. Utiliser `unknown` + type guards si necessaire.

#### 2.2 Non-null assertion excessive
```bash
grep -rn "\!\\." src/ --include="*.tsx" | grep -v "node_modules"
```

**Regle**: Preferer optional chaining (`?.`) ou null checks explicites.

### 3. Composants (HAUTE)

#### 3.1 Props non typees
```bash
grep -rn "props:" src/components/ --include="*.tsx" | grep -v "Props"
```

**Regle**: Toujours definir interface `XxxProps`.

#### 3.2 className hardcode
```bash
grep -rn 'className="[^"]*"' src/components/ --include="*.tsx" | grep -v "cn("
```

**Regle**: Utiliser `cn()` pour merger classes (permet override via props).

### 4. Conventions (MOYENNE)

#### 4.1 Ordre des imports
Verifier manuellement:
1. `react`, `next/*`
2. Libs externes
3. `@/components/*`
4. `@/lib/*`
5. `@/types/*`
6. Types (`import type`)

#### 4.2 Console.log oublies
```bash
grep -rn "console.log\|console.error\|console.warn" src/ --include="*.tsx" --include="*.ts"
```

### 5. Performance (MOYENNE)

#### 5.1 Images non optimisees
```bash
grep -rn "<img " src/ --include="*.tsx"
```

**Regle**: Utiliser `next/image` pour optimisation automatique.

### 6. Accessibilite (BASSE)

#### 6.1 Alt manquants
```bash
grep -rn "<Image\|<img" src/ --include="*.tsx" | grep -v "alt="
```

---

## Instructions d'execution

### Phase 1: Analyse automatique

```bash
npm run type-check 2>&1 | tee /tmp/ts-errors.txt
npm run lint 2>&1 | tee /tmp/lint-errors.txt
npm run build 2>&1 | tee /tmp/build-errors.txt
```

### Phase 2: Grep des violations

Executer chaque commande grep de la section "Regles a verifier".

### Phase 3: Generation du rapport

**Format** (`AUDIT_REPORT.md` si audit complet):

```markdown
# Audit Code Next.js

**Date**: [DATE]
**Scope**: [fichier/dossier ou "complet"]

---

## Resume

| Severite | Nombre |
|----------|--------|
| Critique | X |
| Haute | X |
| Moyenne | X |
| Basse | X |

**Score**: X% (100 - critique*10 - haute*5 - moyenne*2 - basse*1)

---

## Violations Critiques

### [fichier:ligne]
- **Regle**: [nom]
- **Code**: `[extrait]`
- **Fix**: [suggestion]

---

## Actions Recommandees

1. **P1**: [action]
2. **P2**: [action]
```

---

## Severite

| Niveau | Description |
|--------|-------------|
| **Critique** | Casse le build ou viole l'architecture |
| **Haute** | Bug potentiel ou mauvaise pratique TypeScript |
| **Moyenne** | Convention non respectee |
| **Basse** | Amelioration possible |
