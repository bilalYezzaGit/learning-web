// =============================================================================
// Transcription fidele : Parascolaire Analyse 3eme sec Section Math (Kounouz)
// Chapitre II — Continuite (pages 26 a 41)
// =============================================================================

#import "@preview/cetz:0.3.4"

#set text(lang: "fr")
#set page(margin: 2cm)

// ─────────────────────────────────────────────────────────────────────────────
// RESUME DE COURS (pages 26–29)
// ─────────────────────────────────────────────────────────────────────────────

// Source: Parascolaire Analyse p.26

#align(center)[
  _Chapitre II_ \
  #text(size: 18pt, weight: "bold")[Continuite]
]

#v(0.5cm)

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  #underline[*Definition :*] \
  f definie sur un intervalle ouvert I et $a in I$. On dit que f est continue
  en $a$ signifie que pour tout nombre $beta > 0$ il existe un nombre $alpha > 0$
  tel que si $x in I$, $|x - a| < alpha$ alors $|f(x) - f(a)| < beta$

  #v(0.3cm)
  #underline[Exemple :] \
  $f(x) = 2x - 1$ et $a = 2$. Montrer que f est continue en 2 ?

  pour tout $beta > 0$ existe-t-il un $alpha > 0$ tel que $|x - 2| < alpha$ alors $|f(x) - f(2)| < beta$

  on sait que $|f(x) - f(2)| < beta$ or $f(2) = 3 arrow.double.long |(2x - 1) - 3| < beta$

  soit $|2x - 4| < beta$ ou encore $2|x - 2| < beta arrow.double.long |x - 2| < frac(beta, 2)$ il suffit de choisir $alpha = frac(beta, 2)$.

  ainsi f est continue en 2.

  #v(0.3cm)
  *Continuite de certaines fonctions usuelles en un point a :*

  #table(
    columns: (1fr, 1fr),
    align: center,
    table.header[*Fonction*][*Continue en tout point a de*],
    [$x mapsto c$ constante], [$RR$],
    [$x mapsto x$], [$RR$],
    [$x mapsto a x$], [$RR$],
    [$x mapsto a x + b$], [$RR$],
    [$x mapsto x^2$], [$RR$],
    [Toute fonction polynome], [$RR$],
    [$x mapsto frac(1, x)$], [$RR^*$],
    [Toute fonction rationnelle], [Domaine de definition],
    [$x mapsto sqrt(x)$], [$RR_+$],
    [$x mapsto sqrt(f(x))$], [Son domaine de definition],
  )

  #v(0.3cm)
  *Operations sur les fonctions continues :*

  #underline[Theoremes :] \
  1) f continue en $a arrow.double |f|$ est continue en $a$.

  2) $f$ continue en $a$ et $f(a) > 0$ $arrow.double sqrt(f)$ est continue en $a$.

  3) Soient f et g deux fonctions continues en $a$ et $alpha in RR$ \
  $arrow.double f + g$, $f times g$, $alpha f$ sont continues en $a$.
]

