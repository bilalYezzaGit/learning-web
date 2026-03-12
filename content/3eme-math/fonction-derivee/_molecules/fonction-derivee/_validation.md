# Validation — fonction-derivee (cours)

**Date** : 2026-03-11
**Module** : 3eme-math/fonction-derivee
**Molecule** : fonction-derivee
**Atomes analyses** : 7
**KB disponible** : oui (_kb.md)
**Planning disponible** : oui (_molecules/fonction-derivee/_planning.yaml, status: generated)

## Synthese

| Verdict | Nombre |
|---------|--------|
| PASS    | 7      |
| WARN    | 0      |
| FAIL    | 0      |

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
