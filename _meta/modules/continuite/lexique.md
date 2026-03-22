# Lexique et regles redactionnelles — Continuite

Module: continuite
Programme: 3eme-math

## Notations specifiques

- **Alpha-beta** : la definition de la continuite utilise alpha (tolerance sur x) et beta (tolerance sur f(x)), PAS epsilon-delta
- **Partie entiere** : notee E(x), pas la notation crochet
- **Courbe** : C_f, zeta_f ou C selon la source
- **Intervalle image** : f(I), f([a,b])

## Formules de redaction consacrees

- **Justification standard** : "f est une fonction polynome, donc continue en a" (ou rationnelle, ou sqrt...)
- **Operations** : "f et g sont continues en a, donc f+g est continue en a"
- **Condition quotient** : "g est continue en a et g(a) != 0, donc f/g est continue en a"
- **Condition sqrt** : "f est continue en a et f(a) > 0, donc sqrt(f) est continue en a"
- **TVI** : "f est continue sur [a,b]. f(a) = ... et f(b) = ... D'ou f(a).f(b) < 0. Par le theoreme des valeurs intermediaires, l'equation f(x) = 0 admet au moins une solution dans ]a, b[."
- **Unicite** : "De plus, f est strictement [croissante/decroissante] sur [a,b], donc la solution est unique."
- **Image** : "f est continue et [croissante/decroissante] sur [a,b], donc f([a,b]) = [f(a), f(b)]" (ou [f(b), f(a)])

## Niveau de rigueur

- Pour la continuite par morceaux : TOUJOURS calculer les limites laterales et comparer avec f(x0)
- Pour le TVI : TOUJOURS verifier la continuite avant d'appliquer (pas un automatisme)
- Pour l'unicite : TOUJOURS preciser la monotonie (pas de raccourci)
- Pour l'image : TOUJOURS dresser le tableau de variation avant de donner f(I)

## Longueur type

- Justification de continuite simple : 2-3 lignes
- Continuite par morceaux : 6-10 lignes (calcul des limites + comparaison)
- Application du TVI : 4-6 lignes (continuite + calculs + conclusion)
- TVI + unicite : 6-8 lignes
- Image d'un intervalle : 5-8 lignes (tableau de variation + conclusion)
- Dichotomie : 8-15 lignes (tableau iteratif)