// Source: Parascolaire Analyse p.27

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  4) $f$ continue en $a$ et $f(a) eq.not 0$ $arrow.double frac(1, f)$ est continue en $a$.

  5) f et g sont continues en $a$ et $g(a) eq.not 0$ $arrow.double frac(f, g)$ est continue en $a$.

  #v(0.3cm)
  #underline[Exemple :] $f(x) = frac(sqrt(x - 2), x^2 + 2x + 5)$. Justifier que f est continue en 2.

  $x mapsto sqrt(x - 2)$ continue en 2.

  $x mapsto x^2 + 2x + 5$ est une fonction polynome donc continue
  en 2 et $2^2 + 2 times 2 + 5 = 13 eq.not 0$. $arrow.double$ f est continue en 2.

  #v(0.5cm)
  *Illustration graphique :*

  - On reconnait qu'une fonction est continue lorsque sa courbe representative
    peut etre tracee sans lever le crayon :

  #v(0.3cm)

  #grid(
    columns: (1fr, 1fr),
    gutter: 1cm,
    [
      - *Exemple :* \
      $f(x) = x^2$ est continue sur $RR$ $zeta_f$ est
      une parabole. \
      f peut etre tracee sans lever le crayon.
    ],
    [
      // Figure: parabole y = x^2
      #cetz.canvas({
        import cetz.draw: *
        // Axes
        line((-2, 0), (2, 0), stroke: 0.5pt, mark: (end: ">"))
        line((0, -0.5), (0, 2.5), stroke: 0.5pt, mark: (end: ">"))
        content((2.2, 0), $x$)
        content((0, 2.7), $y$)
        // Parabole
        let pts = ()
        for i in range(-15, 16) {
          let x = i / 10
          let y = x * x
          pts.push((x, y))
        }
        line(..pts, stroke: 1pt + blue)
        // Points de repere
        content((-0.2, -0.2), $O$)
        content((-1.2, 1), $1$)
        content((1, -0.3), $1$)
      })
    ],
  )

  #grid(
    columns: (1fr, 1fr),
    gutter: 1cm,
    [
      - *Contre exemple :* $f(x) = E(x)$ la
      partie entiere de x lorsqu'on trace sa
      courbe il faut lever le crayon en tout
      point d'abscisse entiere
    ],
    [
      // Figure: fonction partie entiere E(x)
      #cetz.canvas({
        import cetz.draw: *
        // Axes
        line((-1.5, 0), (3.5, 0), stroke: 0.5pt, mark: (end: ">"))
        line((0, -2.5), (0, 2.5), stroke: 0.5pt, mark: (end: ">"))
        content((3.7, 0), $x$)
        content((0, 2.7), $y$)
        content((-0.2, -0.2), $O$)
        // Paliers de la partie entiere
        // E(x) = -1 pour x in [-1, 0[
        line((-1, -1), (0, -1), stroke: 1pt)
        circle((-1, -1), radius: 0.06, fill: black)
        circle((0, -1), radius: 0.06, fill: white, stroke: 0.5pt)
        // E(x) = 0 pour x in [0, 1[
        line((0, 0), (1, 0), stroke: 1pt)
        circle((0, 0), radius: 0.06, fill: black)
        circle((1, 0), radius: 0.06, fill: white, stroke: 0.5pt)
        // E(x) = 1 pour x in [1, 2[
        line((1, 1), (2, 1), stroke: 1pt)
        circle((1, 1), radius: 0.06, fill: black)
        circle((2, 1), radius: 0.06, fill: white, stroke: 0.5pt)
        // E(x) = 2 pour x in [2, 3[
        line((2, 2), (3, 2), stroke: 1pt)
        circle((2, 2), radius: 0.06, fill: black)
        circle((3, 2), radius: 0.06, fill: white, stroke: 0.5pt)
        // Graduations
        content((1, -0.3), $1$)
        content((2, -0.3), $2$)
        content((3, -0.3), $3$)
        content((-1, -0.3), $-1$)
        content((-0.3, 1), $1$)
        content((-0.3, 2), $2$)
        content((-0.4, -1), $-1$)
        content((-0.4, -2), $-2$)
      })
    ],
  )
]

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  *Continuite a gauche et a droite :*

  - *Definitions :*

  1) f definie sur $[a, b[ = I$ \
  f est *continue a droite* en $a$ signifie que pour $beta > 0$, il existe un $alpha > 0$ tel que \
  Si $x in I$, $0 lt.eq x - a lt.eq alpha$ alors $|f(x) - f(a)| < beta$

  #underline[Exemple :] \
  $f(x) = sqrt(x)$, $a = 0$, $D f = [0, +infinity[$ \
  Soit $beta > 0$, existe il un $alpha > 0$ tel que $0 lt.eq x lt.eq alpha$ alors $|sqrt(x) - sqrt(0)| < beta$ \
  on sait que $|sqrt(x)| < beta arrow.double sqrt(x) < beta arrow.double 0 lt.eq x lt.eq beta^2$
]

// Source: Parascolaire Analyse p.28

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  ainsi on peut choisir $alpha = beta^2$ d'ou l'existence de $alpha$ par suite f
  est continue a droite en 0.

  2) f definie sur $]b, a] = I$ \
  f est *continue a gauche* en $a$ signifie que pour tout $beta > 0$, il
  existe un $alpha > 0$ tel que pour tout $x in I$, $0 < a - x < alpha$ alors $|f(x) - f(a)| < beta$

  #underline[theoreme :] \
  f definie sur I intervalle ouvert contenant $a$, f est *continue en $a$* \
  $arrow.l.r.double$ f est continue a droite et a gauche en $a$.

  #v(0.3cm)
  *Continuite sur un intervalle :*

  - f est continue sur $]a, b[ arrow.l.r.double$ f est continue en tout point $x_0 in ]a, b[$.
  - f est continue sur $[a, b[ arrow.l.r.double$ f est continue sur $]a, b[$ et a droite en $a$.
  - f est continue sur $]a, b] arrow.l.r.double$ f est continue sur $]a, b[$ et a gauche en $b$.

  #v(0.3cm)
  *Operations sur les fonctions continues sur un intervalle :*

  #underline[Theoremes:]
  + Toute fonction polynome est continue sur $RR$.
  + Toute fonction rationnelle est continue sur son domaine de definition.
  + $x mapsto sqrt(x)$ est continue sur $[0, +infinity[$.
  + fonction continue sur I et positif $arrow.double sqrt(f)$ est continue sur I.
  + f et g sont continues sur I, $alpha in RR arrow.double f times g$, $f + g$ et $alpha f$ sont continues sur I.
  + f est g sont continues sur I et $g(x) eq.not 0 arrow.double frac(f, g)$ est continue sur I.

  #v(0.5cm)
  *Le theoreme des valeurs intermediaires :*

  - *Theoreme :* \
  #rect(stroke: 0.5pt, inset: 6pt)[L'image d'un intervalle par une fonction continue est un intervalle.]

  - *Definition :* f definie sur un intervalle A alors $f(A) = {f(x) "tel que" x in A}$.

  - *Theoreme des valeurs intermediaires :* \
  f continue sur un intervalle I, $a$, $b$ deux reels de I \
  Pour tout reel $k$ compris entre $f(a)$ et $f(b)$ il existe au moins sur $c$
  compris entre $a$ et $b$ tel que $f(c) = k$.

  #v(0.3cm)
  - *Cas particulier :* \
  Si f continue sur un intervalle I, $a$ et $b$ deux reels de $I (a < b)$ et $f(a) dot f(b) < 0$ \
  alors l'equation $f(x) = 0$ admet au moins une solution dans $]a, b[$.

  - Remarque : Si on sait de plus que f est croissante ou decroissante sur $[a, b]$
  alors la solution est unique.
]

// Source: Parascolaire Analyse p.29

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  - *Interpretation graphique :*

  #grid(
    columns: (1fr, 1fr),
    gutter: 0.5cm,
    [
      f continue sur $[a, b]$ et $zeta$ est
      la courbe de f. \
      Pour tout reel $k$ compris
      entre $f(a)$ et $f(b)$,
      la droite $Delta : y = k$ coupe
      au moins une fois la courbe $zeta$.
    ],
    [
      // Figure: illustration TVI - courbe sinusoidale coupee par droite horizontale
      #cetz.canvas({
        import cetz.draw: *
        // Axes
        line((-3, 0), (4.5, 0), stroke: 0.5pt, mark: (end: ">"))
        line((0, -3.5), (0, 3.5), stroke: 0.5pt, mark: (end: ">"))
        // Courbe sinusoidale approximative
        let pts = ()
        for i in range(-25, 45) {
          let x = i / 10
          let y = 2.5 * calc.sin(x * 1.2)
          pts.push((x, y))
        }
        line(..pts, stroke: 1pt)
        // Droite horizontale y = k
        line((-2.5, 1), (4, 1), stroke: (dash: "dashed", paint: gray))
        content((4.2, 1), $k$)
      })
    ],
  )
]

#v(0.5cm)

#underline[*Remarque :*] \
Le theoreme des valeurs intermediaires assure l'existence d'au moins une
solution a l'equation $f(x) = k$. \
Mais il n'indique pas comment la calculer ni le nombre de solution de cette
equation.

#v(0.5cm)

#underline[*Exemple :*] \
$f(x) = x^3 + 4x^2 + 4x + 2$ \
Montrer sur l'equation $f(x) = 0$ admet au moins une solution dans $[-3, -1]$. \
*Reponse :* $f(-3) = -1$ et $f(-1) = 1$ \
f est une fonction polynome donc continue sur $RR$ \
donc f est continue sur $[-3, -1]$ \
comme $f(-3) dot f(-1) = -1 < 0$ \
donc il existe au moins un $c in ]-3, -1[$ tel que $f(c) = 0$ \
ainsi $c$ est une solution de $f(x) = 0$.


