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

#### 1. Sélection des variables et nettoyage des données

- Identification des variables clés pour l’analyse (buts, passes, minutes jouées, âge, poste, club, etc.)
- Suppression des variables inutiles ou redondantes
- Création éventuelle de nouvelles variables pour faciliter l’interprétation (ex : ratio buts/minutes jouées)
- Vérification de la présence de valeurs manquantes ou aberrantes dans le dataset
- Vérification de l’uniformisation des formats (noms de pays, abréviations des clubs, variables catégorielles, etc.)
- Vérification et correction des types de données, en s’assurant que les champs numériques sont bien au format approprié

#### 2. Analyse statistique descriptive

- Description des variables à l’aide de statistiques de base (moyenne, médiane, écart-type, etc.)
- Visualisation de la distribution globale des données (histogrammes, diagrammes en boîte, etc.)

#### 3. Comparaison des performances selon les postes

- Analyse de la répartition de l’âge, du nombre de buts et de passes décisives par poste
- Comparaison des données offensives entre les attaquants, les milieux de terrain et les défenseurs

#### 4. Analyse par club et nationalité

Répartition des performances par club
- Quels clubs comptent les joueurs les plus performants ?
- Comparaison des clubs les plus représentés dans le dataset
- Analyse de la contribution des joueurs par club

Analyse des nationalités dominantes
- Quelles nationalités sont les plus présentes en Premier League ?
- Les joueurs de certaines nationalités performent-ils mieux que d’autres ?

#### 5. Analyse croisée et visualisation avancée

- Exploration des relations linéaires ou non linéaires entre plusieurs variables numériques
- Visualisation des corrélations pour mieux comprendre les liens entre les différentes dimensions des données

#### 6. Découverte de talents et prédictions (optionnel, selon pertinence)

- Identification de groupes de joueurs présentant des caractéristiques de performance similaires
- Identification des joueurs sous-cotés (Détection des joueurs ayant un rendement élevé mais peu médiatisés)
- Prédiction du nombre de buts, de passes décisives, ou d’autres indicateurs de performance
- Construction de modèles permettant d’identifier les joueurs les plus performants offensivement

#### 7. Conclusion et recommandations

- Résumé des principales observations
- Discussion des limites des données (biais possibles, données manquantes)
- Pistes d’amélioration pour une analyse plus approfondie
