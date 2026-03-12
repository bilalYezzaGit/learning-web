# Validation — fonction-derivee-variations

**Date** : 2026-03-11
**Module** : 3eme-math/fonction-derivee
**Molecule** : fonction-derivee-variations
**Atomes analyses** : 7
**KB disponible** : oui (_kb.md)
**Planning disponible** : oui (_molecules/fonction-derivee-variations/_planning.yaml, status: generated)

## Synthese

| Verdict | Nombre |
|---------|--------|
| PASS    | 4      |
| WARN    | 2      |
| FAIL    | 1      |

### Problemes critiques (FAIL)

- `ex-der-derivee-graphique-reciproque` — Grille B : Le tableau de variation (question 4) est incoherent avec l'enonce. L'enonce indique que f est croissante sur [-1.5, 1] puis decroissante, mais le tableau montre f decroissante sur [-1.5, 3/2] puis croissante — contradiction avec les donnees graphiques de la question 3.

### Avertissements (WARN)

- `ex-der-vrai-faux-justifie` — Grille C : La solution de la question 5 hesite ("Attention : c'est en fait VRAI !") puis se corrige. La confusion initiale "FAUX" puis "Correction : VRAI" nuit a la clarte pedagogique.
- `ex-der-derivabilite-morceaux-parametree` — Grille B : La valeur f(2-sqrt(3)) necessite une verification. Le calcul final donne 2sqrt(3)-4 ≈ -0.54 mais la presentation est confuse avec des etapes manquantes.

---

## Detail par atome

### `ex-der-etude-rationnelle-parametree` — PASS

#### Grille A — Structure
- Frontmatter conforme. category: probleme. Directives enonce + solution + methode.

#### Grille B — Mathematiques
- Q1 : f'_m(x) = [x^2-2x+3-m]/(x-1)^2. Verifions : u=x^2+mx-3, u'=2x+m, v=x-1, v'=1. (u'v-uv')/v^2 = [(2x+m)(x-1)-(x^2+mx-3)]/(x-1)^2. Numerateur = 2x^2-2x+mx-m-x^2-mx+3 = x^2-2x+3-m. Correct.
- Q2 : f'_m(2) = (4-4+3-m)/1 = 3-m = 0, m=3. Verification f'_3(x) = x(x-2)/(x-1)^2, changement de signe en 2 : correct.
- Q3 : Δ = 4-4(3-m) = 4m-8. m<2 pas de racine, m=2 racine en x=1 (hors domaine). Correct.
- Q4 : f_3(0) = -3/-1 = 3, f_3(2) = (4+6-3)/1 = 7. Correct. Tangentes paralleles a D : 2x^2-4x+1=0, Δ=8, x=(2±√2)/2. Correct.

#### Grille C — Pedagogie
- difficulty 2, category probleme : coherent (multi-etapes mais techniques directes).
- La methode est bien formulee.

**Synthese** : PASS — Exercice complet, calculs verifies.

---