// ─────────────────────────────────────────────────────────────────────────────
// ENONCES (pages 30–34)
// ─────────────────────────────────────────────────────────────────────────────

#pagebreak()

// Source: Parascolaire Analyse p.30

#align(center)[
  #text(size: 18pt, weight: "bold")[ENONCES]
]

#v(0.5cm)

// --- Exercice 1 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*1*] *Vrai - Faux*

Dire si l'affirmation est vraie ou fausse. Justifier votre reponse :

+ $f(x) = x^3 - 3x^2 + x - 5$ est continue sur $RR$.
+ La fonction partie entiere est continue sur $[5, 7[$.
+ l'equation $E(x) = frac(1, 3)$ n'a pas de solution.
+ f est definie sur $[0, 1]$ telle que $f(0) = -3$ et $f(1) = 3$ \
  alors il existe un reel $c in [0, 1]$ tel que $f(x) = 0$.
+ l'equation $x^2 - x - 1 = 0$ admet au moins une solution comprise
  entre $-1$ et 2.

#v(0.5cm)

// --- Exercice 2 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*2*] *QCM*

Indiquer la bonne reponse par a, b ou c avec justification :

1) La fonction $f(x) = frac(x^2 + 3x - 5, x - 1)$ est continue sur :

#grid(
  columns: 3,
  gutter: 1cm,
  [#rect(stroke: 0.5pt, inset: 3pt)[a] $]-infinity, 1[$],
  [#rect(stroke: 0.5pt, inset: 3pt)[b] $RR - {1}$],
  [#rect(stroke: 0.5pt, inset: 3pt)[c] $]1, +infinity[$],
)

2) f une fonction continue sur $[-2, 5]$ et $f(-2) = 1$ et $f(5) = -4$ \
alors on peut dire que l'equation $f(x) = -1$

#grid(
  columns: 1,
  gutter: 0.3cm,
  [#rect(stroke: 0.5pt, inset: 3pt)[a] n'admet pas de solution.],
  [#rect(stroke: 0.5pt, inset: 3pt)[b] admet une seule solution.],
  [#rect(stroke: 0.5pt, inset: 3pt)[c] admet au moins une solution.],
)

3) la fonction partie entiere est continue :

#grid(
  columns: 1,
  gutter: 0.3cm,
  [#rect(stroke: 0.5pt, inset: 3pt)[a] sur $RR$.],
  [#rect(stroke: 0.5pt, inset: 3pt)[b] sur tout intervalle $[n, n + 1[$ avec $n in ZZ$.],
  [#rect(stroke: 0.5pt, inset: 3pt)[c] sur $[0, 1[$.],
)

4) La fonction $f(x) = sqrt(|x - 1|)$ est continue sur :

#grid(
  columns: 3,
  gutter: 1cm,
  [#rect(stroke: 0.5pt, inset: 3pt)[a] $RR$],
  [#rect(stroke: 0.5pt, inset: 3pt)[b] $RR - {1}$],
  [#rect(stroke: 0.5pt, inset: 3pt)[c] $[1, +infinity[$],
)

#v(0.5cm)

// --- Exercice 3 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*3*] $zeta_1$, $zeta_2$ et $zeta_3$ sont les representations graphiques des trois fonctions f, g et h definies sur $[-1, 2]$.

a) Dire dans chaque cas si la fonction est continue sur $[-1, 2]$.

b) Si la fonction n'est pas continue sur $[-1, 2]$ citer un intervalle sur le quel est continue.

// Source: Parascolaire Analyse p.31

// Trois graphiques cote a cote (zeta_1, zeta_2, zeta_3)
#grid(
  columns: 3,
  gutter: 0.5cm,
  [
    // zeta_1 : courbe continue passant par (-1, -1) montant a (0, 2) descendant a (2, -1) avec point ferme
    #cetz.canvas({
      import cetz.draw: *
      set-style(stroke: 0.5pt)
      line((-1.5, 0), (2.5, 0), mark: (end: ">"))
      line((0, -1.5), (0, 2.5), mark: (end: ">"))
      // Courbe
      let pts = ((-1, -1), (-0.5, 1), (0, 2), (0.5, 1.5), (1, 0.5), (2, -1))
      line(..pts, stroke: 1pt)
      circle((-1, -1), radius: 0.06, fill: black)
      circle((2, -1), radius: 0.06, fill: black)
      // Graduations
      content((1, -0.3), $1$)
      content((2, -0.3), $2$)
      content((-1, -0.3), $-1$)
      content((-0.3, 1), $1$)
      content((-0.3, 2), $2$)
      content((-0.4, -1), $-1$)
    })
  ],
  [
    // zeta_2 : courbe avec discontinuite en x=1 (saut)
    #cetz.canvas({
      import cetz.draw: *
      set-style(stroke: 0.5pt)
      line((-1.5, 0), (2.5, 0), mark: (end: ">"))
      line((0, -1.5), (0, 2.5), mark: (end: ">"))
      // Branche gauche [-1, 1[
      let pts1 = ((-1, -1), (-0.5, 0), (0, 0.5), (0.5, 1), (1, 2))
      line(..pts1, stroke: 1pt)
      circle((-1, -1), radius: 0.06, fill: black)
      circle((1, 2), radius: 0.06, fill: black)
      // Branche droite ]1, 2]
      let pts2 = ((1, -0.5), (1.5, -0.3), (2, 0))
      line(..pts2, stroke: 1pt)
      circle((1, -0.5), radius: 0.06, fill: white, stroke: 0.5pt)
      circle((2, 0), radius: 0.06, fill: black)
      // Graduations
      content((1, -0.3), $1$)
      content((2, -0.3), $2$)
      content((-1, -0.3), $-1$)
      content((-0.3, 1), $1$)
      content((-0.3, 2), $2$)
      content((-0.4, -1), $-1$)
    })
  ],
  [
    // zeta_3 : courbe avec point isole en x=1 (valeur differente de la limite)
    #cetz.canvas({
      import cetz.draw: *
      set-style(stroke: 0.5pt)
      line((-1.5, 0), (2.5, 0), mark: (end: ">"))
      line((0, -1.5), (0, 3.5), mark: (end: ">"))
      // Courbe passant par (-1, 0), montant a (0.5, 3), descendant a (2, 1) avec point isole en (1, 1)
      let pts = ((-1, 0), (-0.5, 1), (0, 2), (0.5, 3), (1, 2), (1.5, 1.5), (2, 1))
      line(..pts, stroke: 1pt)
      // Point plein en (2, 1)
      circle((2, 1), radius: 0.06, fill: black)
      // Graduations
      content((1, -0.3), $1$)
      content((2, -0.3), $2$)
      content((-1, -0.3), $-1$)
      content((-0.3, 1), $1$)
      content((-0.3, 2), $2$)
      content((-0.3, 3), $3$)
    })
  ],
)

