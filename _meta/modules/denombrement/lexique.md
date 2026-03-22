# Lexique et regles redactionnelles — Denombrement

Module: denombrement
Programme: 3eme-math

## 10) Règles rédactionnelles

- **Notations** :
  - $A_n^p$ pour les arrangements (jamais $P(n,p)$ ou $P_r$)
  - $C_n^p$ pour les combinaisons (la notation $\binom{n}{p}$ est acceptée mais $C_n^p$ est privilégiée)
  - $n!$ pour factorielle
  - card(E) pour le cardinal (pas |E| ni #E)
  - $\overline{A}$ ou $C_E A$ pour le complémentaire de A dans E

- **Niveau de rigueur** :
  - Toujours préciser les conditions de validité : $0 \leq p \leq n$ pour $A_n^p$ et $C_n^p$
  - Justifier le choix du modèle (« tirage simultané donc combinaisons » ou « ordre et sans remise donc arrangements »)
  - Lorsqu'on dénombre sous contraintes, expliciter la décomposition en cas et vérifier que les cas sont disjoints

- **Formules de rédaction** :
  - « Le nombre de façons de choisir p éléments parmi n est $C_n^p$ »
  - « On utilise le principe multiplicatif : ... d'où le nombre total est ... »
  - « Par la méthode du complémentaire, le nombre de ... est : total − nombre de ... = ... »
  - « D'après la formule du binôme de Newton appliquée avec $a = ..., b = ..., n = ...$ »

- **Longueur type** :
  - Application directe : 3-5 lignes (formule + calcul numérique)
  - Problème avec contraintes : 8-15 lignes (identification du modèle, décomposition en cas, calculs)
  - Démonstration (binôme, identité) : 10-20 lignes
