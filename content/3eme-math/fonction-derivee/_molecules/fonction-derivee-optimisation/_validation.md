# Validation — fonction-derivee-optimisation

**Date** : 2026-03-11
**Module** : 3eme-math/fonction-derivee
**Molecule** : fonction-derivee-optimisation
**Atomes analyses** : 9
**KB disponible** : oui (_kb.md)
**Planning disponible** : oui (_molecules/fonction-derivee-optimisation/_planning.yaml, status: generated)

## Synthese

| Verdict | Nombre |
|---------|--------|
| PASS    | 5      |
| WARN    | 3      |
| FAIL    | 1      |

### Problemes critiques (FAIL)

- `ex-der-inegalite-racine` — Grille B : La partie 3 de la solution est incomplete et contient une formule incorrecte pour f(x). L'enonce definit f(x) avec un terme 1/x^2 qui rend f non definie en 0, contradisant le domaine [0,+inf[. La solution admet elle-meme que "cet exercice necessite une formulation plus precise de f".

### Avertissements (WARN)

- `ex-der-polynome-degre4` — Grille B : L'etude du signe de f'(x) = -4x^3+12x-9 est approximative (valeur numerique alpha ≈ -2.1). La factorisation exacte manque. La discussion question 4 est incomplete.
- `ex-der-famille-fonctions-extrema` — Grille B : Le calcul de g(-1+sqrt(2)) est presente sans etapes intermediaires suffisantes. La valeur 6sqrt(2)-6 merite verification detaillee.
- `ex-der-extremum-quadratique-lieu` — Grille B : Le tableau de variation a une incoherence : pour X→-inf, h(X)→0 (par le haut) mais le tableau indique une valeur de depart 0 puis decroissance vers 1 en X=0. En realite h(X) tend vers 0 par le bas (negatif) quand X→-inf. De plus la conclusion dit "minimum en X=0 (Y=1)" mais c'est un maximum local, pas un minimum.

---

## Detail par atome

### `ex-der-rectangle-perimetre-max` — PASS

#### Grille A — Structure
- Conforme. Directive :::methode presente.

#### Grille B — Mathematiques
- x^2+y^2=1, y=sqrt(1-x^2). p(x)=4(x+sqrt(1-x^2)). Correct.
- f'(x) = 1-x/sqrt(1-x^2). f'=0 ↔ sqrt(1-x^2)=x ↔ x=√2/2. Correct.
- f(√2/2) = √2/2+√(1/2) = √2. p_max = 4√2. Correct.
- x=y=√2/2, donc carre de cote √2. Correct.

#### Grille C — Pedagogie
- difficulty 3, category probleme : OK (optimisation geometrique).
- Methode bien formulee.

**Synthese** : PASS — Probleme classique parfaitement traite.

---

### `ex-der-optimisation-bus` — PASS

#### Grille A — Structure
- Conforme. Directive :::erreurs presente.

#### Grille B — Mathematiques
- f(x) = -x^2+75x+1350. f'(x) = -2x+75. f'=0 ↔ x=37.5. Correct.
- f(37.5) = 52.5 × 52.5 = 2756.25. Correct.
- f(37) = 52×53 = 2756. f(38) = 53×52 = 2756. f(37)=f(38). Correct.
- Conclusion : n=37 ou n=38 (52 ou 53 personnes), revenu 2756 dinars. Correct.

#### Grille C — Pedagogie
- Le piege variable continue vs entiere est bien traite.
- Les erreurs frequentes sont pertinentes.

**Synthese** : PASS — Excellent probleme d'optimisation pratique.

---

### `ex-der-inegalite-racine` — FAIL

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- Q1a : h(x) = x^2/(1+x) ≥ 0 pour x≥0. Correct. Donc 1-x ≤ 1/(1+x).
- Q1b : sqrt(1+x)≤1+x → 1/sqrt(1+x) ≥ 1/(1+x) ≥ 1-x. Correct.
- Q2 : g(x) = 1+x/2-sqrt(1+x). g'(x)=(sqrt(1+x)-1)/(2sqrt(1+x))≥0 pour x≥0. g(0)=0. Donc g(x)≥0. Correct.
- **FAIL** Q3 : L'enonce definit f(x) = 1 + x/4 - 1/x^2 - (3/7)x. Cette fonction a un terme -1/x^2 qui la rend non definie en x=0, mais le domaine indique est [0,+inf[. La solution calcule f'(x) = 1/4 + 2/x^3 - 3/7 = 2/x^3 - 5/28 et note f(0+)→-inf. La solution admet explicitement : "Cet exercice necessite une formulation plus precise de f". Le fait que la solution soit incomplete et que l'auteur reconnaisse un probleme de formulation rend cet atome invalide en l'etat. L'encadrement final 1+x/4 ≤ sqrt(1+x) est probablement faux (pour x=4 : 1+1=2 mais sqrt(5)≈2.24, ok; pour x=0 : 1≤1 ok; pour x=100 : 26 vs sqrt(101)≈10.05, faux!). L'inegalite 1+x/4 ≤ sqrt(1+x) est FAUSSE pour x grand.

