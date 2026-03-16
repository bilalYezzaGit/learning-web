// Série : Dérivabilité en un point — Mr Khammour.K — 3ème Math
// Transcription fidèle du PDF source

#import "@preview/cetz:0.3.2"

#set page(margin: (top: 1.2cm, bottom: 1.2cm, left: 1.5cm, right: 1.5cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "fr")
#set par(justify: true)
#set enum(numbering: "1)")

// ──────────────── En-tête ────────────────
#grid(
  columns: (1fr, auto, 1fr),
  align: (left, center, right),
  [Mr : Khammour.K],
  [*Série : Dérivabilité en un point*],
  [3#super[ème] Math],
)
#line(length: 100%, stroke: 0.5pt)

#v(0.4cm)

// ══════════════ Exercice n°1 ══════════════
*Exercice n°1 :*

Étudier la dérivabilité de chacune des fonctions suivantes en $a$ :

+ $f(x) = |x^2 - 4|(x - 2)$ #h(1fr) $a = 2 , quad a = -2$ #h(0.5cm) et $a in ]- 2 , 2[$

+ $g(x) = (x + 1) sqrt(x + 1)$ #h(1fr) $a = 0 , quad a = -1$

+ $h(x) = |x^2 - 1| + |x + 1|$ #h(1fr) $a = 1 , quad a = -1 , quad a < -1$

+ $f(x) = frac(x, x - 1)$ #h(1fr) $a = 0 , quad a = 2$

+ $f(x) = sqrt(x^2 - 4)$ #h(1fr) $a = 2 , quad a = 5$

+ $f(x) = cases(
    frac(2 x^2 - x - 1, x - 1) & "si" x eq.not 1,
    3 & "si" x = 1,
  )$ #h(1fr) $a = 1 , quad a = -2$

#v(0.4cm)

// ══════════════ Exercice n°2 ══════════════
*Exercice n°2 :*

Soit $f$ une fonction et $C_f$ sa courbe dans un plan rapporté dans un repère orthonormé $(O , arrow(I) , arrow(J))$.

Écrire une équation de la tangente à $C_f$ au point d'abscisse $a$.

+ $f(x) = 10 x^3 - 5 x + 6$ #h(1fr) $a = 1$

+ $f(x) = (x + 1) sqrt(x + 1)$ #h(1fr) $a = 1$

+ $f(x) = frac(x, x - 1)$ #h(1fr) $a = 2$

#v(0.4cm)

// ══════════════ Exercice n°3 ══════════════
*Exercice n°3 :*

+ Donner l'approximation affine au voisinage de $0$ de la fonction $f(x) = sqrt(x + 1)$.

+ En déduire une valeur approchée de chacun des réels $sqrt(1{,}009)$ et $sqrt(1{,}09)$.

#v(0.4cm)

// ══════════════ Exercice n°4 ══════════════
*Exercice n°4 :*

Soit la fonction $g$ définie sur $RR$ par :

$ g(x) = cases(
  x sqrt(x + 2) - sqrt(x + 2) & "si" x gt.eq 1,
  -x sqrt(x + 2) + sqrt(x + 2) & "si" x lt.eq 1,
) $

+ Déterminer le domaine de définition de $g$.
+ Étudier la dérivabilité de $g$ en $-2$, en $-1$ et en $1$.
+ Interpréter graphiquement les résultats.

#v(0.4cm)

// ══════════════ Exercice n°5 ══════════════
*Exercice n°5 :*

Soit la fonction $f$ définie par $f(x) = -x^2 + 2 x - 1$

+ Soit $a$ un réel non nul, calculer $f'(a)$
+ Déterminer les abscisses des points de $C_f$ où la tangente :

  a) Est horizontale.

  b) Admet $3$ pour coefficient directeur.

  c) Est parallèle à $Delta : y = -frac(1, 2) x + 5$

#v(0.4cm)

// ══════════════ Exercice n°7 ══════════════
*Exercice n°7 :*

La courbe ci-dessous représente la courbe d'une fonction $f$ dans un repère orthonormé $(O , arrow(I) , arrow(J))$.

