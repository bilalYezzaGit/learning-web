# Backend &amp; Firebase

> Service pattern, Firebase encapsulation, security practices.

- BAK-001 [auto] No Firebase SDK imports outside src/lib/ directory
- BAK-002 [auto] No hardcoded credentials or secrets in source files (.env values only)
- BAK-003 [manual] Services in src/lib/services/ encapsulate all Firebase calls
  > Verify no direct Firestore/Auth calls exist outside service files
- BAK-004 [manual] Firestore security rules deny by default
  > Check firestore.rules or Firebase console
