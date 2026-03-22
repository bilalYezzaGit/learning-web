# Misconceptions — Denombrement

Module: denombrement
Programme: 3eme-math

## 9) Misconceptions & erreurs fréquentes

### E1 — Confusion entre arrangement et combinaison
- **Description** : L'élève utilise $A_n^p$ quand il faut $C_n^p$ (ou inversement), car il ne distingue pas si l'ordre intervient
- **Fréquence** : très fréquente
- **Source cognitive** : Difficulté à déterminer si la situation est ordonnée ou non, surtout quand le contexte n'est pas explicite ("choisir" vs "ranger")
- **Question diagnostique** :
    > On tire simultanément 3 boules parmi 10 boules distinctes. Combien de tirages possibles ?
    - A) $10^3 = 1000$ — révèle : confusion avec tirages avec remise (n^p)
    - B) $A_{10}^3 = 720$ — révèle : confusion arrangement/combinaison (l'ordre n'intervient pas dans un tirage simultané)
    - C) $C_{10}^3 = 120$ — correct
    - D) $3! \times 10 = 60$ — révèle : erreur de formule
- **Remédiation** : Utiliser systématiquement le tableau récapitulatif des tirages ; poser les 3 questions : l'ordre intervient-il ? y a-t-il remise ? combien d'éléments choisis ?

### E2 — Oubli du cas complémentaire pour "au moins"
- **Description** : L'élève tente de lister tous les cas favorables au lieu de passer par le complémentaire
- **Fréquence** : fréquente
- **Source cognitive** : Réflexe de comptage direct ; le complémentaire est contre-intuitif ("compter ce qu'on ne veut pas")
- **Question diagnostique** :
    > Dans un jeu de 32 cartes, on tire 5 cartes. Le nombre de mains contenant au moins un as est :
    - A) $C_4^1 \times C_{28}^4$ — révèle : « au moins un » confondu avec « exactement un »
    - B) $C_{32}^5 - C_{28}^5$ — correct
    - C) $C_4^1 + C_4^2 + C_4^3 + C_4^4$ — révèle : oubli de multiplier par les cartes restantes
    - D) $4 \times C_{32}^4$ — révèle : erreur de modélisation
- **Remédiation** : Enseigner le réflexe "au moins = total - aucun" ; montrer que la méthode directe nécessite une disjonction en "exactement 1, exactement 2, ..." qui est plus lourde

### E3 — Erreur dans les anagrammes avec répétitions
- **Description** : L'élève calcule $n!$ sans diviser par les factorielles des lettres répétées, ou se trompe dans le décompte des répétitions
- **Fréquence** : fréquente
- **Source cognitive** : Confusion entre le cas « toutes lettres distinctes » ($n!$) et le cas avec répétitions ($\frac{n!}{p_1!\cdots p_k!}$)
- **Question diagnostique** :
    > Le nombre d'anagrammes du mot ANANAS est :
    - A) $6! = 720$ — révèle : oubli de la division par les répétitions
    - B) $\frac{6!}{3!} = 120$ — révèle : oubli de diviser aussi par le 2! des N
    - C) $\frac{6!}{3! \times 2!} = 60$ — correct
    - D) $\frac{6!}{3! \times 2! \times 1!} = 60$ — correct (le 1! ne change rien, mais l'écriture montre une bonne compréhension)
- **Remédiation** : Identifier d'abord toutes les lettres et leurs fréquences avant d'appliquer la formule

### E4 — Erreur sur le premier chiffre d'un nombre
- **Description** : L'élève oublie que le premier chiffre d'un nombre à k chiffres ne peut pas être 0
- **Fréquence** : fréquente
- **Source cognitive** : Le 0 est un chiffre comme les autres dans l'ensemble {0,...,9}, mais pas en position de tête
- **Question diagnostique** :
    > Combien peut-on former de nombres de 4 chiffres distincts avec les chiffres 0 à 9 ?
    - A) $A_{10}^4 = 5040$ — révèle : oubli de la contrainte premier chiffre ≠ 0
    - B) $9 \times A_9^3 = 4536$ — correct
    - C) $9 \times 10^3 = 9000$ — révèle : oubli de la contrainte « distincts »
    - D) $10^4 = 10000$ — révèle : oubli des deux contraintes
- **Remédiation** : Toujours traiter le premier chiffre séparément (9 choix), puis compléter avec les chiffres restants

### E5 — Confusion entre $C_n^p$ et le binôme de Newton
- **Description** : L'élève ne fait pas le lien entre les coefficients binomiaux et la formule du binôme, ou applique mal les exposants
- **Fréquence** : occasionnelle
- **Source cognitive** : Le passage de l'algèbre (développement) à la combinatoire (comptage) n'est pas naturel
- **Question diagnostique** :
    > Le coefficient de $x^3$ dans le développement de $(1+x)^5$ est :
    - A) $C_5^3 = 10$ — correct
    - B) $C_5^2 = 10$ — correct aussi (par symétrie), mais si l'élève donne $C_5^2$ par erreur de raisonnement (confondant l'exposant de $x$ et celui de $1$), c'est un faux positif
    - C) $5^3 = 125$ — révèle : confusion avec $n^p$
    - D) $3! = 6$ — révèle : confusion avec permutations
- **Remédiation** : Écrire explicitement chaque terme $C_n^k a^{n-k} b^k$ et identifier le bon $k$

### E6 — Nombres pairs avec chiffres distincts : oubli de distinguer les cas
- **Description** : L'élève ne distingue pas le cas où le dernier chiffre est 0 des autres cas pairs, ce qui mène à un double comptage ou un sous-comptage
- **Fréquence** : fréquente
- **Source cognitive** : Le cas 0 en dernière position est spécial car il ne contraint pas le premier chiffre, contrairement aux autres chiffres pairs
- **Question diagnostique** :
    > Le nombre de nombres pairs de 4 chiffres distincts (chiffres de 0 à 9) est :
    - A) $5 \times A_9^3 = 2520$ — révèle : pas de distinction de cas (traite dernier chiffre ∈ {0,2,4,6,8} sans séparer)
    - B) $504 + 1792 = 2296$ — correct (cas 0 séparé du cas pair ≠ 0)
    - C) $4 \times 9 \times 8 \times 7 = 2016$ — révèle : oubli du cas dernier chiffre = 0
    - D) $9 \times 8 \times 7 \times 5 = 2520$ — révèle : traitement comme si le dernier chiffre était indépendant du premier
- **Remédiation** : Toujours séparer en deux cas : dernier chiffre = 0 (premier chiffre a 9 choix) et dernier chiffre ∈ {2,4,6,8} (premier chiffre a 8 choix, car ≠ 0 et ≠ dernier)