// ─── Figure Exercice 7 ───
#align(center)[
  #cetz.canvas(length: 0.55cm, {
    import cetz.draw: *

    // Grille
    for x in range(-4, 7) {
      line((x, -4), (x, 6), stroke: gray.lighten(60%) + 0.3pt)
    }
    for y in range(-4, 7) {
      line((-4, y), (6, y), stroke: gray.lighten(60%) + 0.3pt)
    }

    // Axes
    set-style(mark: (fill: black, size: 0.2))
    line((-4.3, 0), (6.5, 0), mark: (end: ">"))
    line((0, -4.3), (0, 6.5), mark: (end: ">"))
    content((6.5, -0.4), $x$)
    content((-0.5, 6.5), $y$)
    content((0.3, -0.4), $O$)

    // Repère : points I et J
    line((1, -0.1), (1, 0.1), stroke: 0.5pt)
    line((-0.1, 1), (0.1, 1), stroke: 0.5pt)

    // Droite d : y = -x + 2 (pointillée)
    line((-3, 5), (6, -4), stroke: (dash: "dashed", paint: black, thickness: 0.6pt))
    content((-3.2, 5.5), $d$)

    // Asymptote verticale x = 0 (déjà l'axe y)

    // Courbe Cf — branche gauche (x < 0)
    // La courbe est légèrement au-dessus de d pour x << 0 puis diverge vers -∞ en x→0⁻
    catmull(
      (-4, 6.3), (-3, 5.4), (-2, 4.7), (-1, 4.5),
      (-0.5, 5), (-0.3, 6),
      stroke: blue + 1pt,
    )

    // Courbe Cf — branche droite (x > 0)
    // Arrive de +∞ en x→0⁺, point anguleux en x=1, puis en x=3
    catmull(
      (0.15, 6), (0.3, 4), (0.5, 2.5), (0.8, 1.5), (1, 1),
      stroke: blue + 1pt,
    )
    // Segment anguleux de (1, 1) à (3, -1)
    line((1, 1), (3, -1), stroke: blue + 1pt)
    // De (3, -1) vers l'asymptote d
    catmull(
      (3, -1), (4, -1.7), (5, -2.7), (6, -3.8),
      stroke: blue + 1pt,
    )

    // Labels
    content((4.5, -1), $C_f$, anchor: "north")

    // Points remarquables
    circle((1, 1), radius: 0.08, fill: blue, stroke: none)
    circle((3, -1), radius: 0.08, fill: blue, stroke: none)
  })
]

Répondre graphiquement

+ L'ensemble de définition de $f$.
+ $f$ est-elle dérivable en $1$ ? si oui calculer $f'(1)$
+ $f$ est-elle dérivable en $3$ ? si oui calculer $f'(3)$
+ Calculer $lim_(x -> +oo) [f(x) - (1 - x)]$ #h(0.5cm) ; #h(0.5cm) $lim_(x -> -oo) [f(x) - (1 - x)]$
+ Calculer $lim_(x -> 0^+) f(x)$ #h(0.5cm) ; #h(0.5cm) $lim_(x -> 0^-) f(x)$

#v(0.4cm)

// ══════════════ Exercice n°8 ══════════════
*Exercice n°8 :*

La courbe ci-dessous représente la courbe d'une fonction $f$ dans un repère orthonormé $(O , arrow(I) , arrow(J))$

// ─── Figure Exercice 8 ───
#align(center)[
  #cetz.canvas(length: 0.5cm, {
    import cetz.draw: *

    // Grille
    for x in range(-6, 6) {
      line((x, -4), (x, 5), stroke: gray.lighten(60%) + 0.3pt)
    }
    for y in range(-4, 6) {
      line((-6, y), (5, y), stroke: gray.lighten(60%) + 0.3pt)
    }

    // Axes
    set-style(mark: (fill: black, size: 0.2))
    line((-6.3, 0), (5.5, 0), mark: (end: ">"))
    line((0, -4.3), (0, 5.5), mark: (end: ">"))
    content((5.5, -0.4), $x$)
    content((-0.5, 5.5), $y$)
    content((0.3, -0.4), $O$)

    // Repère
    line((1, -0.1), (1, 0.1), stroke: 0.5pt)
    line((-0.1, 1), (0.1, 1), stroke: 0.5pt)

    // Asymptotes verticales x = 0 et x = -2 (pointillées)
    line((-2, -4), (-2, 5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))

    // Branche 1 : x < -2
    // Passe par (-3, 0), va vers y ≈ 1 pour x → -∞, descend vers -∞ en x → -2⁻
    catmull(
      (-6, 0.8), (-5, 0.6), (-4, 0.2), (-3, 0), (-2.5, -1.5), (-2.2, -4),
      stroke: blue + 1pt,
    )

    // Branche 2 : -2 < x < 0
    // Vient de +∞ en x → -2⁺, passe par (-1, 4), monte vers +∞ en x → 0⁻
    catmull(
      (-1.8, 5), (-1.5, 2.5), (-1, 4), (-0.5, 2), (-0.2, 5),
      stroke: blue + 1pt,
    )

    // Branche 3 : x > 0
    // Vient de -∞ en x → 0⁺, passe par (1, 0), tend vers y ≈ 1 pour x → +∞
    catmull(
      (0.2, -4), (0.5, -1.5), (1, 0), (2, 0.5), (3, 0.8), (5, 0.95),
      stroke: blue + 1pt,
    )

    // Points remarquables
    circle((-3, 0), radius: 0.08, fill: blue, stroke: none)
    circle((1, 0), radius: 0.08, fill: blue, stroke: none)

    // Labels
    content((3, 1.5), $C_f$, anchor: "south")
    content((-3, -0.5), $-3$, anchor: "north")
    content((-2, -0.5), $-2$, anchor: "north")
  })
]

