#!/bin/bash
# Hook: Lint TypeScript/ESLint après modification de fichiers .ts/.tsx
# Déclenché après Edit/Write sur src/**/*.{ts,tsx}

set -e

# Vérifier que node_modules existe
if [ ! -d "node_modules" ]; then
  echo "⚠️  node_modules manquant, skip lint"
  exit 0
fi

# Exécuter ESLint sur le fichier modifié si disponible
if [ -n "$CLAUDE_FILE_PATH" ]; then
  echo "🔍 Lint: $CLAUDE_FILE_PATH"
  npx eslint "$CLAUDE_FILE_PATH" --fix --quiet 2>/dev/null || true
fi

# TypeScript check (rapide, incrémental)
echo "🔍 Type check..."
npx tsc --noEmit --incremental 2>&1 | head -20 || true

echo "✅ Lint OK"