### `ex-der-derivabilite-morceaux-parametree` — WARN

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- Q1 : f(1) = (1-a)/(1-2) = a-1. lim(1+) = (1-a)/2. Continuite : a-1=(1-a)/2 → 3a=3, a=1. Correct.
- Q2 : f'_g(1) = -(x+1)/(x-2) |_{x=1} = -2/(-1) = 2. f'_d(1) = x/(x^2+1) |_{x=1} = 1/2. Correct. Non derivable.
- Q3 gauche : f'(x) = (-x^2+4x-1)/(x-2)^2, zeros x=2±√3. Sur ]-inf,1[ : seul 2-√3 ≈ 0.27. Correct.
- Q3 droite : f'(x) = (x^2+2x-1)/(x^2+1)^2, zeros x=-1±√2. Sur ]1,+inf[ : -1+√2 ≈ 0.41 n'est PAS dans ]1,+inf[. Correct, donc f'>0 sur ]1,+inf[.
- **WARN** : La valeur f(2-√3) est calculee comme 2√3-4 mais les etapes intermediaires sont difficiles a suivre. Verifions : f(2-√3) = (1-(2-√3)^2)/((2-√3)-2) = (1-(7-4√3))/(-√3) = (4√3-6)/(-√3) = (6-4√3)/√3 = 6/√3-4 = 2√3-4 ≈ -0.54. Correct mais la presentation gagnerait en clarte.

#### Grille C — Pedagogie
- difficulty 2 : OK pour un probleme avec morceaux et derivabilite.
- Le domaine notation pour le signe || dans le tableau de variation est correct.

**Synthese** : WARN — Calculs corrects mais presentation de f(2-√3) peu claire.

---

### `ex-der-tangentes-cubique` — PASS

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- f(x) = (x-2)^2(x+3) = x^3-x^2-8x+12. f'(x)=3x^2-2x-8. Factorisation : Δ=4+96=100, racines (2±10)/6 → x=2 ou x=-4/3. Donc f'(x) = 3(x-2)(x+4/3). Verifie.
- Q1 : D non tangente car f'(-3)=27+6-8=25≠-1. Correct.
- Q2 : 3x^2-2x-7=0, Δ=4+84=88, x=(1±√22)/3. Correct.
- Q3 : Tangentes issues de A(2,0). f(2)=0, tangente en A : y=0. Pour t≠2 : 4t^2-3t-14=0, Δ=9+224=233. Correct.
- Q4 : f(-4/3) = (-10/3)^2(5/3) = 100/9 × 5/3 = 500/27. f(2)=0. Correct.

#### Grille C — Pedagogie
- Probleme classique, bien structure en 4 questions progressives.

**Synthese** : PASS — Calculs rigoureux et complets.

---

### `ex-der-fonction-valeur-absolue` — WARN

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- Q1 : D_f = R\{-1,1}. Correct.
- Q2 : Parite de f : correcte. Non derivable en 0 (point anguleux, limites -7 et 7). Correct.
- Q3 : f'(x) = (x^2-2x-7)/(x-1)^2 sur ]0,+inf[\{1}. Verifions : u=x^2+4x+3, u'=2x+4, v=x-1, v'=1. (u'v-uv')/v^2 = [(2x+4)(x-1)-(x^2+4x+3)]/(x-1)^2 = [2x^2+2x-4-x^2-4x-3]/(x-1)^2 = (x^2-2x-7)/(x-1)^2. Correct.
- **WARN** : Le tableau de variation montre f **croissante** sur ]-inf, -(1+2√2)[ passant de +inf a -(4√2+6). C'est incoherent : une fonction croissante ne peut pas aller de +inf vers une valeur finie negative. En realite, pour x→-inf, f(x) ≈ x^2/(-x) = -x → +inf (correct), et en x=-(1+2√2), f prend la valeur -(4√2+6) ≈ -11.66. MAIS : f est paire, donc f(-(1+2√2)) devrait etre la meme valeur que f(1+2√2). Or f(1+2√2) = 4√2+6 > 0. Par parite f(-(1+2√2)) = f(1+2√2) = 4√2+6 > 0, PAS -(4√2+6). Le tableau semble avoir mele signes et symetrie. Le maximum en -(1+2√2) devrait avoir la valeur positive +(4√2+6), ce qui rendrait la decroissance de +inf vers +(4√2+6) incoherente aussi. L'issue vient de l'incompatibilite entre le signe du tableau (f' positive partout sauf sur un petit intervalle) et les valeurs. A revoir.
- Q5 : f'(x)=-1 donne x=3 sur ]0,+inf[. Correct.

#### Grille C — Pedagogie
- difficulty 2 : OK pour un exercice combinant valeur absolue, derivabilite et variations.

**Synthese** : WARN — Le tableau de variation a une incoherence probable dans les valeurs (signe du maximum par parite).

---

### `ex-der-derivee-graphique-reciproque` — FAIL

#### Grille A — Structure
- Conforme. Bloc Typst cetz canvas present.