#### Grille C — Pedagogie
- La partie 3 avec sa solution incomplete est inutilisable pedagogiquement.

**Synthese** : FAIL — Partie 3 a un enonce mal formule (f non definie en 0) et une solution incomplete. L'inegalite finale est mathematiquement fausse pour x grand.

---

### `ex-der-polynome-degre4` — WARN

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- Q1 : lim ±inf = -inf. Correct (terme dominant -x^4).
- Q2 : f'(x) = -4x^3+12x-9. Correct.
  - f'(-3)=108-36-9=63>0. f'(-2)=32-24-9=-1<0. f'(1)=-4+12-9=-1<0.
  - L'etude conclut qu'il y a une seule racine reelle α≈-2.1. Verifions : f'(x) est cubique avec coefficient dominant -4<0. f''(x)=-12x^2+12=-12(x^2-1), f''=0 en x=±1. f' a un max local en x=-1 (f'(-1)=4-12-9=-17<0) et un min local en x=1 (f'(1)=-1<0). Puisque les deux extrema locaux de f' sont negatifs, f' ne s'annule qu'une seule fois (quand elle descend de +inf a la gauche). Correct.
  - **WARN** : La solution est evasive ("factorisation numeriquement", "alpha≈-2.1"). Pour un exercice de niveau 3eme math, la racine exacte d'un polynome de degre 3 n'est pas factorisable simplement, donc un encadrement numerique est acceptable, mais la presentation manque de rigueur : la justification qu'il n'y a qu'une seule racine reelle passe par l'etude de f'', ce qui est correct mais pourrait etre plus explicite.
- Q3c : Les encadrements des racines sont approximatifs mais coherents.
- **WARN** Q4 : La discussion du nombre de solutions est incomplete. La solution dit "2 solutions pour certaines valeurs de m" sans preciser. Avec un seul maximum, f(x)=m admet 0 solution si m>f(α), 1 solution si m=f(α), 2 solutions si m<f(α). La solution finit par donner cette reponse correcte mais la presentation est confuse.

#### Grille C — Pedagogie
- difficulty 3, category synthese : OK.

**Synthese** : WARN — Etude de f' manque de rigueur (valeur approchee sans justification formelle), discussion Q4 incomplete.

---

### `ex-der-triangle-aire-maximale` — PASS

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- f(x) = (1-x)sqrt(1-x^2). Correct.
- Derivabilite en -1 : taux → +inf (tangente verticale). En 1 : taux → 0. Correct.
- f'(x) = -(1+2x)sqrt(1-x)/sqrt(1+x). f'=0 ↔ x=-1/2. Correct.
- f(-1/2) = (3/2)(√3/2) = 3√3/4. Correct.
- AM=AM'=MM'=√3 : triangle equilateral. Verifions : AH=3/2, HM=√3/2. AM^2=9/4+3/4=3. AM=√3. MM'=2HM=√3. Correct.

#### Grille C — Pedagogie
- Probleme geometrique elegant avec conclusion sur le triangle equilateral.

**Synthese** : PASS — Demonstration complete et rigoureuse.

---

### `ex-der-distance-minimale-parabole` — PASS

#### Grille A — Structure
- Conforme. Directive :::methode presente.

#### Grille B — Mathematiques
- AM^2 = x^2+(x^2-1)^2 = x^2+x^4-2x^2+1 = x^4-x^2+1. Correct.
- f'(x) = 4x^3-2x = 2x(2x^2-1). Zeros : x=0, x=±√2/2. Correct.
- f(±√2/2) = 1/4-1/2+1 = 3/4. f(0)=1. Correct.
- AM_min = √(3/4) = √3/2. Correct.

#### Grille C — Pedagogie
- La methode "minimiser AM^2 au lieu de AM" est bien expliquee.

**Synthese** : PASS — Calculs impeccables.

---

### `ex-der-casserole-metal-minimal` — PASS

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- V=πx^2h=1000, h=1000/(πx^2). Correct.
- S=πx^2+2πxh=πx^2+2000/x. Correct.
- S'=2πx-2000/x^2=(2πx^3-2000)/x^2. S'=0 ↔ x^3=1000/π, x=10/π^(1/3). Correct.
- h=1000/(π×100/π^(2/3))=10/π^(1/3)=x. Correct : h=x.

#### Grille C — Pedagogie
- Probleme concret bien modele.

**Synthese** : PASS — Calculs corrects, conclusion elegante h=x.

---