#v(0.5cm)

// --- Exercice 4 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*4*] Parmi les fonctions suivantes. Indiquer celles qui sont continues sur $RR$.

$ f(x) = 3x^2 - x - 3 #h(2cm) g(x) = frac(x - 1, x^2 + 4) $

$ h(x) = E(x) #h(2cm) ell(x) = frac(3, x) $

$ "et" #h(1cm) phi.alt(x) = frac(|x| + 3, |x| + 1) $

#v(0.5cm)

// --- Exercice 5 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*5*] Justifier la continuite de f en un point $a$ :

+ $f(x) = 2x + sqrt(x + 3)$ ; $a = 0$.
+ $f(x) = frac(x - 1, x + 2)$, $a = 2$.
+ $f(x) = |x - 1| + 2x + 1$, $a = 1$.
+ $f(x) = frac(sqrt(2x - 1), x - 1)$, $a = frac(1, 2)$.
+ $f(x) = sqrt(3x^2 + x + 7)$, $a = -1, 7$.

#v(0.5cm)

// --- Exercice 6 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*6*]

$ f(x) = cases(
  -x &"si" x lt.eq 0,
  x^2 &"si" 0 < x < 1,
  x - 1 &"si" x gt.eq 1
) $

+ Tracer $zeta$ la courbe representative de f dans un repere.
+ Justifier que f est continue sur $]-infinity, 0]$, sur $]0, 1[$ puis sur $]1, +infinity[$.

// Source: Parascolaire Analyse p.32

3) Justifier a l'aide du graphique que f n'est pas continue en 1.

4) Determiner a l'aide du graphique le nombre de solution de chacune equations :

#grid(
  columns: 2,
  gutter: 2cm,
  [a) $f(x) = 1$],
  [b) $f(x) = -1$],
)

#v(0.5cm)

// --- Exercice 7 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*7*] Soit la fonction definie sur $RR$ par $f(x) = x^3 - 4x + 5$. \
Montrer que l'equation $f(x) = 8$ admet au moins une solution comprise entre $-2$ et 3.

#v(0.5cm)

// --- Exercice 8 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*8*] Montrer que l'equation $x^3 + frac(3, 2) x^2 + 1 = 0$ admet au moins une solution \
Dans $[-2, 1]$.

#v(0.5cm)

// --- Exercice 9 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*9*] $f(x) = x^4 - 4x^2 - x + 1$

+ Calculer $f(-2)$, $f(-1)$, $f(0)$, $f(1)$ et $f(3)$.
+ Montrer que l'equation $f(x) = 0$ admet exactement 4 solutions.

#v(0.5cm)

// --- Exercice 10 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*10*]

+ Montrer que l'equation $sqrt(x - 2) = frac(8, x^2)$ admet au moins une solution $alpha$ \
  dans $[3, +infinity[$.
+ Verifier que $alpha$ est aussi une solution de $x^5 - 2x^4 - 64 = 0$.

#v(0.5cm)

// --- Exercice 11 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*11*] On considere les fonctions f et g definies par $f(x) = x^2 + 1$
et $g(x) = -frac(1, x)$

+ Tracer dans un meme repere $(o, arrow(i), arrow(j))$ la courbe representative de f
  puis celle de g.
+ a) Justifier que f est continue sur $RR$. \
  b) Justifier que g est continue sur $RR^*$.
+ Determiner graphiquement le nombre de solution de l'equation $f(x) = g(x)$
  sur $[-2, 2]$.
+ Montrer que l'equation $f(x) = g(x)$ admet au moins une solution $alpha$ sur
  $[-2, 2]$ et determiner une valeur approchee de $alpha$ a $10^(-2)$ pres par defaut.

// Source: Parascolaire Analyse p.33

#v(0.5cm)

// --- Exercice 12 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*12*] $zeta$ est la courbe representative de la fonction f definie sur $RR$.

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    1) Determiner $f(0)$, $f(1)$, $f(2)$.
    2) Resoudre graphiquement :
    #grid(columns: 2, gutter: 1cm,
      [a) $f(x) = 0$],
      [b) $f(x) gt.eq 0$],
    )
    (figure courbe)
    3) Quelles sont les images par f des intervalles suivants: \
    $I = ]-1, 1[$, $J = [0, 2[$, $K = ]2, 3]$, $L = ]-2, 2[$, $H = [2, +infinity[$
    4) Determiner l'ensemble des antecedents positif par f des reels de
    l'intervalle $[-1, 0]$
  ],
  [
    // Figure: courbe avec minimum local, passant par (0,2), (1,0), (2,-1) remontant
    #cetz.canvas({
      import cetz.draw: *
      set-style(stroke: 0.5pt)
      line((-3.5, 0), (3.5, 0), mark: (end: ">"))
      line((0, -2.5), (0, 4.5), mark: (end: ">"))
      // Courbe approx
      let pts = ((-3, 3.5), (-2, 0.5), (-1, -0.5), (0, 2), (1, 0), (1.5, -1), (2, -1), (3, 3.5))
      line(..pts, stroke: 1pt)
      // Graduations
      content((1, -0.3), $1$)
      content((2, -0.3), $2$)
      content((3, -0.3), $3$)
      content((-1, -0.3), $-1$)
      content((-2, -0.3), $-2$)
      content((-3, -0.3), $-3$)
      content((-0.3, 1), $1$)
      content((-0.3, 2), $2$)
      content((-0.3, 3), $3$)
      content((-0.3, 4), $4$)
      content((-0.4, -1), $-1$)
      content((-0.4, -2), $-2$)
    })
  ],
)

#v(0.5cm)

// --- Exercice 13 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*13*] A partir des tableaux de variations suivant trouver $f(I)$ dans chaque cas :

1) #table(
  columns: 3,
  align: center,
  [$x$], [$-infinity$], [$2$],
  [$f(x)$], [], [$arrow 1$],
  [], [$-infinity$ $arrow.tr$], [],
)
$I = ]-infinity, 2]$

