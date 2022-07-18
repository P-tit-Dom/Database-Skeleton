# Documentation de l’application et de ses interactions avec la base de données illustrée par les pages de la maquette

## Introduction

Ce document a pour but de présenter l’application et la base de données en indiquant les interactions entre les deux ainsi que les fonctionnalités présentes page par page, grâce à des captures d’écrans de la maquette, un récapitulatif des fonctionnalités principales contenues sur chaque page en capture d’écran, les tables spécifiquement impliquées pour ces fonctionnalités et quelques requêtes `SQL` plus élaborées à titre d’exemple. L’ensemble des requêtes `SQL` qui ont déjà été écrites pour les 3 premières pages présentées (Page d’accueil, PEI, Paramétrage des cibles personnalisées) peuvent être retrouvées dans le document `requetes_sql`. Un autre document joint (`NOM DU DOCUMENT`) contient un descriptif de l’ensemble des fonctionnalités qui ne sont pas encore incluses dans la maquette ou la base de données, mais qui ont été étudiées et qu’il a été prévu d’intégrer à l’application.

## Page d’accueil

![Maquette Accueil](Images/Maquette_Accueil.png)

Sur la page d’accueil, un utilisateur verra les deux prochaines séances qui lui sont assignées, il pourra sélectionner un apprenant pour accéder aux différentes pages propres à cet apprenant, et selon les droits liés au statut de l’utilisateur, il pourra éventuellement accéder aux différentes pages de paramétrages de l’application.

La page d’accueil va interagir avec les tables `apprenants`, `seances`, `utilisateurs` et `roles`.

- `apprenants` : pour récupérer l’ensemble des apprenants actifs dans la barre de recherche.
- `utilisateur` et `role` : pour récupérer le rôle de l'utilisateur.
- `seances` : pour récupérer les informations des deux prochaines séances attribuées à l’utilisateur.

## PEI

![Maquette PEI](Images/Maquette_PEI.png)

Cette page permet de créer un PEI, d’y ajouter des objectifs individuellement ou en les important depuis un PEI antérieur, de définir leurs prérequis, de faire des avenants au PEI et de consulter l’historique des PEIs de l’apprenant.  
La page PEI interagit avec les tables `peis`, `objectifs_peis`, `prerequis`, `objectifs`, `objectifs_competences`, `competences`, `competences_domaines` et `domaines`.  
Pour récupérer l’ensemble des objectifs contenus dans le PEI en cours d’un apprenant, et les compétences et domaines dans lesquels ils sont inclus, voici à titre d’exemple la requête `SQL` qui va interagir avec l’ensemble de tables mentionnées ci-dessus, excepté la table `prerequis` :

```SQL
SELECT domaines.nom, competences.nom, objectifs.nom FROM domaines, competences_domaines, compétences, objectifs_competences, objectifs, objectifs_peis, peis
WHERE peis.identifiant_apprenant="apprenant1"
AND peis.cloture IS NULL
AND peis.id=objectifs_peis.id_pei
AND objectifs_peis.nom_objectif=objectifs.nom
AND objectifs.nom=objectifs_competences.nom_objectif
AND objectifs_competences.nom_competence=competences.nom
AND competences.nom=competences_domaines.nom_competence
AND competences_domaines.nom_domaine=domaines.nom
ORDER BY domaines.nom, competences.nom, objectifs.nom
```

## Paramétrage des cibles personnalisées

![Maquette Paramétrage Cibles](Images/Maquette_Parametrage_Cibles.png)

Cette page permet de définir les cibles des objectifs propres à un apprenant. Ces cibles peuvent être ajoutées et retirées individuellement, ou importées depuis des modèles récupérables pour chaque apprenant et qu’il est possible de définir depuis cette même page. Il est également possible de copier la sélection des cibles d’un objectif d’un apprenant pour les coller chez un autre apprenant. De plus, sur cette page s’effectue la gestion du classeur PECS de l’apprenant.

Cette page interagit spécifiquement avec les tables `modeles`, `cibles_defaut`, `cibles_individuelles`.  
Elle interagit avec les tables `peis_objectifs`, `objectifs`, `objectifs_competences`, `compétences`, `competences_domaines` et `domaines` pour récupérer l’ensemble des objectifs du PEI de l’apprenant.  
Elle interagit en particulier avec la table `log_cibles` pour déterminer si des cotations sont enregistrées pour une cible ou si elle est vierge, ce qui influencera la façon dont elle sera supprimée de la liste des cibles d’un objectif, de sorte à ne pas perdre les enregistrements si elle en contient.

## Fiche de cotation

![Maquette Fiche de cotation](Images/Maquette_Fiche_Cotation.png)

Cette page permet de créer une fiche de cotation assignée à un intervenant, pour une séance et un apprenant donné. Cela consiste donc à ajouter des objectifs du PEI à la séance et à définir pour chacun les modalités d’évaluation. On accède depuis cette page à la fiche d’évaluation journalière d’un apprenant en cliquant sur le bouton « Lancer une séance ». La gestion des cibles en maintien se fait également depuis cette page avec la possibilité d’ajouter ou de retirer des cibles de la liste des maintiens.  
Cette page va ainsi interagir spécifiquement avec les tables `seances`, `cibles_seances`, `cibles_individuelles`, `comportements_seances` (le choix des comportements présents dans une fiche d’évaluation se fait depuis la page Suivi) et la table `validations`.

## Fiche d’évaluation journalière

![Maquette Fiche d’évaluation journalière](Images/Maquette_Fiche_Evaluation.png)

Cette page permet de rentrer les évaluations pour les différents types de cibles intégrées à la fiche de cotation, de compter l’apparition des comportements au cours de la séance et d’évaluer les cibles en maintien.
Elle va essentiellement interagir avec les tables `log_cibles` et `log_comportements`.