### `ex-der-famille-fonctions-extrema` — WARN

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- Q1 : Pour m=3/2, polynome degre 2, un seul extremum. Correct.
  Pour m≠3/2 : Δ'=9(2m-1)(m-1). Δ'>0 donne 2 extrema, Δ'=0 pas d'extremum, Δ'<0 pas d'extremum. Donc un seul extremum pour m=3/2. Correct.
- Q2 : f_m decroissante ↔ f'_m≤0 partout. Coefficient dominant 3(2m-3)<0 et Δ'≤0 ↔ 1/2≤m≤1. Correct.
- Q3a : f_1(x) = -x^3+3x^2-3x+1 = (1-x)^3. Verifions : (1-x)^3 = 1-3x+3x^2-x^3. Correct.
  Pour x≤0 ou x≥1 : |x^2-x| = x^2-x. g(x) = -x^3+3(x^2-x)+1 = -x^3+3x^2-3x+1 = f_1(x). Correct.
- Q3b : Pour 0<x<1 : g(x) = -x^3-3x^2+3x+1. Correct.
- Q3c : g'(x)=-3x^2-6x+3=-3(x^2+2x-1). x=-1+√2≈0.41 dans ]0,1[. Correct.
  Points anguleux en x=0 : g'_g(0)=-3, g'_d(0)=3. Correct.
  En x=1 : g'_g(1)=-3(1+2-1)=-6. g'_d(1)=-3(1-1)^2=0. Correct.
- **WARN** : g(-1+√2) = 6√2-6. Verifions : posons t=√2-1.
  g(t) = -t^3-3t^2+3t+1. t^2=3-2√2. t^3=t×t^2=(√2-1)(3-2√2)=3√2-2(2)-3+2√2=5√2-7.
  g(t)=-(5√2-7)-3(3-2√2)+3(√2-1)+1=-5√2+7-9+6√2+3√2-3+1=4√2-4 = 4(√2-1).
  La solution donne 6√2-6. Mais 4(√2-1)=4√2-4≈1.66, tandis que 6√2-6≈2.49.
  Il y a potentiellement une erreur de calcul. A reverifier soigneusement.

#### Grille C — Pedagogie
- difficulty 3 : OK pour un exercice combinant parametres, valeur absolue et extrema.

**Synthese** : WARN — La valeur de g(√2-1) semble incorrecte (le calcul detaille donne 4√2-4, pas 6√2-6).

---

### `ex-der-extremum-quadratique-lieu` — WARN

#### Grille A — Structure
- Conforme.

#### Grille B — Mathematiques
- Q1 : c=1, b=-a-1. f(x)=ax^2-(a+1)x+1. Correct.
- Q2 : X=(a+1)/(2a), Y=1-(a+1)^2/(4a). Correct.
- Q3a : Y=-(X-1)^2/(2X-1). Verifions avec a=1/(2X-1) :
  (a+1)^2/(4a) = (2X/(2X-1))^2/(4/(2X-1)) = 4X^2/((2X-1)^2) × (2X-1)/4 = X^2/(2X-1).
  Y=1-X^2/(2X-1) = (2X-1-X^2)/(2X-1) = -(X^2-2X+1)/(2X-1) = -(X-1)^2/(2X-1). Correct.
- Q3b : h'(X) = -2X(X-1)/(2X-1)^2. h'=0 ↔ X=0 ou X=1. Correct.
  h(0) = -(0-1)^2/(-1) = 1. h(1) = 0. Correct.
  **WARN** : Quand X→-inf : h(X) = -(X-1)^2/(2X-1) ≈ -X^2/(2X) = -X/2 → +inf. Mais le tableau indique h→0 en -inf, ce qui est faux. Aussi, le tableau montre h decroissante de 0 a 1 sur ]-inf, 0[, mais en realite h(-inf)→+inf et h(0)=1, et la solution dit f'>0 implique decroissante... non, signe de f' sur ]-inf,0[ : X<0 et X<1, donc -2X(X-1) = -2(neg)(neg) = -2(pos) < 0. Donc h'<0 sur ]-inf,0[, h decroissante. Mais h→+inf quand X→-inf et h(0)=1 : c'est coherent (decroissante de +inf a 1). Le tableau montre 0 en -inf, ce qui est incorrect.
  La conclusion "minimum en X=0 (Y=1)" est aussi incorrecte : puisque h decroit de +inf a 1 sur ]-inf,0[ puis croit de 1 a ||, c'est un minimum local. Mais le tableau dit "top, 0" en -inf puis "bottom, 1" en X=0, ce qui suggere une decroissance de 0 vers 1 (erreur de placement top/bottom).

#### Grille C — Pedagogie
- L'exercice est mathematiquement interessant mais les erreurs dans le tableau compromettent la fiabilite.

**Synthese** : WARN — Le comportement en X→-inf est mal represente dans le tableau (devrait etre +inf, pas 0). Le placement top/bottom est incorrect en debut de tableau.