2) #table(
  columns: 4,
  align: center,
  [$x$], [$-2$], [$0$], [$3$],
  [$f(x)$], [], [$arrow 1$], [],
  [], [$-4$ $arrow.tr$], [], [$-4$ $arrow.bl$],
)
a) $I = [-2, 0]$ #h(1cm) b) $I = [0, 3]$ #h(1cm) c) $I = [-2, 3]$

3) #table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$1$], [$3$], [$+infinity$],
  [$f(x)$], [$7$], [], [$5$], [],
  [], [$arrow.bl$], [$2$ $arrow.tr$], [], [$-infinity$ $arrow.bl$],
)
a) $I = ]-infinity, 1]$ #h(0.5cm) b) $I = [1, 3]$ #h(0.5cm) c) $I = ]-infinity, 3]$ \
d) $I = [3, +infinity[$ #h(0.5cm) e) $I = RR$.

#v(0.5cm)

// --- Exercice 14 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*14*] Soit f la fonction definie par $f(x) = x^2 sqrt(x - 3)$

1) a) Determiner D le domaine de definition de f. \
   b) Etudier la continuite de f sur D. \
   c) Etudier les variations de f et dresser le tableau de variation de f.

2) a) Montrer que l'equation $f(x) = 4$ possede une seule solution sur $]3, +infinity[$. \
   b) Donner un encadrement d'amplitude $10^(-2)$ de cette solution.

#v(0.5cm)

// --- Exercice 15 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*15*] $f(x) = sqrt(x) + x$

a) justifier la continuite de f sur $[0, +infinity[$. \
b) Montrer que f est strictement croissante sur $[0, +infinity[$.

// Source: Parascolaire Analyse p.34

c) En deduire que l'equation $f(x) = 5$ admet une solution $alpha$ sur $[3, 4]$.

#v(0.5cm)

// --- Exercice 16 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*16*] $f(x) = 2x^3 - 3x^2 - 1$ definie sur $RR$.

+ Justifier la continuite de f sur $RR$.
+ a) Completer le tableau de variation de f.

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$0$], [$1$], [$+infinity$],
  [$f(x)$], [], [$?$], [], [$+infinity$],
  [], [$?$ $arrow.tr$], [], [$?$ $arrow.tr$], [],
)

b) Determiner les images des intervalles suivants par f : $[0, 1]$ ; $]1, +infinity[$.

3) a) Montrer que l'equation $f(x) = 0$ admet une seule solution sur $RR$. \
   b) Verifier que $alpha in [1, 6 ; 1, 7]$.

4) Deduire alors le signe de $f(x)$ sur $RR$.


// ─────────────────────────────────────────────────────────────────────────────
// CORRIGES (pages 35–41)
// ─────────────────────────────────────────────────────────────────────────────

#pagebreak()

// Source: Parascolaire Analyse p.35

#align(center)[
  #text(size: 18pt, weight: "bold")[CORRIGES]
]

#v(0.5cm)

// --- Corrige Exercice 1 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*1*] *Vrai - Faux*

+ Vrai : f est une fonction polynome donc continue sur $RR$.
+ Faux : $x mapsto E(x)$ n'est pas continue en tout entier en particulier en 6.
+ Vrai : $E(x)$ est un entier donc $eq.not frac(1, 3)$.
+ Faux : f doit etre continue pour appliquer le theoreme de cours.
+ Vrai : on pose $f(x) = x^3 - x - 1$ continue sur $RR$ et $f(-1) = -1$
  et $f(2) = 5$ et $f(2) times f(-1) = -5 < 0$ f est continue sur $[-1, 2]$ \
  $arrow.double$ il existe au moins sur $C in ]-1, 2[$ tel que $f(C) = 0$.

#v(0.5cm)

// --- Corrige Exercice 2 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*2*]

1) La reponse est #rect(stroke: 0.5pt, inset: 2pt)[b] car f est une fonction rationnelle donc continue
   sur $D f = RR - {1}$.

2) La reponse est #rect(stroke: 0.5pt, inset: 2pt)[c] car f est continue sur $[-2, 5]$ \
   $arrow.double h : x mapsto f(x) + 1$ est continue sur $[-2, 5]$. \
   $h(-2) = f(-2) + 1 = 2$ \
   $h(5) = f(5) + 1 = -4 + 1 = -3$ \
   $h(-2) times h(5) < 0$ \
   $arrow.double$ il existe au moins un $c in [-2, 5]$ tel que $h(c) = 0 arrow.double f(c) = -1$.

3) La reponse est #rect(stroke: 0.5pt, inset: 2pt)[b] la partie entiere est continue sur $RR - ZZ$.

4) La reponse est #rect(stroke: 0.5pt, inset: 2pt)[a] la fonction $x mapsto sqrt(|x - 1|)$ est continue sur $D f = RR$.

#v(0.5cm)

// --- Corrige Exercice 3 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*3*]

a) Les courbes representatives des fonctions f et h sont tracees sans
lever le crayon alors f et $f_1$ sont continues sur $[-1, 2]$

- $zeta_g$ n'est pas continue en $1 arrow.double$ g n'est pas continue sur $[-1, 2]$.

b) g est continue sur $[-1, 0]$ par exemple (sur $[1, 2]$).

#v(0.5cm)

// --- Corrige Exercice 4 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*4*]

- f est une fonction polynome $arrow.double$ f continue sur $RR$.
- g est une fonction rationnelle definie sur $RR arrow.double$ g est continue sur $RR$.
- $phi.alt$ est definie sur $RR$ et $|x|$ continue sur $RR$.

Conclusion : f, g, $phi.alt$ sont continues sur $RR$ remarque \
(h continue sur $RR - ZZ$ ; $ell$ continue sur $RR^*$).

// Source: Parascolaire Analyse p.36

#v(0.5cm)

// --- Corrige Exercice 5 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*5*]

$x mapsto 2x$ est continue sur $RR$.

