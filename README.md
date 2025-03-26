# README - Visualisation et analyse des joueurs de la Premier League

## Introduction

### Données

Les données utilisées proviennent du dataset intitulé “All Time Premier League Player”. Ce dataset représente les statistiques des joueurs de toutes les saisons de la Premier League. Ce dataset a été trouvé sur kaggle, mais il est constitué de données provenant de https://www.premierleague.com/ . Ces données sont intéressantes pour l'analyse des performances individuelles et collectives des joueurs participant à la Premier League. De plus, elles peuvent être utiles dans l'analyse sportive, puisqu'elles permettent de comparer les performances entre les différents joueurs et les différentes équipes, repérer des talents émergents et aider à une meilleure prise de décision pour les entraîneurs ainsi que les analystes sportifs. 

Le dataset est constitué de **571 joueurs et de 59 variables**. Parmi elles, on retrouve des:

- variables textuelles (ex: Name, Club, Nationality)
- variables continues (ex: Age, Goals, Shots)
- variables catégorielles (ex: Postion, qui ne prend que les valeurs “Forward”, “Goalkeeper”, “Defender”, “Midfielder”)

Le dataset est un fichier CSV, où chaque ligne représente un joueur et chaque colonne représente une variable. 

### Plan d’analyse
Afin de mieux comprendre et exploiter les données, nous avons élaboré le plan d’analyse suivant :

1.Nettoyage et prétraitement des données

Vérification de la présence de valeurs manquantes ou aberrantes dans le dataset

Vérification de l’uniformisation des formats (noms de pays, abréviations des clubs, variables catégorielles, etc.)

Vérification et correction des types de données, en s’assurant que les champs numériques sont bien au format approprié

2.Analyse statistique descriptive

Description des variables à l’aide de statistiques de base (moyenne, médiane, écart-type, etc.)

Visualisation de la distribution globale des données (histogrammes, diagrammes en boîte, etc.)

3.Comparaison des performances selon les postes

Analyse de la répartition de l’âge, du nombre de buts et de passes décisives par poste

Comparaison des données offensives entre les attaquants, les milieux de terrain et les défenseurs

4.Analyse par club et nationalité

Identification des clubs ou pays formant le plus grand nombre de joueurs de haut niveau

Évaluation des performances moyennes des joueurs selon leur club, afin de repérer d’éventuelles différences significatives

5.Analyse croisée et visualisation avancée

Exploration des relations linéaires ou non linéaires entre plusieurs variables numériques

Visualisation des corrélations pour mieux comprendre les liens entre les différentes dimensions des données

6.Découverte de talents et prédictions (optionnel, selon pertinence)

Identification de groupes de joueurs présentant des caractéristiques de performance similaires

Prédiction du nombre de buts, de passes décisives, ou d’autres indicateurs de performance

Construction de modèles permettant d’identifier les joueurs les plus performants offensivement
