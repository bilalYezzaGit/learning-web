/**
 * Maps Firebase Auth error codes to user-friendly French messages.
 */
const FIREBASE_ERROR_MESSAGES: Record<string, string> = {
  // Login errors
  'auth/user-not-found': 'Aucun compte ne correspond a cet email.',
  'auth/wrong-password': 'Mot de passe incorrect.',
  'auth/invalid-credential': 'Email ou mot de passe incorrect.',
  'auth/invalid-email': 'Adresse email invalide.',
  'auth/user-disabled': 'Ce compte a ete desactive.',
  'auth/too-many-requests': 'Trop de tentatives. Reessayez dans quelques minutes.',

  // Signup errors
  'auth/email-already-in-use': 'Un compte existe deja avec cet email.',
  'auth/weak-password': 'Le mot de passe est trop faible. Minimum 8 caracteres.',
  'auth/operation-not-allowed': 'L\'inscription par email est desactivee.',

  // Network errors
  'auth/network-request-failed': 'Erreur reseau. Verifiez votre connexion internet.',
  'auth/internal-error': 'Erreur interne. Reessayez plus tard.',
  'auth/popup-closed-by-user': 'La fenetre de connexion a ete fermee.',
}

/**
 * Get a user-friendly French error message from a Firebase error.
 * Falls back to the original message if no mapping exists.
 */
export function getFirebaseErrorMessage(error: unknown): string {
  if (error instanceof Error) {
    // Firebase errors have the code in the message: "Firebase: Error (auth/user-not-found)."
    const codeMatch = error.message.match(/\(([^)]+)\)/)
    const code = codeMatch?.[1]

    if (code && code in FIREBASE_ERROR_MESSAGES) {
      return FIREBASE_ERROR_MESSAGES[code]!
    }

    return error.message
  }

  return 'Une erreur inattendue est survenue.'
}
