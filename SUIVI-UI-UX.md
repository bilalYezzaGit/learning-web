# SUIVI — UI/UX 100% Sprint

**Branche** : `feat/ui-ux-100-percent`
**Objectif** : Atteindre 100% sur les scores UI et UX de l'audit MVP
**Date** : 2026-02-09

---

## UI — De 78% vers 100%

### P0 — Bugs critiques
- [ ] **UI-01** Fix PWA banner qui ne se ferme pas (close button broken)
- [ ] **UI-02** Fix score moyen QCM 5538% (cap à 100%, Math.min)

### P1 — Fonctionnalités manquantes
- [ ] **UI-03** Rendre le dark mode toggle visible (bouton dans sidebar footer ou header)
- [ ] **UI-04** Ajouter print styles (@media print dans globals.css)
- [ ] **UI-05** Augmenter touch targets mobile (buttons min h-10 = 40px sur mobile)
- [ ] **UI-06** Créer composant EmptyState générique réutilisable

### P2 — Polish
- [ ] **UI-07** Ajouter bottom navigation bar mobile (3 items: Dashboard, Apprendre, Réviser)
- [ ] **UI-08** Remplacer transition-all par transitions spécifiques sur Button
- [ ] **UI-09** Ajouter priority sur hero images (next/image LCP)

---

## UX — De 62% vers 100%

### P0 — Flows critiques manquants
- [ ] **UX-01** Implémenter reset password (page + Firebase sendPasswordResetEmail)
- [ ] **UX-02** Sécuriser /admin/* (middleware auth check)
- [ ] **UX-03** Ajouter rate limiting + auth sur /api/scan
- [ ] **UX-04** Cacher bouton "Google (bientôt)" sur login/signup

### P1 — Flows importants
- [ ] **UX-05** Ajouter breadcrumbs sur pages module et activité
- [ ] **UX-06** Persister état série play (currentIndex dans localStorage)
- [ ] **UX-07** Ajouter confirmation dialog avant reset progress
- [ ] **UX-08** Ajouter email verification post-signup (banner reminder)
- [ ] **UX-09** Mini-onboarding (tooltip/banner first visit)

### P2 — Améliorations UX
- [ ] **UX-10** Ajouter indicateur progression sur module cards (page Apprendre)
- [ ] **UX-11** Ajouter sorting sur page Réviser (difficulté, durée)
- [ ] **UX-12** Détail score par activité sur page résultat série
- [ ] **UX-13** Sauvegarde progression anonyme (localStorage fallback)
- [ ] **UX-14** Ajouter search globale dans sidebar (Cmd+K)

### P3 — Polish UX
- [ ] **UX-15** Ajouter CSP + security headers dans next.config.ts
- [ ] **UX-16** Error tracking setup (basic console + structured logging)

---

## Itérations

### Itération 1 — [EN COURS]
- Focus: P0 UI + P0 UX (bugs + flows critiques)
- Cibles: UI-01, UI-02, UX-01, UX-02, UX-03, UX-04

### Itération 2
- Focus: P1 UI + P1 UX (fonctionnalités manquantes)
- Cibles: UI-03 à UI-06, UX-05 à UX-09

### Itération 3
- Focus: P2 (polish)
- Cibles: UI-07 à UI-09, UX-10 à UX-14

### Itération 4
- Focus: P3 + vérification finale
- Cibles: UX-15, UX-16 + re-audit complet

---

## Décisions prises

| # | Décision | Raison |
|---|----------|--------|
| | | |

---

## Journal des commits

| Commit | Tâches | Fichiers |
|--------|--------|----------|
| | | |