+ $x mapsto sqrt(x + 3)$ continue sur son domaine de definition $[-3, +infinity[$ \
  en particulier en 0. \
  $arrow.double$ f est continue sur $[-3, +infinity[$ en particulier en 0.

+ f est une fonction rationnelle donc continue sur $D f = RR - {-2}$ donc
  f continue en 2.

+ $x mapsto x - 1$ continue sur $RR arrow.double x mapsto |x - 1|$ continue sur $RR$. \
  $x mapsto 2x + 1$ une fonction polynome $arrow.double$ continue sur $RR$ \
  d'ou f est continue sur $RR$ en particulier en 1.

+ $x mapsto sqrt(2x - 1)$ est continue en $frac(1, 2)$. \
  $x mapsto frac(1, x - 1)$ est rationnelle $arrow.double$ continue sur $RR - {1} arrow.double$ continue en $frac(1, 2)$ \
  d'ou f est continue en $frac(1, 2)$.

+ $f(x) = sqrt(3x^2 + x + 7)$ est continue sur $D f = RR$ car $Delta = -20 < 0$ \
  d'ou f est continue en $-1,7$.

#v(0.5cm)

// --- Corrige Exercice 6 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*6*]

1) sur $]-infinity, 0]$ on trace la demi droite d'equation $y = -x$ et $x lt.eq 0$ \
   sur $]0, 1[$ on trace une branche de parabole $y = x^2$ \
   sur $[1, +infinity[$ on trace la demi-droite d'equation $y = x - 1$ et $x gt.eq 1$.

// Figure de la fonction par morceaux
#cetz.canvas({
  import cetz.draw: *
  set-style(stroke: 0.5pt)
  // Axes
  line((-2, 0), (3, 0), mark: (end: ">"))
  line((0, -0.5), (0, 2), mark: (end: ">"))
  content((3.2, 0), $x$)
  content((0, 2.2), $y$)
  content((-0.2, -0.2), $O$)
  content((1, -0.3), $1$)
  // y = -x pour x <= 0
  line((-1.5, 1.5), (0, 0), stroke: 1pt)
  // y = x^2 pour 0 < x < 1
  let pts = ()
  for i in range(1, 10) {
    let x = i / 10
    let y = x * x
    pts.push((x, y))
  }
  line((0, 0), ..pts, stroke: 1pt)
  // y = x-1 pour x >= 1
  line((1, 0), (2.5, 1.5), stroke: 1pt)
  // Points
  circle((1, 1), radius: 0.06, fill: white, stroke: 0.5pt) // point ouvert en (1,1) sur parabole
  circle((1, 0), radius: 0.06, fill: black) // point ferme en (1,0) sur la droite
  // Labels
  content((2.2, 1.5), $y = 1$, anchor: "west")
  content((-1.5, 1.7), text(size: 8pt)[$F$])
  content((1.5, 0.7), text(size: 8pt)[$E$])
})

2) - $x mapsto -x$ continue sur $RR arrow.double x mapsto -x$ est continue sur $]-infinity, 0]$ \
   d'ou f est continue sur $]-infinity, 0]$.
   - $x mapsto x^2$ polynome $arrow.double$ continue sur $RR$ en particulier sur $]0, 1[$ \
   d'ou f est continue sur $]0, 1[$.
   - $x mapsto x - 1$ fonction polynome donc continue sur $RR$ et en particulier
   sur $[1, +infinity[ arrow.double$ f est continue sur $[1, +infinity[$.

3) La fonction f ne peut etre tracee sans lever la main en 1 \
   $arrow.double$ f est discontinue en 1.

4) a) $f(x) = 1$ la droite d'equation $y = 1$ coupe $zeta$ f en deux points F et E
   d'abscisses respectives $-1$ et 2 donc 2 solutions.

   b) $f(x) = -1$, la droite d'equation $y = -1$ ne coupe pas $zeta$ f donc le nombre de
   solution est 0.

// Source: Parascolaire Analyse p.37

#v(0.5cm)

// --- Corrige Exercice 7 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*7*]

$f(x) = x^3 - 4x + 5$ est une fonction polynome donc continue sur $RR$ et \
$f(-2) = 5$ et $f(3) = 20$ or $5 < 8 < 20$ alors d'apres le theoreme des valeurs
intermediaire il existe au moins un reel $alpha in [-2, 3]$ tel que $f(alpha) = 8$ ainsi $alpha$ est une
solution de $f(x) = 8$.

#v(0.5cm)

// --- Corrige Exercice 8 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*8*]

On pose $f(x) = x^3 + frac(3, 2) x^2 + 1$ est une fonction polynome donc continue
sur $RR$ et $f(-2) = -8 + frac(3, 2) dot 4 + 1 = -1$ et $f(1) = frac(7, 2)$

$f$ continue sur $[-2, 1]$ \
$f(1) dot f(-2) = frac(-7, 2) < 0$ $arrow.double$ il existe au moins sur $c in ]-2, 1[$ tel que $f(c) = 0$ \
par suite $c$ est une solution de l'equation $f(x) = 0$.

#v(0.5cm)

// --- Corrige Exercice 9 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*9*]

$f(x) = x^4 - 4x^2 - x + 1$

1) $f(-2) = 16 - 16 + 2 + 1 = 3$ \
   $f(-1) = 1 - 4 + 1 + 1 = -1$ \
   $f(0) = 1$ \
   $f(1) = 1 - 4 - 1 + 1 = -3$ \
   $f(3) = 3^4 - 4 dot 3^2 - 3 + 1 = 81 - 36 - 3 + 1 = 43$ (Note: actually in the book: $f(3) = 81 - 36 - 2 = 43$... let me keep exactly what's shown)

2) f est une fonction polynome $arrow.double$ f est continue sur $RR$ \
   $arrow.double$ f est continue sur $[-2, -1]$, $[-1, 0]$, $[0, 1]$ et $[1, 3]$

   f continue sur $[-2, -1]$ \
   $f(-2) dot f(-1) = -3 < 0$ $arrow.double$ il existe sur $alpha in ]-2, -1[$ tel que $f(alpha) = 0$.

   f est continue sur $[-1, 0]$ \
   $f(-1) dot f(0) = -1 < 0$

   d'apres le theoreme des valeurs intermediaires il existe $beta in ]-1, 0[$
   tel que $f(beta) = 0$ de meme sur $[0, 1]$ on a $f(0) dot f(1) = -3 < 0$ \
   et sur $[1, 3]$ et $f(1) dot f(3) < 0$ \
   $arrow.double$ il existe $delta in ]0, 1[$ et $lambda in ]1, 3[$ tel que $f(delta) = 0$ et $f(lambda) = 0$

   comme $f(x) = 0$ est une equation de $4^("eme")$ degre donc $alpha, beta, delta$ et $lambda$ sont les seules
   solutions de l'equation $f(x) = 0$.

// Source: Parascolaire Analyse p.37-38

#v(0.5cm)

// --- Corrige Exercice 10 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*10*]

1) $sqrt(x - 2) = frac(8, x^2)$ pour $x gt.eq 3$ est equivalente a $x^2 sqrt(x - 2) = 8$ \
   on pose $f(x) = x^2 sqrt(x - 2)$ il faut alors resoudre $f(x) = 8$. \
   On remarque que $f(3) = 0$ et $f(4) = 16$ \
   Comme f est le produit d'une fonction polynome qui est continue
   sur $RR$ et d'une racine carree qui est continue sur $[2, +infinity[$ \
   $arrow.double$ f est continue sur $[3, +infinity[$ \
   comme 8 est comprise entre $f(3)$ et $f(4)$ alors d'apres le theoreme
   de valeurs intermediaires l'equation $f(x) = 8$ admet au moins
   une solution $alpha in ]3, 4[ subset ]3, +infinity[$

2) On a $f(alpha) = 8 arrow.double.long alpha^2 sqrt(alpha - 2) = 8 arrow.double.long alpha^4 (alpha - 2) = 64$ (en elevant au carre) \
   $alpha^5 - 2 alpha^4 - 64 = 0$ \
   d'ou $alpha$ est une solution de l'equation $x^5 - 2x^4 - 64 = 0$.