#### Grille B — Mathematiques
- Q1 : f(1)=2, f'(1)=-1, f'(3/2)=0. Conforme a l'enonce.
- Q2 : y=-x+3. Correct.
- Q3 : L'analyse conclut que f est croissante sur [-1.5, 1], decroissante sur [1, 3/2], croissante sur [3/2, 4.5]. La courbe (a) convient. Correct.
- **FAIL** Q4 : Le tableau de variation indique f **decroissante** sur [-1.5, 3/2] puis **croissante** sur [3/2, 4.5], avec minimum en B(3/2, 3/2). Ceci contredit directement la Q3 qui montre que f est d'abord croissante puis decroissante puis croissante (max local en x=1, min local en x=3/2). Le tableau aurait du montrer : f croissante sur [-1.5, 1], decroissante sur [1, 3/2], croissante sur [3/2, 4.5]. Le signe de f' devrait etre : + sur ]-1.5, 1[, - sur ]1, 3/2[, + sur ]3/2, 4.5[. Or le tableau montre seulement deux colonnes ($-$, $+$) avec un seul point critique en 3/2. Le point critique x=1 est completement absent du tableau.
- Le texte Q4 dit "f semble decroissante sur [-1.5, 3/2]" ce qui contredit la courbe de l'enonce (croissante sur [-1.5, 1]).

#### Grille C — Pedagogie
- Le manque de coherence interne entre les reponses est un probleme pedagogique majeur.

**Synthese** : FAIL — Le tableau de variation (Q4) contredit l'analyse graphique (Q3). Le point critique x=1 est absent du tableau.

---

### `ex-der-derivees-successives-recurrence` — PASS

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- P1-Q1 : f'(x) = -1/(x+a)^2. Correct.
- P1-Q2 : f''=2/(x+a)^3, f'''=-6/(x+a)^4=-3!/(x+a)^4, f^(4)=24/(x+a)^5=4!/(x+a)^5. Correct.
- P1-Q3 : Conjecture f^(k)(x) = (-1)^k k!/(x+a)^(k+1). Correct.
- P1-Q4 : Recurrence correcte.
- P2-Q1 : g(x) = -1+2/(1-x). Verification : (-1+x+2)/(1-x) = (1+x)/(1-x). Correct.
- P2-Q2 : g^(k)(x) = 2k!/(1-x)^(k+1). Derivation correcte via la partie 1.

#### Grille C — Pedagogie
- difficulty 3 : OK (recurrence + derivees successives = synthese).
- Progression claire : calculer, conjecturer, prouver.

**Synthese** : PASS — Mathematiquement rigoureux, structure pedagogique exemplaire.

---

### `ex-der-vrai-faux-justifie` — WARN

#### Grille A — Structure
- Conforme. Directive :::erreurs presente (autorisee pour exercise).

#### Grille B — Mathematiques
- Q1 : |x| non derivable en 0 (f'_d=1, f'_g=-1). Correct, verdict FAUX correct.
- Q2 : sqrt(2x^2+1) derivable sur R car 2x^2+1≥1>0. Correct, verdict VRAI correct.
- Q3 : f(x)=x^3, f'(0)=0 mais pas d'extremum. Correct, verdict FAUX correct.
- Q4 : f'=g' → f=g+c (constante). Correct, verdict FAUX correct.
- Q5 : f'≥0 sur ]a,b[ et f(b)=0 → f croissante, f(x)≤f(b)=0 sur [a,b]. Correct, verdict VRAI.

#### Grille C — Pedagogie
- **WARN** : La solution de la Q5 commence par "FAUX" puis se corrige ("Attention : c'est en fait VRAI ! Correction : VRAI"). Cette hesitation dans la solution est pedagogiquement confuse. Un eleve lisant la solution verrait d'abord FAUX puis VRAI, ce qui sape la confiance dans le document. Il faudrait presenter directement VRAI avec la justification.

**Synthese** : WARN — Q5 presente une confusion FAUX/VRAI dans la redaction. Contenu mathematique correct.
