# Audit UI/UX & EdTech — Aylan

> **Date** : 2026-03-18
> **Contexte** : Aylan est une app paper-first qui augmente des livrets de maths imprimes.
> Le MVP V1 fait exactement 2 choses : (1) consulter le contenu via scan QR, (2) correction IA photo.
> Pas de progression, pas de pairing, contenu ouvert.

---

## CE QUI VA BIEN

| # | Point | Detail |
|---|-------|--------|
| 1 | Architecture code | Server Components par defaut, separation propre, `cache()` sur le content-loader, singleton auth sans Provider |
| 2 | Accessibilite | Skip-link, `aria-hidden` sur les icones, touch targets 44px, `prefers-reduced-motion`, `role="alert"`, `aria-live` |
| 3 | QCM Session Player | Timer, keyboard shortcuts (1-4, Enter, Space), feedback immediat, score, toast, result screen |
| 4 | Palette OKLCH | Terracotta/sable chaleureuse et educative — `#9F6B53` distinctif |
| 5 | Typographie | DM Sans (corps) + Lora (titres) — bon pairing |
| 6 | PWA | Manifest, service worker, install prompt intelligent (Chrome + iOS), offline page |
| 7 | Scan IA | Flow complet idle -> capturing -> analyzing -> result, gate auth, toast, erreurs |
| 8 | QR Scanner | Cross-browser (Nimiq), camera env, parse 3 formats |
| 9 | Print styles | Cache nav/buttons, prose 12pt, liens avec URL |
| 10 | Prose overrides | Tables stylees, blockquotes primary, KaTeX en boites |
| 11 | Auth flow | Eye toggle, erreurs Firebase en francais, reset password |
| 12 | Semantic color tokens | `--success`, `--warning`, `--info`, `--destructive` |

---

## CE QUI VA MAL

### 1. Identite & Branding — CRITIQUE

- [ ] Pas de logo — juste texte "Aylan" + icone BookOpen generique
- [x] Panneau auth dit "Learning" au lieu de "Aylan" (`auth-form-card.tsx:23`) — **LOT 1**
- [ ] Pas d'OG image — partages WhatsApp/Instagram vides
- [ ] Icones PWA probablement placeholders
- [ ] Rien ne dit "maths" ni "Tunisie" visuellement

### 2. Landing Page — HAUTE

- [ ] Generique — interchangeable avec n'importe quelle app EdTech
- [ ] Stats faibles : "3 modules", "90+ activites", "IA"
- [ ] Formules math a 6% opacite — invisibles
- [ ] Pas de section "Comment ca marche"
- [ ] Pas de captures d'ecran de l'app
- [ ] 2 features seulement (scan + IA) — manque QCM, resume, consultation
- [ ] Pas de social proof
- [ ] Footer generique
- [ ] Badge "Parcours 1ere TC disponible" peu clair

### 3. App Shell & Navigation — HAUTE

- [ ] Header trop minimal (brand + avatar, pas de titre de page)
- [ ] Pas de fil d'Ariane dans les pages profondes
- [ ] Pas de recherche (90+ activites)
- [x] ScanFab demande 2 clics (devrait auto-start camera) — **LOT 1**
- [x] Entree manuelle placeholder inutilisable ("ex: ex-continuite-1") — **LOT 1**

### 4. Mes Livrets — MOYENNE

- [ ] Livrets visuellement identiques (meme icone, meme couleur)
- [ ] Pas de categorisation par niveau/type
- [ ] Description coupee (line-clamp-1)
- [ ] Badge code brut pas humain ("CONTINUITE3E001")
- [ ] Pas de "Recemment utilise"

### 5. Booklet Hub — MOYENNE

- [ ] TOC plat sans hierarchie visuelle
- [ ] Quick actions limitees (Resume + QCM seulement)
- [ ] Pas de navigation prev/next entre exercices
- [x] Couleurs hardcodees dans ActionCard (`bg-amber-50`, `text-blue-600`) — **LOT 1**
- [x] Couleurs hardcodees dans ACTIVITY_ICON — **LOT 1**

### 6. Pages de contenu — MOYENNE

