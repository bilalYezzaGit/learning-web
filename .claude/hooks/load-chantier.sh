#!/bin/bash
# Hook SessionStart: Rappel du chantier actif au demarrage

CHANTIERS_DIR="$CLAUDE_PROJECT_DIR/chantiers"

# Trouver le chantier actif (premier dossier non-archive)
ACTIVE=""
if [ -d "$CHANTIERS_DIR" ]; then
  for dir in "$CHANTIERS_DIR"/*/; do
    if [ -d "$dir" ] && [ "$(basename "$dir")" != "archive" ]; then
      ACTIVE="$dir"
      break
    fi
  done
fi

if [ -n "$ACTIVE" ] && [ -d "$ACTIVE" ]; then
  NAME=$(basename "$ACTIVE")

  # Lire le statut du plan si disponible
  PLAN_FILE="$ACTIVE/PLAN.md"
  PENDING_COUNT=0
  DONE_COUNT=0

  if [ -f "$PLAN_FILE" ]; then
    PENDING_COUNT=$(grep -c '\[ \]' "$PLAN_FILE" 2>/dev/null || echo "0")
    DONE_COUNT=$(grep -c '\[x\]' "$PLAN_FILE" 2>/dev/null || echo "0")
  fi

  # Construire le message de contexte
  cat << EOFMSG
{
  "additionalContext": "CHANTIER ACTIF: $NAME\n- Taches restantes: $PENDING_COUNT\n- Taches terminees: $DONE_COUNT\n\nUtilise /chantier resume $NAME pour charger le contexte complet."
}
EOFMSG
else
  cat << EOFMSG
{
  "additionalContext": "Aucun chantier actif. Utilise /chantier new <nom> pour en creer un, ou /chantier list pour voir les archives."
}
EOFMSG
fi
