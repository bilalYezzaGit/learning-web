/**
 * Firebase Configuration
 *
 * These values are public client-side identifiers (not secrets).
 * Security is enforced via Firebase Security Rules, not by hiding these keys.
 */

const firebaseConfig = {
  apiKey: 'AIzaSyAaVBSA21N2rFbiL2IAVz4StVO-YMhwZdY',
  authDomain: 'learning-os-platform.firebaseapp.com',
  projectId: 'learning-os-platform',
  storageBucket: 'learning-os-platform.firebasestorage.app',
  messagingSenderId: '919055938534',
  appId: '1:919055938534:web:bee55a90c0783c36b95c27',
  measurementId: 'G-R50QDXT405',
}

/**
 * Get Firebase configuration
 */
export function getFirebaseConfig() {
  return firebaseConfig
}