- [ ] Pas de cadrage visuel (type, section)
- [ ] Pas de prev/next (cul-de-sac)
- [ ] Scan card deconnectee visuellement
- [x] Couleurs hardcodees dans QCM consultation (`emerald-300`, `emerald-50`) — **LOT 1**
- [x] Explication QCM hardcodee (`amber-500`, `amber-50`) — **LOT 1**

### 7. Onboarding — BASSE

- [ ] 2 etapes generiques sans illustrations
- [ ] Ne montre pas l'app ni le concept paper-first
- [ ] Pas de lien vers les livrets physiques

### 8. Profil — BASSE (acceptable V1)

- [ ] Juste l'email — placeholder feeling

### 9. Dark Mode — MOYENNE

- [ ] Seulement le theme light defini
- [ ] Variables OKLCH deja en place — ajout mecanique

---

## PROBLEME FONDAMENTAL : LIEN PAPER <-> DIGITAL

| Promesse | Realite |
|----------|---------|
| "Le livret est au centre" | Aucune representation visuelle du livret |
| "Scanne le QR de ton livret" | Scan enterre derriere FAB + 2 clics |
| "Contenu augmente" | L'app fonctionne SANS livret |
| "Paper-first" | Zero "ouvre ton livret page X" |

---

## FEATURES MANQUANTES

### Priorite 1 — Bloquant lancement

| # | Manque | Effort |
|---|--------|--------|
| 1 | Logo & identite visuelle | Moyen |
| 2 | "Learning" -> "Aylan" dans auth | 5 min |
| 3 | Couvertures/couleurs par livret | Faible |
| 4 | Section "Comment ca marche" landing | Moyen |
| 5 | Prompt "Ouvre ton livret page X" | Moyen |
| 6 | OG image pour partages | Faible |

### Priorite 2 — Experience

| # | Manque | Effort |
|---|--------|--------|
| 7 | Auto-start camera scan | Faible |
| 8 | Navigation prev/next exercices | Moyen |
| 9 | Dark mode | Moyen |
| 10 | Categorisation livrets | Moyen |
| 11 | Fixer couleurs hardcodees | Faible |
| 12 | Landing enrichie | Moyen |

### Priorite 3 — Polish

| # | Manque | Effort |
|---|--------|--------|
| 13 | Loading skeletons contenu | Faible |
| 14 | Micro-animations / transitions | Moyen |
| 15 | Onboarding avec illustrations | Moyen |
| 16 | Recherche exercice | Moyen |
| 17 | Page 404 personnalisee | Faible |
| 18 | Empty states personnalises | Faible |
| 19 | Illustrations dans l'app | Eleve |

### Differe V2

| # | Feature | Raison |
|---|---------|--------|
| 20 | Progression visible | Retire V1 intentionnellement |
| 21 | Bottom navigation | Retire V1, remplace par ScanFab |
| 22 | Streak / gamification | Necessite progression |
| 23 | Historique scans IA | Nice-to-have |
| 24 | Parcours personnalises | Differe V2 |

---

## LOTS DE CHANGEMENTS

### LOT 1 — Quick fixes & hygiene (en cours)
- [x] Fixer "Learning" -> "Aylan" dans auth-form-card.tsx
- [x] Fixer couleurs hardcodees (semantic tokens)
- [x] Auto-start camera dans ScanFab
- [x] Entree manuelle : meilleur placeholder

### LOT 2 — Identite livrets
- [ ] Couleurs distinctives par livret (couleur de fond + icone par module)
- [ ] Categorisation par niveau dans la liste
- [ ] Badges code humains

### LOT 3 — Lien paper-first
- [ ] Prompt "Ouvre ton livret page X" sur les exercices
- [ ] Quick action "Scanner" dans le booklet hub
- [ ] Navigation prev/next dans les exercices

### LOT 4 — Landing page
- [ ] Section "Comment ca marche" (3 etapes visuelles)
- [ ] Plus de features visibles
- [ ] Badge d'annonce plus clair
- [ ] Stats plus impactantes

### LOT 5 — Dark mode

### LOT 6 — Polish
- [ ] Loading skeletons
- [ ] Transitions & animations
- [ ] 404 et empty states
- [ ] Onboarding enrichi
