# Projet PF5

# 1- Fonctionnalités

Dans ce projet, il est possible de dessiner a l'aide de L-Systemes, c'est a dire a l'aide d'une chaîne de symboles que la tortue interpretera 
comme des mouvements. Les fonctionnalités de base sont faites notamment la tortue et l'interpretation des L-Systemes.
Pour la tortue, les fonctions move, line et turn sont implémentées ainsi que les fonctions de store et restore permettant de stocker la position
de la tortue pour pouvoir la réutiliser aprés.
Nous n'avons pas implémentés la lecture de fichier par consequents si nous voulons changer de L-Systeme nous devons changer les ligne 23,25 (main.ml).
Pour avancer dans les etapes d'une L-Systeme il suffit de faire `espace` et si nous voulons tout refaire il suffit de faire `c`

# 2- Compilations et éxécutions

Le projet dispose également d\'un `Makefile`, facilitant la compilation, et dont les détails d\'utilisation sont eux aussi spécifiés ci-dessous :
1. Pour compiler le projet, rien de plus simple : 
```
make
```
2. Le `Makefile` dispose également d\'une option de nettoyage :
```
make clean
```
3. Une fois le projet compilé, vous pouvez l\'exécuter en tapant simplement :
```
./run
```

# 3- Découpage modulaire

* turtle.ml sert bien sur, comme son nom l'indique aux mouvements de la tortue ainsi qu'aux fonctions store et restore
* systems.ml sert, lui aussi comme son nom l'indique a gérer les L-systemes
* examples.ml contient quelques exemples de L-systemes
* main.ml contient lui le main et permet de mettre en relation toutes les fonctions du projet
* custom_graphics.ml fichier ajouté et pas présent dans les fichiers donnés sert à créer une fenêtre pour l'interface graphique nécessaire car sinon on ne 
pourrait pas voir les chemins fait par la tortue et car il nous a semblé préférable de séparer la partie interface de la partie "moteur"

# 4- Organisation du travail 

Pour le travail, nous avons trouvé judicieux de commencer par la partie turtle afin qu'elle soit fonctionelle puis d'ensuite passer aux L-Systemes, pour la
partie turtle alors qu'un faisait les fonctions line turn et move l'autre faisait les fonctions store et restore 
Aprés la création d'une turtle pouvant faire tout ce qui lui était demandé, nous sommes passé aux L-Systemes et a leurs interpretations. Ces derniers, moins
bien compris par l'un des membres du groupe (Julien) ont été en grosse partie réalisé par Fabio