// Source: Parascolaire Analyse p.38

#v(0.5cm)

// --- Corrige Exercice 11 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*11*]

1) $zeta_f$ est une parabole de sommet $S(0, 1)$ d'axe de systeme $(S, arrow(j))$.

#table(
  columns: 4,
  align: center,
  [$x$], [$0$], [$1$], [$2$],
  [$f(x)$], [$1$], [$2$], [$5$],
)

$zeta_g$ est une hyperbole d'asymptotes $x = 0$ et $y = 0$ de centre
de symetrie $O(0, 0)$

#table(
  columns: 5,
  align: center,
  [$x$], [$frac(1, 2)$], [$1$], [$2$], [$4$],
  [$g(x)$], [$-2$], [$-1$], [$-frac(1, 2)$], [$-frac(1, 4)$],
)

// Figure: parabole et hyperbole
#cetz.canvas({
  import cetz.draw: *
  set-style(stroke: 0.5pt)
  line((-3.5, 0), (4.5, 0), mark: (end: ">"))
  line((0, -4.5), (0, 4.5), mark: (end: ">"))
  content((-0.2, -0.2), $O$)
  // Parabole f(x) = x^2 + 1
  let pts_f = ()
  for i in range(-20, 21) {
    let x = i / 10
    let y = x * x + 1
    if y < 4.5 { pts_f.push((x, y)) }
  }
  line(..pts_f, stroke: 1pt + blue)
  // Hyperbole g(x) = -1/x pour x > 0
  let pts_g1 = ()
  for i in range(3, 40) {
    let x = i / 10
    let y = -1 / x
    pts_g1.push((x, y))
  }
  line(..pts_g1, stroke: 1pt + red)
  // Hyperbole g(x) = -1/x pour x < 0
  let pts_g2 = ()
  for i in range(-40, -2) {
    let x = i / 10
    let y = -1 / x
    if y < 4.5 { pts_g2.push((x, y)) }
  }
  line(..pts_g2, stroke: 1pt + red)
  // Graduations
  content((1, -0.3), $1$)
  content((2, -0.3), $2$)
  content((-0.3, 1), $1$)
  content((-0.3, 2), $2$)
  content((-0.3, 3), $3$)
})

2) a) f est une fonction polynome donc f est continue sur $RR$. \
   b) g est une fonction rationnelle donc continue sur $RR^*$.

3) $zeta_f$ et $zeta_g$ se coupent en un seul point $A(-0.8, 1.4)$ donc $f(x) = g(x)$ admet
   qu'une seul solution dans $[-2, 2]$.

4) $f(x) = g(x) arrow.double.long x^2 + 1 = -frac(1, x) arrow.double.long x^3 + x + 1 = 0$ \
   on pose $h(x) = x^3 + x + 1$, $h(-2) = -9$ et $h(2) = 11$ et h est continue
   sur $[-2, 2]$ (c'est une fonction polynome) alors d'apres le theoreme
   des valeurs intermediaires l'equation $h(x) = 0$ admet au moins une solution
   dans $[-2, 2]$. Notons $alpha$ cette solution.

\* on fait un balayage de $[-2, 2]$ par pas de 0, 1
et en utilisant la calculatrice on \
obtient $h(-0.7) < 0$ et $h(-0.6) > 0 arrow.double -0.7 < alpha < -0.6$

on trouve $h(-0.69) < 0$ ; $h(-0.68) > 0$ \
d'ou $-0.69 < alpha < -0.68$ ainsi $-0.69$ est une valeur approchee
de $alpha$ a $10^(-2)$ pres par defaut.

// Source: Parascolaire Analyse p.39

#v(0.5cm)

// --- Corrige Exercice 12 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*12*]

1) $f(0) = 3$ car le point $(0, 2) in zeta$ (Note: d'apres le livre $f(0) = 3$... mais le graphique montre (0,2). On transcrit fidelement le texte du corrige.) \
   Correction fidele au texte: $f(0) = 3$ car le point $(0, 2) in zeta$ \
   $f(1) = 0$ et $f(2) = -1$

2) a) $f(x) = 0$. les solutions sont les abscisses des points d'intersection de $zeta$ et
   de l'axe des abscisses qui sont : $-3, -1, 1, 3$.

   b) $f(x) gt.eq 0$. les solutions sont les abscisses des points de $zeta$ situes au dessus
   de l'axe des abscisses d'un : $S_(RR) = ]-infinity, -3] union [-1, 1] union [3, +infinity[$

3) \* $f([-1, 1]) = ]0, 3[ = f(I)$ \
   \* $f(K) = f(]2, 3]) = ]-1, 0]$ \
   \* $f([0, 2[) = ]-1, 3] = f(J)$ \
   \* $f(L) = f(]-2, 2[) = ]-1, 3]$ \
   et $f(H) = f([2, +infinity[) = [-1, +infinity[$.

4) Les abscisses des points de $zeta$ dont les $x gt.eq 0$ et $y in [-1, 0]$ sont $x in [1, 3]$ \
   ainsi les antecedent de $[-1, 0]$ tel que $x gt.eq 0$ sont $x in [1, 3]$.

#v(0.5cm)

// --- Corrige Exercice 13 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*13*]

1) $f(]-infinity, 2]) = ]-infinity, 1]$.

2) a) $f([-2, 0]) = [-4, 1]$ #h(1cm) b) $f([0, 3]) = [-4, 1]$. \
   \* $f([-2, 3]) = [-4, 1]$.

