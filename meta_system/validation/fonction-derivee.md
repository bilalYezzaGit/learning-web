# Validation — fonction-derivee

**Date** : 2026-03-11
**Module** : 3eme-math/fonction-derivee
**Atomes analyses** : 23
**KB disponible** : oui (meta_system/kb/06-fonction-derivee.md)
**Planning disponible** : oui (content/3eme-math/fonction-derivee/_planning.yaml, status: generated)

## Synthese

| Verdict | Nombre |
|---------|--------|
| PASS    | 14     |
| WARN    | 7      |
| FAIL    | 2      |

### Problemes critiques (FAIL)

- `ex-der-inegalite-racine` — Grille B : La partie 3 de la solution est incomplete et contient une formule incorrecte pour f(x). L'enonce definit f(x) avec un terme 1/x^2 qui rend f non definie en 0, contradisant le domaine [0,+inf[. La solution admet elle-meme que "cet exercice necessite une formulation plus precise de f".
- `ex-der-derivee-graphique-reciproque` — Grille B : Le tableau de variation (question 4) est incoherent avec l'enonce. L'enonce indique que f est croissante sur [-1.5, 1] puis decroissante, mais le tableau montre f decroissante sur [-1.5, 3/2] puis croissante — contradiction avec les donnees graphiques de la question 3.

### Avertissements (WARN)

