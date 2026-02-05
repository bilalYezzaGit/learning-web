#!/bin/bash
# Hook PreCompact: Sauvegarde l'etat du chantier avant compaction

CHANTIERS_DIR="$CLAUDE_PROJECT_DIR/chantiers"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M")

# Trouver le chantier actif
ACTIVE=""
if [ -d "$CHANTIERS_DIR" ]; then
  for dir in "$CHANTIERS_DIR"/*/; do
    if [ -d "$dir" ] && [ "$(basename "$dir")" != "archive" ]; then
      ACTIVE="$dir"
      break
    fi
  done
fi

if [ -z "$ACTIVE" ] || [ ! -d "$ACTIVE" ]; then
  exit 0
fi

NAME=$(basename "$ACTIVE")
CONTEXTE_FILE="$ACTIVE/CONTEXTE.md"

# Verifier que le fichier CONTEXTE.md existe
if [ ! -f "$CONTEXTE_FILE" ]; then
  exit 0
fi

# Ajouter un marqueur de compaction dans la section Findings si elle existe
if grep -q "## Findings" "$CONTEXTE_FILE"; then
  # La section existe, ajouter une note
  sed -i.bak "/## Findings/a\\
\\
### Auto-save ($TIMESTAMP)\\
> Context compaction triggered. Session state preserved in this file.\\
" "$CONTEXTE_FILE"
  rm -f "$CONTEXTE_FILE.bak"
fi

# Message de confirmation
cat << EOFMSG
{
  "systemMessage": "Chantier '$NAME' state noted before compaction. Use /chantier resume $NAME after restart."
}
EOFMSG
