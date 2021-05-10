## 1 - `C'est quoi un environnement virtuel ?`

Un environnement virtuel est un outil qui permet de séparer les dépendances requises par différents projets en créant des environnements virtuels python isolés pour eux. C'est l'un des outils les plus importants que la plupart des développeurs Python utilisent.
En imaginant un scénario dans lequel on travail sur deux projets web python l'un basé sur la version 1.9 de django et l'autre sur la version 1.10. Dans de telle situation, l'environnement virtuel peut être utilse afin de maintenir les dépendances des deux projets.

## 2 - `Les différentes méthodes pour créer un environnement virtuel`

`a°) conda`

"Conda est un système de gestion de paquets open source et un **système de gestion d'environnement** qui s'exécute sous Windows, macOS et Linux. Conda installe, exécute et met à jour rapidement les packages et leurs dépendances. Conda crée, enregistre, charge et bascule facilement entre les environnements de votre ordinateur local. Il a été créé pour **les programmes Python**, mais il peut empaqueter et distribuer des logiciels pour n'importe quel langage... Avec seulement quelques commandes, vous pouvez **configurer un environnement** totalement séparé pour exécuter cette version différente de Python, tout en continuant à exécuter votre version habituelle de Python dans votre environnement normal."
la définition ci-dessous a été tirée du site officiel de CONDA.
La commande `conda create --name new_env python = 3.6` permet par exemple de créer un environnement virtuel de nom new_env pour la version 3.6 de python.

`b°) virtualenv`

virtualenv est un outil pour créer des environnements Python isolés. virtualenv crée un dossier contenant tous les exécutables nécessaires pour utiliser les packages dont un projet Python aurait besoin.
La commande **pip install virtualenv** permet d'installer virtualenv et **virtualenv venv** permet de créer un dossier dans le répertoire courant qui contiendra les fichiers exécutables Python et une copie de la bibliothèque pip qu'on pourrait utiliser pour installer d'autres packages. Le nom de l'environnement virtuel (dans ce cas,c'est venv) peut être n'importe quoi.

`c°) venv`

Le module **venv** permet de créer des environnements virtuels légers avec leurs propres répertoires de site, éventuellement isolés des répertoires de site système. Chaque environnement virtuel a son propre binaire Python (qui correspond à la version qui a été utilisé pour créer cet environnement) et peut avoir son propre ensemble indépendant de packages Python installés dans ses répertoires de site.
La création d' environnements virtuels se fait en exécutant la commande venv comme par exemple :
**python3 -m venv /path/to/new/virtual/environment**.
L'exécution de cette commande crée le répertoire cible (en créant tous les répertoires parents qui n'existent pas déjà) et y place un pyvenv.cfg fichier avec une home clé pointant vers l'installation Python à partir de laquelle la commande a été exécutée (un nom commun pour le répertoire cible est .venv). Il crée également un sous-répertoire bin(ou Scripts sous Windows) contenant une copie / un lien symbolique des binaires / binaires Python (en fonction de la plate-forme ou des arguments utilisés au moment de la création de l'environnement).

`d°) pyenv`

Pipenv a été créé en raison de nombreuses lacunes de virtualenv telles que ne pas faire de distinction entre la dépendance du projet et les dépendances de la dépendance du projet, ne pas avoir de mécanisme pour distinguer les besoins de développement et de production, etc.
Pour installer pipenv, vous devez d'abord installer **pip**.
la commande **pip installer pipenv** permet d'installer pienv.
Une fois pyenv installé, on peut l'utiliser pour installer une version spécifique de python avec la commande suivante : **pyenv install -v 3.7.2**, ce qui va installer la version 3.7.2 de python.

**Explication**
- créer un environnment python38 pour python 3.8 et un autre python39 pour python 3.9

**pyenv** nous permet d'installer plusieurs version de python et de switcher entre les versions en fonction de l'environnement dans lequel on se trouve.
Pour installer python 38 et python 39 dans deux environnement différents, il faut d'abord créer chaque environnement virtuel. Pour ce faire, on peut utiliser venv.
Sous windows, on peut taper la commande suivante : **py -m venv env** qui va créer un environnement virtuel nommé env1 dans lequel on peut installer notre`version 38 de python`. 
De la même façon et dans un environnement virtuel différent comme par exemple 
env2 (**py -m venv env1**) et y installer notre `version 39 de python`. Ainsi, on a deux version de python 38 et 39 qui sont respectivement sur les environnement env et env1 qui peuvent se trouver dans le même dossier ou pas.

- installer sklearn dans python38 et kivy dans python39

Pour installer ces paquets dans mes environnement virtuel, rien de plus simple avec le gestionnaire de package `pip`.
Il suffira d'être dans le bon emplacement, env de python38 et taper la commande **pip install sklearn** ou encore **pip install kivy** si vous êtes dans env1 de python39.
Ainsi, les deux packets seront installer dans leur environnement virtuel respectif.

## 3- ajouter ces deux environnements (python38 et python39) dans jupyter-notebook.

Pour ajouter ces deux environnement virtuels dans jupyter notebook, il faut s'assurer d'abord que le noyau IPython est disponible si oui, on peut installer `ipykernel` grâce à la commande **pip install --user ipykernel**.
On peut maintenant ajouter nos environnements virtuels dans jupyter notebook grâce à la commande suivante : **python -m ipykernel install --user --name=env** pour l'environnement python38 et **python -m ipykernel install --user --name=myenv** pour l'environnement python39.
Le résutat indiquera le format json suivant :

    {
     "argv": [
      "/home/user/anaconda3/envs/myenv/bin/python",
      "-m",
      "ipykernel_launcher",
      "-f",
      "{connection_file}"
     ],
     "display_name": "env",
     "language": "python"
    } 
en fonction de l'environnemen tvirtuel.