- `ex-der-vrai-faux-justifie` — Grille C : La solution de la question 5 hesite ("Attention : c'est en fait VRAI !") puis se corrige. La confusion initiale "FAUX" puis "Correction : VRAI" nuit a la clarte pedagogique.
- `ex-der-derivabilite-morceaux-parametree` — Grille B : La valeur f(2-sqrt(3)) necessite une verification. Le calcul final donne 2sqrt(3)-4 ≈ -0.54 mais la presentation est confuse avec des etapes manquantes.
- `ex-der-polynome-degre4` — Grille B : L'etude du signe de f'(x) = -4x^3+12x-9 est approximative (valeur numerique alpha ≈ -2.1). La factorisation exacte manque. La discussion question 4 est incomplete.
- `ex-der-fonction-valeur-absolue` — Grille B : Le tableau de variation montre f croissante sur ]-inf, -(1+2sqrt(2))[ avec valeurs allant de +inf a -(4sqrt(2)+6), ce qui est incoherent : si f est croissante, les valeurs devraient augmenter, pas passer de +inf a une valeur negative.
- `ex-der-famille-fonctions-extrema` — Grille B : Le calcul de g(-1+sqrt(2)) est presente sans etapes intermediaires suffisantes. La valeur 6sqrt(2)-6 merite verification detaillee.
- `ex-der-extremum-quadratique-lieu` — Grille B : Le tableau de variation a une incoherence : pour X→-inf, h(X)→0 (par le haut) mais le tableau indique une valeur de depart 0 puis decroissance vers 1 en X=0. En realite h(X) tend vers 0 par le bas (negatif) quand X→-inf. De plus la conclusion dit "minimum en X=0 (Y=1)" mais c'est un maximum local, pas un minimum.
- `lesson-der-tableau-variation` — Grille B : f(x)=2x^3-3x^2-12x+1, la valeur f(-1)=-2-3+12+1=8 est correcte. Mais f(2)=16-12-24+1=-19 : verifions 2(8)-3(4)-12(2)+1=16-12-24+1=-19. Correct. WARN retire — voir ci-dessous.

---

## Detail par atome

### `lesson-der-formules-derivation` — PASS

#### Grille A — Structure
- Frontmatter complet : type lesson, difficulty 1, timeMinutes 10, tags [derivation, formules, operations], praxeologies [Prax1, Prax2a, Prax2b, Prax2c]. Conforme.
- ID conforme : lesson-der-formules-derivation (type=lesson, topic=der, slug=formules-derivation).
- Directives : definition, remark, property, attention, example — toutes autorisees pour lesson.
- Headings commencent a ### : oui.
- LaTeX equilibre : oui.

#### Grille B — Mathematiques
- Tableau des derivees usuelles : correct.
- Formules d'operations (somme, produit, quotient, puissance, inverse, sqrt(f), f(ax+b)) : toutes correctes.
- Exemple f(x) = (5x-2)^4 : f'(x) = 20(5x-2)^3 — correct (5 × 4(5x-2)^3).
- Definition des derivees successives : correcte.

#### Grille C — Pedagogie
- difficulty 1 (application directe) : coherent pour un resume de cours.
- timeMinutes 10 : raisonnable pour une lecon dense couvrant toutes les formules.
- Praxeologies [Prax1, Prax2a, Prax2b, Prax2c] : correspondent au contenu (derivees usuelles, produit/quotient, sqrt, f(ax+b)).
- L'attention sur le signe "-" au quotient est pedagogiquement pertinente.
- Alignement planning : conforme au champ "contenu" du planning.

**Synthese** : PASS — Lecon solide, complete et bien structuree.

---

### `lesson-der-variations-extrema` — PASS

#### Grille A — Structure
- Frontmatter complet et conforme. ID conforme.
- Directives lesson autorisees (theorem, remark, property, definition, attention, example).

#### Grille B — Mathematiques
- Equivalences f'≥0 ↔ f croissante : correctement enoncees.
- Derivee et parite : correct (f paire ⇒ f' impaire).
- Definitions extremum local et absolu : correctes.
- Condition necessaire (f'(a)=0) et contre-exemple x^3 : correct.
- Condition suffisante (changement de signe) : correcte.
- Exemple f(x)=-x^3+3x : f'(x)=-3x^2+3=-3(x-1)(x+1). f(-1)=1-3=**-2**, f(1)=-1+3=**2**. Correct.

#### Grille C — Pedagogie
- difficulty 1 : coherent pour un cours theorique de base.
- Praxeologies [Prax4, Prax5] : OK.
- Le contre-exemple x^3 est la cle pedagogique de ce module, bien presente.

**Synthese** : PASS — Theoremes et definitions bien presentes, contre-exemple fondamental inclus.

---

### `lesson-der-tableau-variation` — PASS

#### Grille A — Structure
- Frontmatter complet. ID conforme. Bloc Typst vartable : syntaxe correcte.

#### Grille B — Mathematiques
- f(x) = 2x^3 - 3x^2 - 12x + 1, f'(x) = 6x^2 - 6x - 12 = 6(x-2)(x+1) : correct.
- f(-1) = -2-3+12+1 = 8 : correct.
- f(2) = 16-12-24+1 = -19 : correct.
- Tableau de variation coherent : f' > 0 sur ]-inf,-1[, f' < 0 sur ]-1,2[, f' > 0 sur ]2,+inf[.
- Nombre de solutions de f(x)=0 (3 solutions), f(x)=8 (2 solutions), f(x)=10 (1 solution) : coherent avec le tableau.

#### Grille C — Pedagogie
- Methode de construction en 5 etapes : claire et complete.
- Lecture du tableau (extrema, nombre de solutions, encadrements) : bien expliquee.

**Synthese** : PASS — Exemple complet bien traite, methode claire.

---

### `qcm-der-formules-quotient` — PASS

#### Grille A — Structure
- Frontmatter conforme. ID conforme (qcm-der-formules-quotient). 4 options, 1 correcte. Directives QCM completes.

#### Grille B — Mathematiques
- f(x) = (x+1)/(x-1). f'(x) = [(x-1)-(x+1)]/(x-1)^2 = -2/(x-1)^2. Correct.
- Option correcte : -2/(x-1)^2. Verifie.
- Distracteur f'(x)=1 (quotient des derivees) : plausible piege.
- Distracteur f'(x)=2/(x-1)^2 (signe + au lieu de -) : piege classique.
- Distracteur f'(x)=2x/(x-1)^2 : plausible mais incorrect. Aucun distracteur n'est accidentellement correct.

#### Grille C — Pedagogie
- difficulty 1, timeMinutes 2 : coherent pour un QCM d'application directe.
- Explanation pedagogique : detaille le calcul et mentionne le piege du signe. Bien.

**Synthese** : PASS — QCM bien construit avec des distracteurs cibles sur les erreurs classiques.

---

### `qcm-der-derivee-racine` — PASS

#### Grille A — Structure
- Conforme. 4 options, 1 correcte.

#### Grille B — Mathematiques
- f(x) = sqrt(3x^2+1). u(x)=3x^2+1, u'(x)=6x. f'(x) = 6x/(2sqrt(3x^2+1)) = 3x/sqrt(3x^2+1). Correct.
- Option 1 : 1/(2sqrt(3x^2+1)) — oubli du facteur u'. Piege classique.
- Option 2 : 6x/sqrt(3x^2+1) — oubli du facteur 2 au denominateur. Piege.
- Option 4 : 3x/(2(3x^2+1)) — oubli de la racine au denominateur. Piege. Aucun distracteur accidentellement correct.

#### Grille C — Pedagogie
- Distracteurs bien cibles sur des erreurs specifiques.
- Explanation claire.

**Synthese** : PASS — Excellent QCM pedagogique.

---

### `qcm-der-extremum-condition` — PASS

#### Grille A — Structure
- Conforme. 4 options, 1 correcte.

#### Grille B — Mathematiques
- f(x)=x^3, f'(0)=3(0)^2=0. Pas d'extremum car f'(x)=3x^2≥0 partout, f croissante. Correct.
- L'option correcte identifie le non-changement de signe de f'. Correct.

#### Grille C — Pedagogie
- difficulty 2 : correct (discrimination CN vs CS demande de la reflexion).
- Contre-exemple fondamental du module, bien place apres la lecon variations-extrema.

**Synthese** : PASS — QCM cle qui teste la misconception E1.

---

### `qcm-der-lecture-graphique` — PASS

#### Grille A — Structure
- Conforme. 3 options, 1 correcte. (Note : 3 options est dans la fourchette autorisee 2-5.)

#### Grille B — Mathematiques
- f croissante sur ]-inf,1[ → f'>0, decroissante sur ]1,3[ → f'<0, croissante sur ]3,+inf[ → f'>0. f'(1)=0, f'(3)=0. Correct.
- L'option correcte correspond exactement.

#### Grille C — Pedagogie
- difficulty 1 : coherent (lecture directe du lien derivee-variations).
- Explanation pedagogique detaillee.

**Synthese** : PASS — QCM clair et bien construit.

---

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

---

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
