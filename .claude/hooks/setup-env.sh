#!/bin/bash
# Creates .env.local with Firebase config if it doesn't exist
# These are NEXT_PUBLIC_ variables (client-side, not secrets)

ENV_FILE="$CLAUDE_PROJECT_DIR/.env.local"

if [ ! -f "$ENV_FILE" ]; then
  cat > "$ENV_FILE" << 'EOF'
# Firebase Configuration
NEXT_PUBLIC_FIREBASE_API_KEY=AIzaSyAaVBSA21N2rFbiL2IAVz4StVO-YMhwZdY
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=learning-os-platform.firebaseapp.com
NEXT_PUBLIC_FIREBASE_PROJECT_ID=learning-os-platform
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=learning-os-platform.firebasestorage.app
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=919055938534
NEXT_PUBLIC_FIREBASE_APP_ID=1:919055938534:web:bee55a90c0783c36b95c27
NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID=G-R50QDXT405
EOF
  echo "Created .env.local with Firebase config"
else
  echo ".env.local already exists, skipping"
fi