3) a) $f(]-infinity, 1]) = [2, 7[$. \
   b) $f([1, 3]) supset [2, 5]$. \
   c) $f(]-infinity, 3]) = [2, 7[$. \
   d) $f([3, +infinity[) = ]-infinity, 5]$. \
   e) $f(RR) = ]-infinity, 7[$.

// Source: Parascolaire Analyse p.39-40

#v(0.5cm)

// --- Corrige Exercice 14 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*14*]

1) a) $f(x) = x^2 sqrt(x - 3)$ il faut que $x - 3 gt.eq 0 arrow.double.long x gt.eq 3$ d'ou $D = [3, +infinity[$.

   b) $x mapsto x - 3$ est une fonction polynome donc continue sur $RR$ en particulier
   sur $[3, +infinity[$ comme $x - 3 gt.eq 0$ sur cette intervalle alors $x mapsto sqrt(x - 3)$ est
   continue sur D. et $x mapsto x^2$ est une fonction polynome elle continue sur $RR$.
   Finalement f est continue sur D.

   c) Soient $a$ et $b$ deux reels de D tel que $a gt.eq b$ \
   alors $a - 3 gt.eq b - 3$ et $a^2 gt.eq b^2$ \
   donc $sqrt(a - 3) gt.eq sqrt(-3)$ (Note: fidele au livre, il manque b) et $a^2 gt.eq b^2$

   par suite $a^2 sqrt(a - 3) gt.eq b^2 dot sqrt(6 - 3)$ ainsi f est strictement croissante sur D.

// Tableau de variation
#table(
  columns: 3,
  align: center,
  [$x$], [$3$], [$+infinity$],
  [$f(x)$], [], [$+infinity$],
  [], [$0$ $arrow.tr$], [],
)

$f(3) = 0$ et $lim_(+infinity) f(x) = +infinity$

2) a) D'apres le tableau de variation $4 in [0, +infinity[$ alors l'equation $f(x) = 4$
   admet une unique solution $alpha$ $[3, +infinity[$

   b) \*$f(3, 17) = 4.14$ et $f(3, 16) = 3.99$. \
   \* $f(3, 16) = 3.99$ et $f(3, 17) = 4.14$ et $f(alpha) = 4$ \
   $f(3, 16) < f(alpha) < f(3, 17)$ comme f est strictement croissante sur
   $[3, +infinity[$ donc $3.16 < alpha < 3.17$.

// Source: Parascolaire Analyse p.40

#v(0.5cm)

// --- Corrige Exercice 15 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*15*]

$f(x) = sqrt(x) + x$

a) $u : x mapsto sqrt(x)$ est continue sur $[0, +infinity[$ \
   $v : x mapsto x$ est continue sur $RR$. \
   Alors $f = u + v$ est continue sur $[0, +infinity[$

b) u est strictement croissante sur $[0, +infinity[$ \
   v est strictement croissante sur $[0, +infinity[$ \
   alors $f = u + v$ est strictement croissante sur $[0, +infinity[$

c) f est continue sur $[3, 4]$ et $f(3) = sqrt(3) + 3 approx 4.7$ \
   et $f(4) = sqrt(4) + 4 = 6$ comme $4.7 < 5 < 6$ \
   alors d'apres le theoreme des valeurs intermediaires il existe au
   moins un $alpha in [3, 4]$ tel que $f(alpha) = 5$

// Source: Parascolaire Analyse p.40-41

#v(0.5cm)

// --- Corrige Exercice 16 ---
#rect(fill: luma(240), inset: 6pt, radius: 4pt)[*16*]

$f(x) = 2x^3 - 3x^2 - 1$

1) f est une fonction polynome donc f est continue sur $RR$

2) a) Tableau de variation:

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$0$], [$1$], [$+infinity$],
  [$f(x)$], [], [$1$ (Note: $f(0) = -1$)], [], [$+infinity$],
  [], [$-infinity$ $arrow.tr$], [], [$-2$ $arrow.tr$], [],
)

(Note: valeurs fideles au corrige: $f(0) = -1$ et $f(1) = 2(1) - 3(1) - 1 = -2$)

Correction du tableau fidele au livre :

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$0$], [$1$], [$+infinity$],
  [], [], [$-1$], [], [$+infinity$],
  [$f(x)$], [], [], [], [],
  [], [$-infinity$ $arrow.tr$], [], [$-2$ $arrow.tr$], [],
)

b) $f([0, 1]) = [-2, -1]$ et $f(]1, +infinity[) = ]-2, +infinity[$

3) a) sur $]-infinity, 0]$, f est strictement croissante sur $]-2, +infinity[$ \
   $f(x) lt.eq f(0)$ et $f(0) = -1$ \
   donc $f(x) lt.eq -1$ ainsi $f(x) = 0$ ne possede pas de solution sur $]0, +infinity]$

   \* sur $[0, 1]$, f est strictement decroissante \
   $arrow.double -2 lt.eq f(x) lt.eq -1 arrow.double f(x) lt.eq -1$ \
   ainsi l'equation $f(x) = 0$ n'a pas de solution dans $[0, 1]$

   \* sur $[1, +infinity[$ on a $0 in [-2, +infinity[$ \
   donc l'equation $f(x) = 0$ admet une unique solution $alpha in [1, +infinity[$ \
   finalement : $f(x) = 0 arrow.double.long x = alpha$

   b) $f(1.6) = -0.488$ et $f(1.7) = 0.156$ et $f(x) = 0$ \
   $f(1.6) < f(alpha) < f(1.7)$ comme f est strictement croissante sur $[1, +infinity[$ \
   donc $1.6 < alpha < 1.7$

// Source: Parascolaire Analyse p.41

   c) sur $]-infinity, 1]$ et d'apres a) on a $f(x) lt.eq -1$ donc $f(x) < 0$ \
   d'autre peut sur $[1, +infinity[$, f est strictement croissante \
   Si $x in [1, alpha]$ alors $f(x) lt.eq f(alpha) = 0$ \
   $arrow.double f(x) lt.eq 0$

   Si $x in [alpha, +infinity[$ alors $f(alpha) lt.eq f(x)$ \
   $arrow.double 0 lt.eq f(x)$

   conclusion :

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$1$], [$alpha$], [$+infinity$],
  [$f(x)$], [$-$], [], [$0$], [$+$],
  [], [], [$-$], [], [],
)
