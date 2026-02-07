#!/bin/bash
# Hook: Quality gate — vérifie build/lint avant git commit et git push
# Déclenché par PreToolUse sur Bash
# Exit 0 = laisser passer, Exit 2 = bloquer avec feedback

set -e

# Lire la commande depuis l'input JSON (stdin)
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | grep -o '"command":"[^"]*"' | head -1 | sed 's/"command":"//;s/"$//' 2>/dev/null || echo "")

# Si on n'arrive pas à extraire la commande, laisser passer
if [ -z "$COMMAND" ]; then
  exit 0
fi

# Ne vérifier que pour git commit et git push
case "$COMMAND" in
  *"git commit"*|*"git push"*)
    ;;
  *)
    exit 0
    ;;
esac

# Vérifier que node_modules existe
if [ ! -d "node_modules" ]; then
  echo "⚠️  node_modules manquant, skip quality gate"
  exit 0
fi

ERRORS=""

# ESLint check
echo "🔍 Quality gate: ESLint..."
if ! npx eslint src/ --quiet --max-warnings 0 2>/dev/null; then
  ERRORS="${ERRORS}\n❌ ESLint: des erreurs ont été détectées"
fi

# TypeScript check
echo "🔍 Quality gate: TypeScript..."
if ! npx tsc --noEmit 2>/dev/null; then
  ERRORS="${ERRORS}\n❌ TypeScript: des erreurs de type ont été détectées"
fi

# Si des erreurs, bloquer
if [ -n "$ERRORS" ]; then
  echo ""
  echo "🚫 Quality gate FAILED — commit/push bloqué"
  echo -e "$ERRORS"
  echo ""
  echo "Corrige les erreurs avant de committer."
  exit 2
fi

echo "✅ Quality gate passed"
exit 0