+ Déterminer le domaine de définition de $f$.
+ Calculer $f'(-1)$.
+ Calculer $lim_(x -> -3) frac(f(x), x + 3)$ #h(1cm) $lim_(x -> 1) frac(f(x), x - 1)$

+ Calculer $lim_(x -> +oo) f(x)$ ; $lim_(x -> -oo) f(x)$ ; $lim_(x -> 0^+) f(x)$ ; $lim_(x -> 0^-) f(x)$ ; $lim_(x -> -2^+) f(x)$ et $lim_(x -> -2^-) f(x)$

#v(0.4cm)

// ══════════════ Exercice n°9 ══════════════
*Exercice n°9 :*

// ─── Figure Exercice 9 ───
#align(center)[
  #cetz.canvas(length: 0.5cm, {
    import cetz.draw: *

    // Grille
    for x in range(-9, 10) {
      line((x, -5), (x, 5), stroke: gray.lighten(60%) + 0.3pt)
    }
    for y in range(-5, 6) {
      line((-9, y), (9, y), stroke: gray.lighten(60%) + 0.3pt)
    }

    // Axes
    set-style(mark: (fill: black, size: 0.2))
    line((-8.5, 0), (9, 0), mark: (end: ">"))
    line((0, -5.3), (0, 4.5), mark: (end: ">"))
    content((9, -0.4), $x$)
    content((-0.5, 4.5), $y$)
    content((0.3, -0.4), $O$)

    // Graduations sur l'axe x
    for x in (-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8) {
      line((x, -0.1), (x, 0.1), stroke: 0.4pt)
    }
    // Graduations sur l'axe y
    for y in (-4, -3, -2, -1, 1, 2, 3, 4) {
      line((-0.1, y), (0.1, y), stroke: 0.4pt)
      content((-0.5, y), text(size: 7pt)[#y])
    }

    // Graduation spéciale -3/2
    line((-1.5, -0.15), (-1.5, 0.15), stroke: 0.5pt)
    content((-1.5, -0.6), text(size: 7pt)[$-frac(3,2)$])

    // Asymptote verticale x = 0 (axe y, déjà tracé)

    // Courbe Cf
    // Branche x ≤ -2 : plate sur l'axe des x (f ≈ 0)
    line((-8, 0), (-2, 0), stroke: blue + 1pt)

    // Point anguleux en x = -2, puis bosse vers (-3/2, 1), redescend vers (-1, 0)
    catmull(
      (-2, 0), (-1.75, 0.6), (-1.5, 1), (-1.25, 0.6), (-1, 0),
      stroke: blue + 1pt,
    )

    // De (-1, 0) monte vers +∞ en x → 0⁻
    catmull(
      (-1, 0), (-0.7, 0.5), (-0.4, 2), (-0.2, 4),
      stroke: blue + 1pt,
    )

    // Branche x > 0 : vient de +∞ en x → 0⁺, décroît vers 0
    catmull(
      (0.2, 4), (0.4, 2), (0.7, 0.8), (1, 0.5), (2, 0.2), (4, 0.05), (8, 0.01),
      stroke: blue + 1pt,
    )

    // Points remarquables
    circle((-2, 0), radius: 0.08, fill: blue, stroke: none)
    circle((-1.5, 1), radius: 0.08, fill: blue, stroke: none)
    circle((-1, 0), radius: 0.08, fill: blue, stroke: none)

    // Flèches tangentes au sommet (schématiques)
    line((-2.1, -0.2), (-1.6, 0.8), stroke: (paint: black, thickness: 0.6pt), mark: (end: ">"))
    line((-0.9, -0.2), (-1.4, 0.8), stroke: (paint: black, thickness: 0.6pt), mark: (end: ">"))

    // Labels
    content((3, 1), $C_f$, anchor: "south")
  })
]

+ a) Déterminer l'ensemble de définition de $f$.

  b) Déterminer les limites de $f$ en $+oo$ et en $-oo$.

+ a) $f$ est-elle dérivable en $-2$ ? Justifier votre réponse.

  b) Déterminer les limites suivantes en le justifiant :

  $ lim_(x -> -1^-) frac(f(x), x + 1) quad ; quad lim_(x -> -1^+) frac(f(x), x + 1) quad "et" quad lim_(x -> -3 slash 2) frac(f(x) - f(-3 slash 2), x + 3 slash 2) $

2) Déterminer les intervalles sur lesquelles $f$ est dérivable

3) Dresser un tableau de variations complet de $f$

#v(1cm)

// ──────────────── Pied de page ────────────────
#align(center)[
  #grid(
    columns: (1fr, 1fr),
    align: (left, right),
    [Mr:Khammour.Khalil],
    [Tel:27509639],
  )
]
