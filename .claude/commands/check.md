Verification complete des rules du projet : lance les tests automatises puis les tests manuels.

---

## Step 1 — Tests automatises

Lance la commande suivante via Bash :

```bash
node scripts/specs/runner.mjs
```

Analyse le resultat :
- Si tout passe → affiche "All automated rules pass" et passe au Step 2
- Si des tests echouent → liste les echecs avec details et propose des corrections

## Step 2 — Tests manuels

Lis les fichiers `docs/specs/rules/*.md` et identifie toutes les rules marquees `[manual]`.

Pour chaque rule `[manual]` :
1. Execute la procedure de test decrite en `>` sous la rule
2. Utilise Read, Grep, Glob (lecture seule) pour verifier
3. Note le resultat : PASS ou FAIL avec detail

## Step 3 — Resume

Affiche un resume compact :

```
Automated: X/Y pass
Manual:    X/Y pass
Total:     X/Y pass

Failures:
- [ID] description — detail du probleme
```

Si des failures existent, propose des corrections concretes.
